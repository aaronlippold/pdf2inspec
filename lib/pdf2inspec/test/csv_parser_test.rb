require_relative '../csv_parser'

class Test
  csv_filename = "../../../data/nist2cis.csv"
  parser = ''
  parser = CsvParser.new(csv_filename)
end
