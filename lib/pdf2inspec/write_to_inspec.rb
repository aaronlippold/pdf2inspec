#!/usr/local/bin/ruby
# encoding: utf-8
# author: Mohamed El-Sharkawi

require 'inspec/objects'
require 'word_wrap'

class WriteToInSpec
  def initialize(extracted_data)
    @array_of_controls = extracted_data

    @controls = []

    parse_controls
    generate_controls
  end

  # sets max length of a line before line break
  def wrap(s, width = 78)
    s.gsub!(/\\r/, "   \n")
    WordWrap.ww(s.to_s, width)
  end

  # converts passed in data into InSpec format
  def parse_controls
    @array_of_controls.each do |contr|
      print '.'
      control = Inspec::Control.new
      control.id = 'M-' + contr[:id]
      control.title = contr[:title]
      control.desc = contr[:desc]
      control.impact = contr[:level]
      control.add_tag(Inspec::Tag.new('ref', contr[:ref])) unless contr[:ref].nil?
      control.add_tag(Inspec::Tag.new('applicability', contr[:applicability])) unless contr[:applicability].nil?
      control.add_tag(Inspec::Tag.new('cis_id', contr[:id])) unless contr[:id].nil?
      control.add_tag(Inspec::Tag.new('cis_control', contr[:cis])) unless contr[:cis].nil? # tag cis_control: [5, 6.1] ##6.1 is the version
      control.add_tag(Inspec::Tag.new('cis_level', contr[:level])) unless contr[:level].nil?
      control.add_tag(Inspec::Tag.new('nist', @nist_mapping)) unless @nist_mapping.nil?  # tag nist: [AC-3, 4]  ##4 is the version
      control.add_tag(Inspec::Tag.new('check', contr[:check_text])) unless contr[:check_text].nil?
      control.add_tag(Inspec::Tag.new('fix', contr[:fix_text])) unless contr[:fix_text].nil?
      @controls << control
    end
  end

  # Writes InSpec controls to file
  def generate_controls
    Dir.mkdir 'controls' unless Dir.exist?('controls')
    @controls.each do |control|
      file_name = control.id.to_s
      myfile = File.new("controls/#{file_name}.rb", 'w')
      width = 80
      myfile.puts wrap(control.to_ruby, width)
      myfile.close
    end
  end
end

section_one_one = {:id => "1.1", :title => "Ensure a separate partition for containers has been created (Scored)", :desc => "Description:
                  All Docker containers and their data and metadata is stored under /var/lib/docker directory. By default, /var/lib/docker would be mounted under / or /var partitions based on availability.
                  Rationale:
                  Docker depends on /var/lib/docker as the default directory where all Docker related files, including the images, are stored. This directory might fill up fast and soon Docker and the host could become unusable. So, it is advisable to create a separate partition (logical volume) for storing Docker files.", :level => 1, :applicability => "Linux Host OS", :cis => ['14'], :ref => ['https://www.projectatomic.io/docs/docker-storage-recommendation/'], :check_text => "At the Docker host execute the below command: grep /var/lib/docker /etc/fstab
                  This should return the partition details for /var/lib/docker mount point.", :fix_text => "For new installations, create a separate partition for /var/lib/docker mount point. For systems that were previously installed, use the Logical Volume Manager (LVM) to create partitions.
                  Impact:
                  None.
                  Default Value:
                  By default, /var/lib/docker would be mounted under / or /var partitions based on availability."}

section_one_two = {:id => "1.2", :title => "Ensure the container host has been Hardened (Not Scored)", :desc => "Description:
Containers run on a Linux host. A container host can run one or more containers. It is of utmost importance to harden the host to mitigate host security misconfiguration.
Rationale:
You should follow infrastructure security best practices and harden your host OS. Keeping the host system hardened would ensure that the host vulnerabilities are mitigated. Not hardening the host system could lead to security exposures and breaches.", :level => 1, :applicability => "Linux Host OS", :cis => ['3'], :ref => ['1. https://docs.docker.com/engine/security/security/', '2. https://learn.cisecurity.org/benchmarks', '3. https://docs.docker.com/engine/security/security/#other-kernel-security-features', '4. https://grsecurity.net/', '5. https://en.wikibooks.org/wiki/Grsecurity', '6. https://pax.grsecurity.net/', '7. http://en.wikipedia.org/wiki/PaX'], :check_text => "Audit:
Ensure that the host specific security guidelines are followed. Ask the system administrators which security benchmark does current host system comply with. Ensure that the host systems actually comply with that host specific security benchmark.", :fix_text => "Remediation:
You may consider various CIS Security Benchmarks for your container host. If you have other security guidelines or regulatory requirements to adhere to, please follow them as suitable in your environment.
Additionally, you can run a kernel with grsecurity and PaX. This would add many safety checks, both at compile-time and run-time. It is also designed to defeat many exploits and has powerful security features. These features do not require Docker-specific configuration, since those security features apply system-wide, independent of containers.
Impact:
None.
Default Value:
By default, host has factory settings. It is not hardened."}

#array_of_controls = [section_one_one, section_one_two]

#WriteToInSpec.new(array_of_controls)
