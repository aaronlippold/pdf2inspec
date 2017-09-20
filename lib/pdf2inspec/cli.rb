#!/usr/bin/env ruby
# encoding: utf-8
# author: Matthew Dromazos

require 'thor'
require_relative 'version'
require_relative 'pdf2inspec'
require_relative 'write_to_inspec'

class MyCLI < Thor
  desc 'exec', 'pdf2inspec translates a PDF Security Control Speficication to Inspec Security Profile'
  option :pdf, required: true, aliases: '-f'
  option :excl, required: true, aliases: '-x'
  option :name, required: true, aliases: '-n' 

  def exec
    prepared_data = PrepareData.new(options[:pdf], options[:excl], options[:name])
    puts prepared_data.transformed_data[1]
    #writer = WriteToInSpec.new(prepared_data)
  end

  desc 'generate_map', 'Generates mapping template from CSV to Inspec Controls'
  def generate_map
    template = %q(
    # Setting csv_header to true will skip the csv file header
    skip_csv_header: true
    width   : 80


    control.id: 0
    control.title: 15
    control.desc: 16
    control.tags:
            severity: 1
            rid: 8
            stig_id: 3
            cci: 2
            check: 12
            fix: 10
    )
    myfile = File.new('mapping.yml', 'w')
    myfile.puts template
    myfile.close
  end

  map %w{--help -h} => :help
  desc 'help', 'Help for using pdf2inspec'
  def help
    puts "\tpdf2inspec translates a PDF Secuirty Profile to Inspec controls\n\n"
    puts "\t-f --pdf : Path and file of the PDF you would like to process"
    puts "\t-n --name : The name for your new InSpec profile"
    puts "\t-V --verbose : verbose run ( for when you need to see what's broken )"
    puts "\nexample: ./pdf2inspec exec -f secureConfigruation.pdf -n my_inspec_profile\n\n"
    puts "\nexample: ./pdf2inspec exec -f secureConfigruation.pdf -n my_inspec_profile --verbose\n\n"
  end

  map %w{--version -v} => :print_version
  desc '--version, -v', "print's csv2inspec version"
  def print_version
    puts Pdf2inspec::VERSION
  end
end

MyCLI.start(ARGV)
