#!/usr/local/bin/ruby
# encoding: utf-8
# author: Mohamed El-Sharkawi

class TextCleaner
  # Takes in text file, cleans data and writes to new text file.
  def clean_data(data)
    puts ""
    clean_data = clean_controls(data)
  end

  # Cleans control information from passed in file
  def clean_controls(extracted_data)
    controls_data = isolate_controls_data(extracted_data)
    clean_pagenum = remove_pagenum(controls_data)
    clean_section_header = remove_section_header(clean_pagenum)
    clean_whitespace = remove_newline_in_controls(clean_section_header)
    clean_special = remove_special(clean_whitespace)
    clean_data = separate_controls(clean_special)
    return clean_data
  end

  # Removes everything before and after the controls
  def isolate_controls_data(extracted_data)
    controls_data = /^1\.1.*?(?<=\)$)(?:.*\n)*?(?=Appendix)/.match(extracted_data).to_s
    return controls_data
  end

  # Removes all pagenumbers between the controls
  def remove_pagenum(extracted_data)
    clean_pagenum = extracted_data.gsub(/(\d{1,3}\|Page|\d{1,3} \| P a g e)/, '').to_s
    return clean_pagenum
  end

  # Removes section headers for each control
  def remove_section_header(extracted_data)
    clean_section_header = extracted_data.gsub(/\s\n\d{1}\s.*(?:.*\n)*?(?=\d\.\d)/, "\n\n").to_s
    return clean_section_header
  end

  # removes newlines between a control
  def remove_newline_in_controls(extracted_data)
    clean_whitespace = extracted_data.gsub(/\s\n.*?(?!d\.)/, "\n").to_s
    return clean_whitespace
  end

  # adds whitespace between different controls
  def separate_controls(extracted_data)
    add_whitespace_between_controls = extracted_data.gsub(/(.*?(?=\d\.\d{1}.*?(?<=\)$))|(.*?(?=\d\.\d{2}.*?(?<=\)$)))|(.*?(?=\d\.\d{1}.*\n.*?(?<=\)$)))|(.*?(?=\d\.\d{2}.*\n.*?(?<=\)$))))/, "\n").to_s
    return add_whitespace_between_controls
  end

  def remove_special(extracted_data)
    return extracted_data.gsub(/[\]/, "")
  end
end