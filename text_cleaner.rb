class TextCleaner
  def cleanFile
    extracted_data = ""
    File.open('/Users/melsharkawi/Documents/inspec-project/pdf2inspec/pdf-to-text/CIS_Docker_Community_Edition_Benchmark_v1.1.0.txt').each do |line|
      extracted_data += line.to_s.lstrip
    end

    clean_data = extractControls(extracted_data)
    f = File.open('pdf-to-text/cleanfile.txt', 'w')
    f.write(clean_data)
    f.close
  end

  def extractControls(extracted_data)
    controls_data = /^1\.1.*?(?<=\)$)(?:.*\n)*?(?=Appendix)/.match(extracted_data).to_s
    clean_pagenum = controls_data.gsub(/(\d{1,3}\|Page|\d{1,3} \| P a g e)/, '').to_s
    clean_section_header = clean_pagenum.gsub(/\s\n\d{1}\s.*(?:.*\n)*?(?=\d\.\d)/, "\n\n").to_s
    clean_whitespace = clean_section_header.gsub(/\s\n.*?(?!d\.)/, "\n").to_s
    add_whitespace_between_controls = clean_whitespace.gsub(/(.*?(?=\d\.\d{1}.*?(?<=\)$))|(.*?(?=\d\.\d{2}.*?(?<=\)$)))|(.*?(?=\d\.\d{1}.*\n.*?(?<=\)$)))|(.*?(?=\d\.\d{2}.*\n.*?(?<=\)$))))/, "\n\n").to_s
    clean_data = add_whitespace_between_controls
    return clean_data
  end
end

TextCleaner.new.cleanFile
