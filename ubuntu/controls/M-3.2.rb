control "M-3.2" do
  title "3.2 Ensure that docker.service file permissions are set to 644 or
more\nrestrictive (Scored)"
  desc  "
    Verify that the docker.service file permissions are correctly set to 644 or
more restrictive.
    docker.service file contains sensitive parameters that may alter the
behavior of Docker
    daemon. Hence, it should not be writable by any other user other than root
to maintain the
    integrity of the file.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/articles/systemd/\n"
  tag "severity": "medium"
  tag "cis_id": "3.2"
  tag "cis_control": "14.4 Protect Information With Access Control Lists\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-3 (3)"]
  tag "audit": "Step 1: Find out the file location:\nsystemctl show -p
FragmentPath docker.service\nStep 2: If the file does not exist, this
recommendation is not applicable. If the file exists,\nexecute the below
command with the correct file path to verify that the file permissions are\nset
to 644 or more restrictive.\nFor example,\nstat -c %a
/usr/lib/systemd/system/docker.service\n"
  tag "fix": "Step 1: Find out the file location:\nsystemctl show -p
FragmentPath docker.service\nStep 2: If the file does not exist, this
recommendation is not applicable. If the file exists,\nexecute the below
command with the correct file path to set the file permissions to 644.\nFor
example,\nchmod 644 /usr/lib/systemd/system/docker.service\n"
  tag "Default Value": "This file may not be present on the system. In that
case, this recommendation is not\napplicable. By default, if the file is
present, the file permissions are correctly set to 644.\n"
end
