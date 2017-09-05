require 'docsplit'

docs = Dir['/Users/melsharkawi/Documents/inspec-project/pdf2inspec/pdf-to-parse/*.pdf']
Docsplit.extract_text(docs, :ocr => false, :output => 'pdf-to-text')