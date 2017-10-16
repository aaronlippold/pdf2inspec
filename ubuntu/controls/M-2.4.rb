control "M-2.4" do
  title "2.4 Ensure insecure registries are not used (Scored)"
  desc  "
    Docker considers a private registry either secure or insecure. By default,
registries are
    considered secure.
    A secure registry uses TLS. A copy of registry's CA certificate is placed
on the Docker host at
    /etc/docker/certs.d/<registry-name>/ directory. An insecure registry is the
one not
    having either valid registry certificate or is not using TLS. You should
not be using any
    insecure registries in the production environment. Insecure registries can
be tampered
    with leading to possible compromise to your production system.
    Additionally, If a registry is marked as insecure then docker pull, docker
push, and
    docker search commands will not result in an error message and the user
might be
    indefinitely working with insecure registries without ever being notified
of potential
    danger.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/registry/insecure/\n"
  tag "severity": "medium"
  tag "cis_id": "2.4"
  tag "cis_control": "14.2 Encrypt All Sensitive Information Over Less-trusted
Networks\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SC-8"]
  tag "audit": "Run docker info or execute the below command to find out if any
insecure registries are\nused:\nps -ef | grep dockerd\nEnsure that the
--insecure-registry parameter is not present.\n"
  tag "fix": "Do not use any insecure registries.\nFor example, do not start
the Docker daemon as below:\ndockerd --insecure-registry 10.1.0.0/16\n"
  tag "Default Value": "By default, Docker assumes all, but local, registries
are secure.\n"
end
