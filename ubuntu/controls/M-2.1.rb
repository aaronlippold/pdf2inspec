control "M-2.1" do
  title "2.1 Ensure network traffic is restricted between containers on
the\ndefault bridge (Scored)"
  desc  "
    By default, all network traffic is allowed between containers on the same
host on the
    default network bridge. If not desired, restrict all the inter-container
communication. Link
    specific containers together that require communication. Alternatively, you
can create
    custom network and only join containers that need to communicate to that
custom
    network.
    By default, unrestricted network traffic is enabled between all containers
on the same host
    on the default network bridge. Thus, each container has the potential of
reading all packets
    across the container network on the same host. This might lead to an
unintended and
    unwanted disclosure of information to other containers. Hence, restrict the
inter-container
    communication on the default network bridge.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/userguide/networking/\n2.
https://docs.docker.com/engine/userguide/networking/default_network/containe\nr-communication/#communication-between-containers\n\n2.2
Ensure the logging level is set to 'info' (Scored)\nProfile Applicability:\n
Level 1 - Docker\nDescription:\nSet Docker daemon log level to
info.\nRationale:\nSetting up an appropriate log level, configures the Docker
daemon to log events that you\nwould want to review later. A base log level of
info and above would capture all logs\nexcept debug logs. Until and unless
required, you should not run Docker daemon at debug\nlog level.\nAudit:\nps -ef
| grep docker\nEnsure that either the --log-level parameter is not present or
if present, then it is set to\ninfo.\nRemediation:\nRun the Docker daemon as
below:\ndockerd --log-level=\"info\"\nImpact:\nNone.\nDefault Value:\nBy
default, Docker daemon is set to log level of info.\nReferences:\n1.
https://docs.docker.com/edge/engine/reference/commandline/dockerd/\n"
  tag "severity": "medium"
  tag "cis_id": "2.1"
  tag "cis_control": "6.2 Ensure Audit Log Settings Support Appropriate Log
Entry Formatting\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AU-3"]
  tag "audit": "Run the below command and verify that the default network
bridge has been configured to\nrestrict inter-container communication.\ndocker
network ls --quiet | xargs docker network inspect --format '{{ .Name\n}}: {{
.Options }}'\nIt should return com.docker.network.bridge.enable_icc:false for
the default network\nbridge.\n"
  tag "fix": "Run the docker in daemon mode and pass --icc=false as an
argument.\nFor Example,\ndockerd --icc=false\nAlternatively, you can follow the
Docker documentation and create a custom network and\nonly join containers that
need to communicate to that custom network. The --icc\nparameter only applies
to the default docker bridge, if custom networks are used then the\napproach of
segmenting networks should be adopted instead.\n"
  tag "Default Value": "By default, all inter-container communication is
allowed on the default network bridge.\n"
end
