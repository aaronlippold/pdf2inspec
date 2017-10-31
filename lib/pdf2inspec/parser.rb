require 'parslet'
require 'parslet/convenience'

class ControlParser < Parslet::Parser

  root :controls

  rule :controls do
    newline.maybe >>
    control.repeat(1) >>
    newline.maybe
  end

  rule :control do
    header >>
    applicability >>
    description >>
    rationale.maybe >>
    audit.maybe >>
    remediation.maybe >>
    impact.maybe >>
    default_value.maybe >>
    references.maybe >>
    cis_controls.maybe >>
    newline.maybe >>
    newline.maybe
  end

  rule :attribute do
    header.absent? >>
    (
    description |
    rationale |
    audit |
    remediation |
    impact |
    default_value |
    references |
    cis_controls
    )
  end

  rule :attribute_absent do
    str('Description:').absent? >>
    str('Rationale:').absent? >>
    str('Audit:').absent? >>
    str('Remediation:').absent? >>
    str('Impact:').absent? >>
    str('Default Value:').absent? >>
    str('References:').absent? >>
    str('CIS Controls:').absent? >>
    str("\n\n").absent?
  end

  rule(:header) do
    (real.as(:section_num) >>
    title.as(:title) >>
    score.as(:score)).as(:header) >>
    newline
  end

  rule(:title) do
    (str('(Scored)').absent? >> str('(Not Scored)').absent? >> str('(Not').absent?  >> (words | lparn | rparn | newline) | space).repeat(1)
  end

  rule :applicability do
    str('Profile Applicability:') >>
    newline.maybe >>
    space? >>
    applicabilityValue
  end

  rule :applicabilityValue do
    (word >>
     space >>
     integer.repeat(1) >>
     (space >>
     str('-') >>
     words).maybe).as(:applicability) >>
    newline
  end

  rule :description do
    str('Description:') >>
    newline >>
    lines('Rationale:').as(:description)
  end

  rule :rationale do
    str('Rationale:') >>
    newline >>
    lines('Audit:').as(:rationale)
  end

  rule :audit do
    str('Audit:') >>
    newline >>
    lines('Remediation:').as(:audit)
  end

  rule :remediation do
    str('Remediation:') >>
    newline >>
    lines('Impact:').as(:remediation)
  end

  rule :impact do
    str('Impact:') >>
    newline >>
    lines('Default Value:').as(:impact)
  end

  rule :default_value do
    str('Default Value:') >>
    newline >>
    lines('References:').as(:default_value)
  end

  rule :references do
    str('References:') >>
    newline >>
    lines('CIS Controls:').as(:references)
  end

  rule :cis_controls do
    str('CIS Controls:') >>
    newline >>
    lines("\n").as(:cis_controls) >>
    newline.maybe
  end

  rule :blank_line do
    spaces >> newline >> spaces
  end

  rule :newline do
    str("\r").maybe >> str("\n")
  end

  rule :semicolon do
    str(';')
  end

  rule :spaces do
    space.repeat(0)
  end

  rule :space do
    str(' ')
  end

  rule :space? do
    space.maybe
  end

  rule :hyphen do
    str('-')
  end

  # @FIXME doesn't the parslet `any` function alreayd take care of this?
  rule :anyChar do
    match('.')
  end

  rule :integer do
    match('[0-9]').repeat(1)
  end

  rule :word do
    match('[a-zA-Z0-9/,\.:\'\"*]').repeat(1)
  end

  rule :words do
    (space? >> word >> (space | dot | hyphen).maybe).repeat(1) >> (newline >> (word >> space).repeat(1)).maybe
  end

  def line_body(ending)
    (attribute_absent >> any).repeat(1)
  end

  def line(ending)
    line_body(ending)
  end

  def lines(ending)
    line(ending).as(:line).repeat(1)
  end

  rule(:eol?) { str("\n").maybe }
  rule(:eof?) { any.absent? }

  rule :dot do
    str('.')
  end

  rule :real do
    integer.repeat(1) >>
    dot >>
    integer.repeat(1)
  end

  rule(:score) { lparn >> scored >> rparn }

  rule :lparn do
    str('(')
  end

  rule :rparn do
    str(')')
  end

  rule :scored do
    (str('Scored') | str('Not Scored') | (str('Not') >> newline.maybe >> str('Scored')))
  end
end

class Trans < Parslet::Transform
  rule(:line => simple(:text)) { text }
  rule(:section_num => simple(:section), :title => simple(:title), :score => simple(:score)) { section + title + score }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
       :audit => sequence(:audit), :remediation => sequence(:remediation), :impact => sequence(:impact), :default_value => sequence(:default_value),
       :references => sequence(:references), :cis_controls => sequence(:cis_controls)) { {:title => header.to_s , :level => applicability.to_s,
        :descr => description[0].to_s + rationale[0].to_s, :check => audit[0].to_s, :fix => remediation[0].to_s, :impact => impact[0].to_s, :default => default_value[0].to_s,
        :ref => references[0].to_s, :cis => cis_controls[0].to_s} }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
       :audit => sequence(:audit), :remediation => sequence(:remediation),
       :references => sequence(:references)) { {:title => header.to_s , :level => applicability.to_s,
        :descr => description[0].to_s + rationale[0].to_s, :check => audit[0].to_s, :fix => remediation[0].to_s,
        :ref => references[0].to_s } }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
      :audit => sequence(:audit), :remediation => sequence(:remediation), :impact => sequence(:impact),
      :references => sequence(:references)) { {:title => header.to_s , :level => applicability.to_s,
       :descr => description[0].to_s + rationale[0].to_s, :check => audit[0].to_s, :fix => remediation[0].to_s, :impact => impact[0].to_s,
       :ref => references[0].to_s} }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
       :audit => sequence(:audit), :remediation => sequence(:remediation), :impact => sequence(:impact)) { {:title => header.to_s , :level => applicability.to_s,
        :descr => description[0].to_s + rationale[0].to_s, :check => audit[0].to_s, :fix => remediation[0].to_s, :impact => impact[0].to_s} }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
       :audit => sequence(:audit), :remediation => sequence(:remediation), :default_value => sequence(:default_value),
       :references => sequence(:references)) { {:title => header.to_s , :level => applicability.to_s,
        :descr => description[0].to_s + rationale[0].to_s, :check => audit[0].to_s, :fix => remediation[0].to_s, :default => default_value[0].to_s,
        :ref => references[0].to_s} }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
       :audit => sequence(:audit), :remediation => sequence(:remediation), :impact => sequence(:impact), :default_value => sequence(:default_value),
       :references => sequence(:references)) { {:title => header.to_s , :level => applicability.to_s,
        :descr => description[0].to_s + rationale[0].to_s, :check => audit[0].to_s, :fix => remediation[0].to_s, :impact => impact[0].to_s, :default => default_value[0].to_s,
        :ref => references[0].to_s} }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
       :audit => sequence(:audit), :remediation => sequence(:remediation)) { {:title => header.to_s , :level => applicability.to_s,
        :descr => description[0].to_s + rationale[0].to_s, :check => audit[0].to_s, :fix => remediation[0].to_s} }
end

class PrepareData
  def initialize(clean_text)
    @parser = ControlParser.new
    @attributes = []

    data = parse(clean_text)

    @transformed_data = Trans.new.apply(data)
    add_cis
  end

  def transformed_data
    @transformed_data
  end

  def parse(clean_text)
    begin
      # puts "############"
      # puts "Parse Data"
      # puts "############"
      parse = @parser.parse(clean_text)
        # parse = p parser.parse(extracted_data)
    rescue Parslet::ParseFailed => error
      puts error.parse_failure_cause.ascii_tree
    end
  end

  def convert_str(value)
    value.to_s
  end

  def add_cis
    @transformed_data.map do |ctrl|
      if !ctrl[:cis] and ctrl[:ref]
        references = ctrl[:ref].split("\n")
        references.each do |ref|
          match = ref.scan(/(?<=#)\d{1,}\.\d{1,}/).map(&:inspect).join(',').gsub(/\"/, '').gsub(/,/, ' ')
          if match.length > 0
            puts match
            ctrl[:cis] = match.split(' ')
          end
        end
        if !ctrl[:cis]
          ctrl[:cis] = "No CIS Control"
        end
      elsif !ctrl[:cis] and !ctrl[:ref]
        ctrl[:cis] = 'No CIS Control'
      end
    end
  end
end
