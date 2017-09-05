class TextParser
  def initialize
    @extracted_data = Array.new
  end

  def cisMapper()
    # pull excel and put into hash
  end

  def get_desc
    # stub
  end

  def get_level
    # stub
  end

  def get_applicability
    # stub
  end

  def get_cis
    # stub
  end

  def get_ref
    # stub
  end

  def get_check_text
    # stub
  end

  def get_fix_text
    # stub
  end

  def storeFileToArray
    cis_file = Array.new
    File.open("pdf-to-parse/CIS_Docker_Community_Edition_Benchmark_v1.1.0.txt").each do |line|
      cis_file << line
    end
    return cis_file
  end

  def tocCleanup(line)
    line = line.to_s.strip
    content_name, pagenum = line.split(".... ")
    content_name = content_name.gsub(/\.{2,100}/, '')
    content_id = /\d{1,2}\.\d{1,2}/.match(content_name)
    title = content_name.gsub(/\d{1,2}\.\d{1,2}\s/, '')
    pagenum = pagenum
    return content_id, title, content_name, pagenum
  end

  def tocHash(line)
    current_hash = {}
    content_id, title, content_name, pagenum = tocCleanup(line)
    current_hash[:id] = content_id.to_s.strip
    current_hash[:title] = title.strip
    current_hash[:content_name] = content_name.strip
    current_hash[:pagenum] = pagenum.to_s.strip
    return current_hash
  end

  def parseTableOfContents(cis_text_file)
    table_of_contents = Array.new
    second_line = false
    toc_start = false
    first_half = ""
    cis_text_file.each do |line|
      if /Table of Contents/.match(line)
        toc_start = true
      end
      # \d{1,2}\.\d{1,2}(.*?(?<=\.\s\d{3})|.*?(?<=\.\s\d{2})|.*\n.*?(?<=\.\s\d{3})|.*\n.*?(?<=\.\s\d{2}))
      if toc_start == true
        if /\d{1,2}\.\d{1,2}.*?(?<=\.\s\d{3})/.match(line) || /\d{1,2}\.\d{1,2}.*?(?<=\.\s\d{2})/.match(line)
          control = tocHash(line)
          table_of_contents << control
        elsif second_line == true
          if /.*?(?<=\.\s\d{3})/.match(line) || /.*?(?<=\.\s\d{2})/.match(line)
            full_line = first_half.strip + line
            second_line = false
            control = tocHash(full_line)
            table_of_contents << control
          end
        elsif /\d{1,2}\.\d{1,2}.*/.match(line)
          second_line = true
          first_half = line
        end
      end
    end
    return table_of_contents
  end

  def parseControlSection(inputText, table_of_contents)
    current_section = {:id => "", :title => "", :desc => "", :level => "", :applicability => "", :cis => "", :ref => "", :check_text => "", fix_text => ""}
    # loop through each element in table of contents
    # jump to page based on table of contents
    # regex to pull relevant data
    # store data in current_section Hash
    # add current_section hash to extracted_data array
  end

end

cis_text_file = TextParser.new.storeFileToArray
table_of_contents = TextParser.new.parseTableOfContents(cis_text_file)
