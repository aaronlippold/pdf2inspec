require 'parslet'
require 'parslet/convenience'

class ControlParser < Parslet::Parser

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

  rule :anyChar do
    match('.')
  end

  rule :integer do
    match('[0-9]').repeat(1)
  end

  rule :word do
    match('[a-zA-Z0-9/,\.]').repeat(1)
  end

  rule :words do
    (space? >> word >> (space | dot).maybe).repeat(1)
  end

  rule(:eol?)       { str("\n").maybe }
  rule(:line_body)  { (str("\n").absent? >> any).repeat(1) }
  rule(:line)       { line_body >> eol? }
  rule(:lines)      { line.as(:line).repeat(1) }

  rule :lparn do
    str('(')
  end
  rule :rparn do
    str(')')
  end
  rule :dot do
    str('.')
  end
  rule :real do
    integer.repeat(1) >>
        dot >>
        integer.repeat(1)
  end
  rule(:score) { lparn >> word >> rparn }
  rule(:header) { (real.as(:section_num) >> words.as(:title) >> score.as(:score)).as(:header) >> newline }
  rule :applicabilityValue do
    (word >>
        space >>
        integer.repeat(1) >>
        space >>
        str('-') >>
        words).as(:applicability) >>
        newline
  end
  rule :applicability do
    str('Profile Applicability:') >>
        newline >>
        applicabilityValue
  end
  rule :description do
    str('Description:') >>
        newline >>
        lines.as(:description) >>
        newline
  end
  rule :check_text do
    str('Audit:') >>
        newline >>
        lines.as(:check_text) >>
        newline
  end
  rule :fix_text do
    str('Remediation:') >>
        newline >>
        lines.as(:fix_text) >>
        newline
  end
  rule :ref do
    str('References:') >>
        newline >>
        lines.as(:ref) >>
        newline
  end
  rule :cis do
    str('CIS Controls:') >>
        newline >>
        lines.as(:cis) >>
        newline
  end
  rule :control do
    header >>
        applicability >>
        description >>
        check_text >>
        fix_text >>
        ref >>
        cis
  end
  root :control
end

testStr = '1.1 Ensure a separate partition for containers has been created (Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
All Docker containers and their data and metadata is stored under /var/lib/docker
directory. By default, /var/lib/docker would be mounted under / or /var partitions based
on availability.
Rationale:
Docker depends on /var/lib/docker as the default directory where all Docker related files,
including the images, are stored. This directory might fill up fast and soon Docker and the
host could become unusable. So, it is advisable to create a separate partition (logical
volume) for storing Docker files.

Audit:
At the Docker host execute the below command:
grep /var/lib/docker /etc/fstab
This should return the partition details for /var/lib/docker mount point.

Remediation:
For new installations, create a separate partition for /var/lib/docker mount point. For
systems that were previously installed, use the Logical Volume Manager (LVM) to create
partitions.
Impact:
None.
Default Value:
By default, /var/lib/docker would be mounted under / or /var partitions based on
availability.

References:
1. https://www.projectatomic.io/docs/docker-storage-recommendation/

CIS Controls:
14 Controlled Access Based on the Need to Know
Controlled Access Based on the Need to Know

'

parser = ControlParser.new
begin
  parse = p parser.parse(testStr)
rescue Parslet::ParseFailed => error
  puts error.parse_failure_cause.ascii_tree
end
