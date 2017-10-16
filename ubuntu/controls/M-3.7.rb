control "M-3.7" do
  title "3.7 Ensure that registry certificate file ownership is set to
root:root(Scored)"
  desc  "
    Verify that all the registry certificate files (usually found under
    /etc/docker/certs.d/<registry-name> directory) are owned and group-owned by
root.
    /etc/docker/certs.d/<registry-name> directory contains Docker registry
certificates.
    These certificate files must be owned and group-owned by root to maintain
the integrity of
    the certificates.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/registry/insecure/\n"
  tag "severity": "medium"
  tag "cis_id": "3.7"
  tag "cis_control": "5.1 Minimize And Sparingly Use Administrative
Privileges\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-6 (9)"]
  tag "audit": "Execute the below command to verify that the registry
certificate files are owned and\ngroup-owned by root:\nstat -c %U:%G
/etc/docker/certs.d/* | grep -v root:root\nThe above command should not return
anything.\n"
  tag "fix": "chown root:root /etc/docker/certs.d/<registry-name>/*\nThis would
set the ownership and group-ownership for the registry certificate files to
root.\n"
  tag "Default Value": "By default, the ownership and group-ownership for
registry certificate files is correctly set\nto root.\n"
end
