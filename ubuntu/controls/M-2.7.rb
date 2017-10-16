control "M-2.7" do
  title "2.7 Ensure the default ulimit is configured appropriately (Not Scored)"
  desc  "
    Set the default ulimit options as appropriate in your environment.
    ulimit provides control over the resources available to the shell and to
processes started
    by it. Setting system resource limits judiciously saves you from many
disasters such as a
    fork bomb. Sometimes, even friendly users and legitimate processes can
overuse system
    resources and in-turn can make the system unusable.
    Setting default ulimit for the Docker daemon would enforce the ulimit for
all container
    instances. You would not need to setup ulimit for each container instance.
However, the
    default ulimit can be overridden during container runtime, if needed.
Hence, to control the
    system resources, define a default ulimit as needed in your environment.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/edge/engine/reference/commandline/dockerd/#defaultulimits\n"
  tag "severity": "medium"
  tag "cis_id": "2.7"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "ps -ef | grep dockerd\nEnsure that the --default-ulimit
parameter is set as appropriate.\n"
  tag "fix": "Run the docker in daemon mode and pass --default-ulimit as
argument with respective\nulimits as appropriate in your environment.\nFor
Example,\ndockerd --default-ulimit nproc=1024:2048 --default-ulimit
nofile=100:200\n"
  tag "Default Value": "By default, no ulimit is set.\n"
end
