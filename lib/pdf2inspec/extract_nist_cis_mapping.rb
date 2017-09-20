require 'roo'

class ExtractNistMappings
  def initialize(file)
    @file = file
    @full_excel = Array.new
    @headers = Hash.new

    open_excel
    set_working_sheet
    get_headers
    retrieve_mappings
  end

  def open_excel
    @xlsx = Roo::Excelx.new(@file)
  end

  def set_working_sheet
    @xlsx.default_sheet = 'VER 6.1 Controls'
  end

  def get_headers
    @xlsx.row(3).each_with_index {|header,i|
      @headers[header] = i
    }
  end

  def retrieve_mappings
    ((@xlsx.first_row + 3)..@xlsx.last_row).each do |row_value|
      current_row = Hash.new
      current_row[:nist] = @xlsx.row(row_value)[@headers['NIST SP 800-53 Control #']].to_s
      current_row[:nist_ver] = @xlsx.row(row_value)[@headers['NIST Ver']].to_s
      current_row[:cis] = @xlsx.row(row_value)[@headers['Control']].to_s
      current_row[:cis_ver] = @xlsx.row(row_value)[@headers['CIS Ver']].to_s
      @full_excel << current_row
    end
  end
end
