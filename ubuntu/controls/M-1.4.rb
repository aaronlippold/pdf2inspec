control "M-1.4" do
  title "1.4 Ensure only trusted users are allowed to control Docker
daemon(Scored)"
  desc  "
    The Docker daemon currently requires root privileges. A user added to the
docker group
    gives him full root access rights.
    Docker allows you to share a directory between the Docker host and a guest
container
    without limiting the access rights of the container. This means that you
can start a
    container and map the / directory on your host to the container. The
container will then be
    able to alter your host file system without any restrictions. In simple
terms, it means that
    you can attain elevated privileges with just being a member of the docker
group and then
    starting a container with mapped / directory on the host.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/security/security/#docker-daemon-attacksurface\n2.
https://www.andreas-jung.com/contents/on-docker-security-docker-groupconsidered-harmful\n3.
http://www.projectatomic.io/blog/2015/08/why-we-dont-let-non-root-users-rundocker-in-centos-fedora-or-rhel/\n"
  tag "severity": "medium"
  tag "cis_id": "1.4"
  tag "cis_control": "5.1 Minimize And Sparingly Use Administrative
Privileges\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["AC-6 (9)"]
  tag "audit": "Execute the below command on the docker host and ensure that
only trusted users are\nmembers of the docker group.\ngetent group docker\n"
  tag "fix": "Remove any users from the docker group that are not trusted.
Additionally, do not create a\nmapping of sensitive directories on host to
container volumes.\n"
  tag "Default Value": "Not Applicable\n"
end
