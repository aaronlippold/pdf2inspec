require 'docsplit'

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

    File.open(txt_filename).each do |line|
      @extracted_text += line.to_s.lstrip
    end
    File.delete(txt_filename)
  end
end
