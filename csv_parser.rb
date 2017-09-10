#!/usr/local/bin/ruby
# encoding: utf-8
# author: Matthew Dromazos

require 'csv'
require 'word_wrap'
require 'json'

class CsvParser
  def initialize(csv_file)
    @csv_file = csv_file

    @controls = []
    read_csv
    puts "\nProcessed #{@controls.count} controls"
  end

  def read_csv
    nist_version = ''
    cis_version = ''
    counter = 0
    get_versions = true
    CSV.foreach(@csv_file) do |row|
      index = $.
      if get_versions
        if index == 2
          cis_version = row[4]
        elsif index == 3
          nist_version = row[0]
          get_versions = false
        end
      else
        control = if row[2] =~ /Critical/
                    counter = counter + 1
                    JSON.generate(counter => [row[0],
                                              cis_version, nist_version])
                  else
                    JSON.generate(row[3] => [row[0],
                                                    cis_version, nist_version])
                  end
        @controls.push(control)
      end
    end
  rescue => e
    puts "Exception: #{e.message}"
    puts 'Existing...'
    exit
  end
end