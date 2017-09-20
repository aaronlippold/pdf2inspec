require 'parslet'
require 'parslet/convenience'


class ControlParser < Parslet::Parser

  root :controls

  rule :controls do
    control.repeat(1)
  end

  rule :control do
    header >>
    applicability >>
    description >>
    rationale >>
    audit >>
    remediation >>
    impact >>
    default_value >>
    references >>
    cis_controls
  end

  rule(:header) do
    (real.as(:section_num) >>
    title.as(:title) >>
    newline.maybe >>
    score.as(:score)).as(:header) >>
    newline
  end

  rule(:title) do
    (str('(Scored)').absent? >> str('(Not Scored)').absent? >> str('(Not').absent?  >> (words | lparn | rparn)).repeat(1)
  end

  rule :applicability do
    str('Profile Applicability:') >>
    newline >>
    applicabilityValue
  end

  rule :applicabilityValue do
    (word >>
     space >>
     integer.repeat(1) >>
     space >>
     str('-') >>
     words).as(:applicability) >>
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
    match('[a-zA-Z0-9/,\.:\'\"]').repeat(1)
  end

  rule :words do
    (space? >> word >> (space | dot | hyphen).maybe).repeat(1) >> (newline >> (word >> space).repeat(1)).maybe
  end

  def line_body(ending)
    (str(ending).absent? >> any).repeat(1)
  end

  def line(ending)
    line_body(ending) >> eol?
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

testStr = '2.13 Ensure operations on legacy registry (v1) are Disabled (Scored)
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

1.2 Ensure the container host has been Hardened (Not Scored)
Profile Applicability:
Level 1 - Linux Host OS
Description:
Containers run on a Linux host. A container host can run one or more containers. It is of
utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping
the host system hardened would ensure that the host vulnerabilities are mitigated. Not
hardening the host system could lead to security exposures and breaches.
Audit:
Ensure that the host specific security guidelines are followed. Ask the system
administrators which security benchmark does current host system comply with. Ensure
that the host systems actually comply with that host specific security benchmark.
Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have
other security guidelines or regulatory requirements to adhere to, please follow them as
suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety
checks, both at compile-time and run-time. It is also designed to defeat many exploits and
has powerful security features. These features do not require Docker-specific
configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened.
References:
1. https://docs.docker.com/engine/security/security/
2.
3.
4.
5.
6.
7.
https://learn.cisecurity.org/benchmarks
https://docs.docker.com/engine/security/security/#other-kernel-security-features
https://grsecurity.net/
https://en.wikibooks.org/wiki/Grsecurity
https://pax.grsecurity.net/
http://en.wikipedia.org/wiki/PaX
CIS Controls:
3 Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers
Secure Configurations for Hardware and Software on Mobile Devices, Laptops,
Workstations, and Servers

'

# extracted_data = File.read('../../data/CIS_DCE_v1.1.0.clean.txt')
#
# parser = ControlParser.new

# begin
#   puts "############"
#   puts "Parse Data"
#   puts "############"
#   parse = p parser.parse(extracted_data)
#   # parse = p parser.parse(extracted_data)
# rescue Parslet::ParseFailed => error
#   puts error.parse_failure_cause.ascii_tree
# end

class Trans < Parslet::Transform
  rule(:line => simple(:text)) { text }
  rule(:section_num => simple(:section), :title => simple(:title), :score => simple(:score)) { section + title + score }
  rule(:header => simple(:header), :applicability => simple(:applicability), :description => sequence(:description), :rationale => sequence(:rationale),
       :audit => sequence(:audit), :remediation => sequence(:remediation), :impact => sequence(:impact), :default_value => sequence(:default_value),
       :references => sequence(:references), :cis_controls => sequence(:cis_controls)) { [header.to_s , applicability.to_s,
        description[0].to_s + rationale[0].to_s, audit[0].to_s, remediation[0].to_s + impact[0].to_s + default_value[0].to_s,
        references[0].to_s, cis_controls[0].to_s] }
end
#
# transformed_data = Trans.new.apply(parse)
# puts "############"
# puts "Transformed Data"
# puts "############"
# p transformed_data

class PrepareData
  def initialize(file)
    extracted_data = File.read(file)

    @parser = ControlParser.new

    data = parse(extracted_data)

    @transformed_data = Trans.new.apply(data)
  end

  def transformed_data
    @transformed_data
  end

  def parse(extracted_data)
    begin
      puts "############"
      puts "Parse Data"
      puts "############"
      parse = @parser.parse(extracted_data)
        # parse = p parser.parse(extracted_data)
    rescue Parslet::ParseFailed => error
      puts error.parse_failure_cause.ascii_tree
    end

  end

  def convert_str(value)
    value.to_s
  end
end

# puts "############"
# puts "Prepared Data"
# puts "############"
# puts PrepareData.new(transformed_data)