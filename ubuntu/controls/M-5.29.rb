control "M-5.29" do
  title "5.29 Ensure Docker's default bridge docker0 is not used (Not Scored)"
  desc  "
    Do not use Docker's default bridge docker0. Use docker's user-defined
networks for
    container networking.
    Docker connects virtual interfaces created in the bridge mode to a common
bridge called
    docker0. This default networking model is vulnerable to ARP spoofing and
MAC flooding
    attacks since there is no filtering applied.

  "
  impact 0.5
  tag "ref": "1. https://github.com/nyantec/narwhal\n2.
https://arxiv.org/pdf/1501.02967\n3.
https://docs.docker.com/engine/userguide/networking/\n"
  tag "severity": "medium"
  tag "cis_id": "5.29"
  tag "cis_control": "9 Limitation and Control of Network Ports, Protocols, and
Services\n"
  tag "cis_level": "Level 2 - Docker"
  tag "nist": ["SC-7"]
  tag "audit": "Run the below command, and verify that containers are on a
user-defined network and not\nthe default docker0 bridge.\ndocker network ls
--quiet | xargs xargs docker network inspect --format '{{\n.Name }}: {{
.Options }}'\n"
  tag "fix": "Follow Docker documentation and setup a user-defined network. Run
all the containers in\nthe defined network.\n"
  tag "Default Value": "By default, docker runs containers on its docker0
bridge.\n"
end
