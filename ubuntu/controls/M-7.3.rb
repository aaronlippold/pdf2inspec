control "M-7.3" do
  title "7.3 Ensure swarm services are binded to a specific host
interface(Scored)"
  desc  "
    By default, the docker swarm services will listen to all interfaces on the
host, which may
    not be necessary for the operation of the swarm where the host has multiple
network
    interfaces.
    When a swarm is initialized the default value for the --listen-addr flag is
0.0.0.0:2377
    which means that the swarm services will listen on all interfaces on the
host. If a host has
    multiple network interfaces this may be undesirable as it may expose the
docker swarm
    services to networks which are not involved in the operation of the swarm.
    By passing a specific IP address to the --listen-addr, a specific network
interface can be
    specified limiting this exposure.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/reference/commandline/swarm_init/#--listenaddr\n2.
https://docs.docker.com/engine/swarm/admin_guide/#recover-from-disaster\nNotes:\nA
couple of points I noted looking at this one. there doesn't seem to be a
parameter for\ndocker swarm update to change the listen-addr. For the
remediation I did wonder if -force-new-swarm could be used to change this, but
I'm not sure what other effects that\nwould have on the swarm so just left with
a general requirement to re-initialize the swarm.\nAlso interestingly the node
communication service running on 7946/TCP doesn't respect\nthe --listen-addr
parameter. this seems like a bug to me, I'll likely file an issue on github
for\nit after a bit more exploration.\n"
  tag "severity": "medium"
  tag "cis_id": "7.3"
  tag "cis_control": "9 Limitation and Control of Network Ports, Protocols, and
Services\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SC-7"]
  tag "audit": "List the network listener on port 2377/TCP (the default for
docker swarm) and confirm\nthat it is only listening on specific interfaces.
For example, using ubuntu this could be done\nwith the following
command:\nnetstat -lt | grep -i 2377\n"
  tag "fix": "Remediation of this requires re-initialization of the swarm
specifying a specific interface\nfor the --listen-addr parameter.\n"
  tag "Default Value": "By default, docker swarm services listen on all
available host interfaces.\n"
end
