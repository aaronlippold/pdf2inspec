control "M-2.3" do
  title "2.3 Ensure Docker is allowed to make changes to iptables (Scored)"
  desc  "
    Iptables are used to set up, maintain, and inspect the tables of IP packet
filter rules in the
    Linux kernel. Allow the Docker daemon to make changes to the iptables.
    Docker will never make changes to your system iptables rules if you choose
to do so.
    Docker server would automatically make the needed changes to iptables based
on how you
    choose your networking options for the containers if it is allowed to do
so. It is
    recommended to let Docker server make changes to iptablesautomatically to
avoid
    networking misconfiguration that might hamper the communication between
containers
    and to the outside world. Additionally, it would save you hassles of
updating
    iptablesevery time you choose to run the containers or modify networking
options.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/userguide/networking/default_network/containe\nr-communication/\n2.
https://fralef.me/docker-and-iptables.html\n"
  tag "severity": "medium"
  tag "cis_id": "2.3"
  tag "cis_control": "5 Controlled Use of Administration Privileges\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-6"]
  tag "audit": "ps -ef | grep dockerd\nEnsure that the --iptables parameter is
either not present or not set to false.\n"
  tag "fix": "Do not run the Docker daemon with --iptables=false parameter. For
example, do not\nstart the Docker daemon as below:\ndockerd --iptables=false\n"
  tag "Default Value": "By default, iptables is set to true.\n"
end
