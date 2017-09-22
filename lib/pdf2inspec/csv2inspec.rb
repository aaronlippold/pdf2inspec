#!/usr/local/bin/ruby
# encoding: utf-8
# author: Rony Xavier rx294@nyu.edu

#require 'csv'
require 'nokogiri'
require 'inspec/objects'
require 'word_wrap'
require_relative 'text_cleaner'
require_relative 'extract_nist_cis_mapping'
require_relative 'extract_pdf_text'
require_relative 'parser'
#require 'yaml'

class Pdf2Inspec
  def initialize(pdf_file, excl_file, profile_name)
    @pdf_file = pdf_file
    @excl_file = excl_file
    @name = profile_name

    @controls = []
    @csv_handle = nil
    @cci_xml = nil
    @nist_mapping = nil
    @pdf_text = ''
    @clean_text = ''
    @transformed_data = ''

    read_pdf
    clean_pdf_text
    get_transformed_data
    read_excl
    create_skeleton
    parse_controls
    generate_controls
    create_json
    puts "\nProcessed #{@controls.count} controls"
  end

  private

  def read_pdf
    @pdf_text = ExtractPdfText.new(@pdf_file).extracted_text
  end

  def clean_pdf_text
    @clean_text = TextCleaner.new.clean_data(@pdf_text)
  end

  def get_transformed_data
    @transformed_data = PrepareData.new(@clean_text).transformed_data
  end

  def read_excl
    excel = ExtractNistMappings.new(@excl_file)
    @nist_mapping = excel.full_excl
  # rescue => e
  #   puts "Exception: #{e.message}"
  #   puts 'Existing...'
  #   exit
  end

  # sets max length of a line before line break
  def wrap(s, width = 78)
    s.gsub!(/\\r/, "   \n")
    WordWrap.ww(s.to_s, width)
  end

  def create_skeleton
    system("inspec init profile #{@name}")
    system("rm #{@name}/controls/example.rb")
  end

  def create_json
    system("inspec json #{@name} | jq . | tee #{@name}-overview.json")
  end

  def get_impact(severity)
    impact = case severity
             when 'low' then 0.3
             when 'medium' then 0.5
             else 0.7
             end
    impact
  end

  # converts passed in data into InSpec format
  def parse_controls
    @transformed_data.each do |contr|
      print '.'
      nist = find_nist(contr[:title].split(' ')[0])
      control = Inspec::Control.new
      control.id = 'M-' + contr[:title].split(' ')[0]
      control.title = contr[:title]
      control.desc = contr[:descr]
      control.impact = get_impact('medium')
      control.add_tag(Inspec::Tag.new('ref', contr[:ref])) unless contr[:ref].nil?
      control.add_tag(Inspec::Tag.new('severity', 'medium'))
      control.add_tag(Inspec::Tag.new('applicability', contr[:applicability])) unless contr[:applicability].nil?
      control.add_tag(Inspec::Tag.new('cis_id', contr[:title].split(' ')[0])) unless contr[:title].nil?
      control.add_tag(Inspec::Tag.new('cis_control', contr[:cis])) unless contr[:cis].nil? # tag cis_control: [5, 6.1] ##6.1 is the version
      control.add_tag(Inspec::Tag.new('cis_level', contr[:level])) unless contr[:level].nil?
      control.add_tag(Inspec::Tag.new('nist', [nist])) unless nist.nil?  # tag nist: [AC-3, 4]  ##4 is the version
      control.add_tag(Inspec::Tag.new('audit', contr[:check])) unless contr[:check].nil?
      control.add_tag(Inspec::Tag.new('fix', contr[:fix])) unless contr[:fix].nil?
      control.add_tag(Inspec::Tag.new('Default Value', contr[:default])) unless contr[:default].nil?
      @controls << control
    end
  end


  # Writes InSpec controls to file
  def generate_controls
    @controls.each do |control|
      file_name = control.id.to_s
      myfile = File.new("#{@name}/controls/#{file_name}.rb", 'w')
      width = 80
      myfile.puts wrap(control.to_ruby, width)
      myfile.close
    end
  end

  private

  def find_nist(cis)
    @nist_mapping.each do |mapping|
      if mapping[:cis] == cis
        #puts mapping[:nist]
        return mapping[:nist]
      end
    end
    return "Not Mapped"
  end
end
