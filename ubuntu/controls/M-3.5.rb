control "M-3.5" do
  title "3.5 Ensure that /etc/docker directory ownership is set to
root:root(Scored)"
  desc  "
    Verify that the /etc/docker directory ownership and group-ownership is
correctly set to
    root.
    /etc/docker directory contains certificates and keys in addition to various
sensitive files.
    Hence, it should be owned and group-owned by root to maintain the integrity
of the
    directory.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/security/https/\n"
  tag "severity": "medium"
  tag "cis_id": "3.5"
  tag "cis_control": "5.1 Minimize And Sparingly Use Administrative
Privileges\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-6 (9)"]
  tag "audit": "Execute the below command to verify that the directory is owned
and group-owned by\nroot:\nstat -c %U:%G /etc/docker | grep -v root:root\nThe
above command should not return anything.\n"
  tag "fix": "chown root:root /etc/docker\nThis would set the ownership and
group-ownership for the directory to root.\n"
  tag "Default Value": "By default, the ownership and group-ownership for this
directory is correctly set to root.\n"
end
