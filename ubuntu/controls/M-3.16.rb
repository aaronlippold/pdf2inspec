control "M-3.16" do
  title "3.16 Ensure that Docker socket file permissions are set to 660 or
more\nrestrictive (Scored)"
  desc  "
    Verify that the Docker socket file has permissions of 660 or more
restrictive.
    Only root and members of docker group should be allowed to read and write
to default
    Docker Unix socket. Hence, the Docket socket file must have permissions of
660 or more
    restrictive.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/reference/commandline/dockerd/#daemonsocket-option\n2.
https://docs.docker.com/engine/reference/commandline/dockerd/#bind-dockerto-another-hostport-or-a-unix-socket\n"
  tag "severity": "medium"
  tag "cis_id": "3.16"
  tag "cis_control": "14.4 Protect Information With Access Control Lists\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-3 (3)"]
  tag "audit": "Execute the below command to verify that the Docker socket file
has permissions of 660 or\nmore restrictive:\nstat -c %a /var/run/docker.sock\n"
  tag "fix": "chmod 660 /var/run/docker.sock\nThis would set the file
permissions of the Docker socket file to 660.\n"
  tag "Default Value": "By default, the permissions for Docker socket file is
correctly set to 660.\n"
end
