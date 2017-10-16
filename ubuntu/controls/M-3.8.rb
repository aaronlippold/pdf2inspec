control "M-3.8" do
  title "3.8 Ensure that registry certificate file permissions are set to 444
or\nmore restrictive (Scored)"
  desc  "
    Verify that all the registry certificate files (usually found under
    /etc/docker/certs.d/<registry-name> directory) have permissions of 444 or
more
    restrictive.
    /etc/docker/certs.d/<registry-name> directory contains Docker registry
certificates.
    These certificate files must have permissions of 444 to maintain the
integrity of the
    certificates.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/registry/insecure/\n"
  tag "severity": "medium"
  tag "cis_id": "3.8"
  tag "cis_control": "14.4 Protect Information With Access Control Lists\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-3 (3)"]
  tag "audit": "Execute the below command to verify that the registry
certificate files have permissions of\n444 or more restrictive:\nstat -c %a
/etc/docker/certs.d/<registry-name>/*\n"
  tag "fix": "chmod 444 /etc/docker/certs.d/<registry-name>/*\nThis would set
the permissions for registry certificate files to 444.\n"
  tag "Default Value": "By default, the permissions for registry certificate
files might not be 444. The default file\npermissions are governed by the
system or user specific umaskvalues.\n"
end
