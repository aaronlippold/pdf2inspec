control "M-3.20" do
  title "3.20 Ensure that /etc/default/docker file permissions are set to 644
or\nmore restrictive (Scored)"
  desc  "
    Verify that the /etc/default/docker file permissions are correctly set to
644 or more
    restrictive.
    /etc/default/docker file contains sensitive parameters that may alter the
behavior of
    docker daemon. Hence, it should be writable only by root to maintain the
integrity of the
    file.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/admin/configuring/\n"
  tag "severity": "medium"
  tag "cis_id": "3.20"
  tag "cis_control": "14.4 Protect Information With Access Control Lists\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-3 (3)"]
  tag "audit": "Execute the below command to verify that the file permissions
are correctly set to 644 or\nmore restrictive:\nstat -c %a
/etc/default/docker\n"
  tag "fix": "chmod 644 /etc/default/docker\nThis would set the file
permissions for this file to 644.\n"
  tag "Default Value": "This file may not be present on the system. In that
case, this recommendation is not\napplicable.\n"
end
