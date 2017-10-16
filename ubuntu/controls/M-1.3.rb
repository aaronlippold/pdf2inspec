control "M-1.3" do
  title "1.3 Ensure Docker is up to date (Not Scored)"
  desc  "
    There are frequent releases for Docker software that address security
vulnerabilities,
    product bugs and bring in new functionality. Keep a tab on these product
updates and
    upgrade as frequently as when new security vulnerabilities are fixed or
deemed correct for
    your organization.
    By staying up to date on Docker updates, vulnerabilities in the Docker
software can be
    mitigated. An educated attacker may exploit known vulnerabilities when
attempting to
    attain access or elevate privileges. Not installing regular Docker updates
may leave you
    with running vulnerable Docker software. It might lead to elevation
privileges,
    unauthorized access or other security breaches. Keep a track of new
releases and update as
    necessary.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/installation/\n2.
https://github.com/moby/moby/releases/latest\n3.
https://github.com/docker/docker-ce/releases/latest\n"
  tag "severity": "medium"
  tag "cis_id": "1.3"
  tag "cis_control": "4 Continuous Vulnerability Assessment and Remediation\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["RA-5"]
  tag "audit": "Execute the below command and verify that the Docker version is
up to date as deemed\nnecessary. It is not a mandate to be on the latest one,
though.\ndocker version\n"
  tag "fix": "Keep a track of Docker releases and update as necessary.\n"
  tag "Default Value": "Not Applicable\n"
end
