control "M-2.15" do
  title "2.15 Ensure Userland Proxy is Disabled (Scored)"
  desc  "
    The docker daemon starts a userland proxy service for port forwarding
whenever a port is
    exposed. Where hairpin NAT is available, this service is generally
superfluous to
    requirements and can be disabled.
    Docker engine provides two mechanisms for forwarding ports from the host to
containers,
    hairpin NAT, and a userland proxy. In most circumstances, the hairpin NAT
mode is
    preferred as it improves performance and makes use of native Linux iptables
functionality
    instead of an additional component.
    Where hairpin NAT is available, the userland proxy should be disabled on
startup to reduce
    the attack surface of the installation.

  "
  impact 0.5
  tag "ref":
"1.\n2.\n3.\n4.\nhttp://windsock.io/the-docker-proxy/\nhttps://github.com/docker/docker/issues/14856\nhttps://github.com/docker/docker/issues/22741\nhttps://docs.docker.com/engine/userguide/networking/default_network/binding/\n"
  tag "severity": "medium"
  tag "cis_id": "2.15"
  tag "cis_control": "9.1 Limit Open Ports, Protocols, and Services\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["CM-7 (1)"]
  tag "audit": "ps -ef | grep dockerd\nEnsure that the --userland-proxy
parameter is set to false.\n"
  tag "fix": "Run the Docker daemon as below:\ndockerd --userland-proxy=false\n"
  tag "Default Value": "By default, the userland proxy is enabled.\n"
end
