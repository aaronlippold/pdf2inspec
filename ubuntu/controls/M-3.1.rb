control "M-3.1" do
  title "3.1 Ensure that docker.service file ownership is set to root:root
(Scored)"
  desc  "
    Verify that the docker.service file ownership and group-ownership are
correctly set to
    root.
    docker.service file contains sensitive parameters that may alter the
behavior of Docker
    daemon. Hence, it should be owned and group-owned by root to maintain the
integrity of
    the file.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/admin/systemd/\n"
  tag "severity": "medium"
  tag "cis_id": "3.1"
  tag "cis_control": "5.1 Minimize And Sparingly Use Administrative
Privileges\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-6 (9)"]
  tag "audit": "Step 1: Find out the file location:\nsystemctl show -p
FragmentPath docker.service\nStep 2: If the file does not exist, this
recommendation is not applicable. If the file exists,\nexecute the below
command with the correct file path to verify that the file is owned
and\ngroup-owned by root.\nFor example,\nstat -c %U:%G
/usr/lib/systemd/system/docker.service | grep -v root:root\nThe above command
should not return anything.\n"
  tag "fix": "Step 1: Find out the file location:\nsystemctl show -p
FragmentPath docker.service\nStep 2: If the file does not exist, this
recommendation is not applicable. If the file exists,\nexecute the below
command with the correct file path to set the ownership and group\nownership
for the file to root.\nFor example,\nchown root:root
/usr/lib/systemd/system/docker.service\n"
  tag "Default Value": "This file may not be present on the system. In that
case, this recommendation is not\napplicable. By default, if the file is
present, the ownership and group-ownership for this file\nis correctly set to
root.\n"
end
