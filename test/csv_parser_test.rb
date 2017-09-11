require_relative '../csv_parser'

class Test
  csv_filename = "nist_to_cis_(1).csv"
  parser = ''
  parser = CsvParser.new(csv_filename)
end