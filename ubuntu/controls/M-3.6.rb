control "M-3.6" do
  title "3.6 Ensure that /etc/docker directory permissions are set to 755 or
more\nrestrictive (Scored)"
  desc  "
    Verify that the /etc/docker directory permissions are correctly set to 755
or more
    restrictive.
    /etc/docker directory contains certificates and keys in addition to various
sensitive files.
    Hence, it should only be writable by root to maintain the integrity of the
directory.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/security/https/\n"
  tag "severity": "medium"
  tag "cis_id": "3.6"
  tag "cis_control": "14.4 Protect Information With Access Control Lists\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-3 (3)"]
  tag "audit": "Execute the below command to verify that the directory has
permissions of 755 or more\nrestrictive:\nstat -c %a /etc/docker\n"
  tag "fix": "chmod 755 /etc/docker\nThis would set the permissions for the
directory to 755.\n"
  tag "Default Value": "By default, the permissions for this directory are
correctly set to 755.\n"
end
