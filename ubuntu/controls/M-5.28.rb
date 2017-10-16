control "M-5.28" do
  title "5.28 Ensure PIDs cgroup limit is used (Scored)"
  desc  "
    Use --pids-limit flag at container runtime.
    Attackers could launch a fork bomb with a single command inside the
container. This fork
    bomb can crash the entire system and requires a restart of the host to make
the system
    functional again. PIDs cgroup --pids-limit will prevent this kind of
attacks by restricting
    the number of forks that can happen inside a container at a given time.

  "
  impact 0.5
  tag "ref": "1. https://github.com/docker/docker/pull/18697\n2.
https://docs.docker.com/engine/reference/commandline/run/#options\n"
  tag "severity": "medium"
  tag "cis_id": "5.28"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "Run the below command and ensure that PidsLimit is not set to 0
or -1. A PidsLimit of 0\nor -1 means that any number of processes can be forked
inside the container concurrently.\ndocker ps --quiet --all | xargs docker
inspect --format '{{ .Id }}:\nPidsLimit={{ .HostConfig.PidsLimit }}'\n"
  tag "fix": "Use --pids-limit flag while launching the container with an
appropriate value.\nFor example,\ndocker run -it --pids-limit 100
<Image_ID>\nIn the above example, the number of processes allowed to run at any
given time is set to\n100. After a limit of 100 concurrently running processes
is reached, docker would restrict\nany new process creation.\n"
  tag "Default Value": "The Default value for --pids-limit is 0 which means
there is no restriction on the number\nof forks. Also, note that PIDs cgroup
limit works only for the kernel versions 4.3+.\n"
end
