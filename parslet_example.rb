require 'parslet'
require 'parslet/convenience'
require 'awesome_print'

class DegreeParser < Parslet::Parser
  root :degree_groups

  rule(:degree_groups) { degree_group.repeat(0, 1) >> additional_degrees.repeat(0) }

  rule(:degree_group) { institution_name >> (newline >> degree).repeat(1).as(:degrees_attributes) }

  rule(:additional_degrees) { blank_line.repeat(2) >> degree_group }

  rule(:institution_name) { line.as(:institution_name) }

  rule(:degree) do
    year.as(:year).maybe >>
      semicolon >>
      name >>
      semicolon >>
      field_of_study
  end

  rule(:name) { segment.as(:name) }
  rule(:field_of_study) { segment.as(:field_of_study) }

  rule(:year) do
    spaces >>
      match('[0-9]').repeat(4, 4) >>
      spaces
  end

  rule(:line) do
    spaces >>
      match('[^ \r\n]').repeat(1) >>
      match('[^\r\n]').repeat(0)
  end

  rule(:segment) do
    spaces >>
      match('[^ ;\r\n]').repeat(1) >>
      match('[^;\r\n]').repeat(0)
  end

  rule(:blank_line) { spaces >> newline >> spaces }
  rule(:newline) { str("\r").maybe >> str("\n") }
  rule(:semicolon) { str(';') }
  rule(:lparn) { str('(') }
  rule(:rparn) { str(')') }
  rule(:spaces) { space.repeat(0) }
  rule(:space) { str(' ') }
  rule :integer do
    match('[0-9]').repeat(1).as(:integer)
  end
  rule(:dot) { str('.') }
  rule :real do
    integer.repeat(1) >>
    dot >>
    integer.repeat(1) >>
    dot.maybe >>
    integer.repeat(1).maybe
  end
  rule(:score) { lparn >> words >> rparn }

  # TODO: Build the sentence ( not perfect but the general idea )
  # a sentense -> space.maybe >> words >> newline.maybe >> words >> ( newline.maybe || dot )
    #'words >> word >> space word.maybe(0)' ;
    # word -> chars >> char.repeat(1) >> char.maybe

  # rule(:header) { (real.as(:section_num) >> sentences.as(:tile) >> score.as(:score)).as(:header) }
  #
  # controls(:controls) { control >> newline >> control.maybe }
  #
  # control(:control) {
  #   header >>
  #   applicability >>
  #   description >>
  #   audit >>
  #   remediation >>
  #   impact >>
  #   default_value >>
  #   references >>
  #   cis_control
  #   }
  # end

string1 = "Duke University
; Ph.D.; Biomedical Engineering

University of North Carolina
2010; M.S.; Biology
2007; B.S.; Biology"

string2 ="1.1 Ensure a separate partition for containers has been created (Scored)"

test = DegreeParser.new.parse_with_debug(string1)

ap test
