#!/usr/bin/env ruby
# encoding: utf-8
# author: Matthew Dromazos

require 'thor'
require_relative 'version'
require_relative 'pdf2inspec'
require_relative 'write_to_inspec'

class MyCLI < Thor
  desc 'exec', 'pdf2inspec translates a PDF Security Control Speficication to Inspec Security Profile'
  option :pdf, required: true, aliases: '-c'

  def exec
    prepared_data = PrepareData.new(options[:pdf])
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
  desc 'help', 'Help for using csv2inspec'
  def help
    puts "\tcsv2inspec translates CSV to Inspec controls\n\n"
    puts "\t-c --csv : Path to DISA Stig style csv"
    puts "\t-m --mapping : Path to yaml with mapping from CSV to Inspec Controls"
    puts "\t-V --verbose : verbose run"
    puts "\nexample: ./csv2inspec exec -c stig.csv -m mapping.yml\n\n"
    puts "\nexample: './csv2inspec generate_map' to generate mapping template\n\n"
  end

  map %w{--version -v} => :print_version
  desc '--version, -v', "print's csv2inspec version"
  def print_version
    puts Pdf2inspec::VERSION
  end
end

MyCLI.start(ARGV)
