control "M-5.18" do
  title "5.18 Ensure the default ulimit is overwritten at runtime, only if
needed(Not Scored)"
  desc  "
    The default ulimit is set at the Docker daemon level. However, you may
override the default
    ulimit setting, if needed, during container runtime.
    ulimit provides control over the resources available to the shell and to
processes started
    by it. Setting system resource limits judiciously saves you from many
disasters such as a
    fork bomb. Sometimes, even friendly users and legitimate processes can
overuse system
    resources and in-turn can make the system unusable.
    The default ulimit set at the Docker daemon level should be honored. If the
default ulimit
    settings are not appropriate for a particular container instance, you may
override them as
    an exception. But, do not make this a practice. If most of the container
instances are
    overriding default ulimit settings, consider changing the default ulimit
settings to
    something that is appropriate for your needs.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/reference/commandline/run/#set-ulimits-incontainer-ulimit\n2.
http://www.oreilly.com/webops-perf/free/files/docker-security.pdf\n"
  tag "severity": "medium"
  tag "cis_id": "5.18"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "docker ps --quiet --all | xargs docker inspect --format '{{ .Id
}}:\nUlimits={{ .HostConfig.Ulimits }}'\nThe above command should return
Ulimits=<no value> for each container instance until\nand unless there is an
exception and a need to override the default ulimit settings.\n"
  tag "fix": "Only override the default ulimit settings if needed.\nFor
example, to override default ulimit settings start a container as
below:\ndocker run --ulimit nofile=1024:1024 --interactive --tty centos
/bin/bash\n"
  tag "Default Value": "Container instances inherit the default ulimit settings
set at the Docker daemon level.\n"
end
