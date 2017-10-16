control "M-5.6" do
  title "5.6 Ensure ssh is not run within containers (Scored)"
  desc  "
    SSH server should not be running within the container. You should SSH into
the Docker
    host, and use nsenter tool to enter a container from a remote host.
    Running SSH within the container increases the complexity of security
management by
    making it



    Difficult to manage access policies and security compliance for SSH server
    Difficult to manage keys and passwords across various containers
    Difficult to manage security upgrades for SSH server
    It is possible to have shell access to a container without using SSH, the
needlessly
    increasing the complexity of security management should be avoided.

  "
  impact 0.5
  tag "ref": "1.
http://blog.docker.com/2014/06/why-you-dont-need-to-run-sshd-in-docker/\n"
  tag "severity": "medium"
  tag "cis_id": "5.6"
  tag "cis_control": "9.1 Limit Open Ports, Protocols, and Services\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["CM-7 (1)"]
  tag "audit": "Step 1: List all the running instances of containers by
executing below command:\ndocker ps --quiet\nStep 2: For each container
instance, execute the below command:\ndocker exec $INSTANCE_ID ps -el\nEnsure
that there is no process for SSH server.\n"
  tag "fix": "Uninstall SSH server from the container and use nsenteror any
other commands such as\ndocker exec or docker attach to interact with the
container instance.\ndocker exec --interactive --tty $INSTANCE_ID
sh\nOR\ndocker attach $INSTANCE_ID\n"
  tag "Default Value": "By default, SSH server is not running inside the
container. Only one process per container is\nallowed.\n"
end
