require 'docsplit'
require 'pdftotext'

class ExtractPdfText

  def initialize(file_name)
    @pdf_name = file_name
    @extracted_text = ''
    get_text
  end

  def extracted_text
    @extracted_text
  end

  def get_text
    docs = Dir[@pdf_name]
    Docsplit.extract_text(docs, :ocr => false, :output => Dir.tmpdir)
    txt_file = File.basename(@pdf_name, File.extname(@pdf_name)) + '.txt'
    txt_filename = Dir.tmpdir + '/' + txt_file
    
    File.open('data/CIS_Oracle_MySQL_Community_Server_5.7_Benchmark_v1.0.0.txt').each do |line|
      @extracted_text += line.to_s.lstrip
    end
    File.delete(txt_filename)
  end
end
