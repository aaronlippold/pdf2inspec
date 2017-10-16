control "M-5.12" do
  title "5.12 Ensure the container's root filesystem is mounted as read
only(Scored)"
  desc  "
    The container's root filesystem should be treated as a 'golden image' by
using Docker run's
    --read-only option. This prevents any writes to the container's root
filesystem at
    container runtime and enforces the principle of immutable infrastructure.
    Enabling this option forces containers at runtime to explicitly define
their data writing
    strategy to persist or not persist their data.
    This also reduces security attack vectors since the container instance's
filesystem cannot
    be tampered with or written to unless it has explicit read-write
permissions on its
    filesystem folder and directories.

  "
  impact 0.5
  tag "ref": "1. http://docs.docker.com/reference/commandline/cli/#run\n2.
https://docs.docker.com/engine/tutorials/dockervolumes/\n3.
http://www.projectatomic.io/blog/2015/12/making-docker-images-write-only-inproduction/\n4.
https://docs.docker.com/engine/reference/commandline/run/#mount-tmpfstmpfs\n5.
https://docs.docker.com/engine/tutorials/dockervolumes/#creating-andmounting-a-data-volume-container\n"
  tag "severity": "medium"
  tag "cis_id": "5.12"
  tag "cis_control": "14 Controlled Access Based on the Need to Know\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-6"]
  tag "audit": "Run the following command on the docker host:\ndocker ps
--quiet --all | xargs docker inspect --format '{{ .Id }}:\nReadonlyRootfs={{
.HostConfig.ReadonlyRootfs }}'\nIf the above command returns true, it means the
container's root filesystem is mounted\nread-only.\nIf the above command
returns false, it means the container's root filesystem is writable.\n"
  tag "fix": "Add a --read-only flag at a container's runtime to enforce the
container's root filesystem\nto be mounted as read only.\ndocker run <Run
arguments> --read-only <Container Image Name or ID> <Command>\nEnabling the
--read-only option at a container's runtime should be used by
administrators\nto force a container's executable processes to only write
container data to explicit storage\nlocations during the container's
runtime.\nExamples of explicit storage locations during a container's runtime
include, but not limited\nto:\n1. Use the --tmpfs option to mount a temporary
file system for non-persistent data\nwrites.\ndocker run --interactive --tty
--read-only --tmpfs \"/run\" --tmpfs \"/tmp\"\ncentos /bin/bash\n2. Enabling
Docker rw mounts at a container's runtime to persist container data\ndirectly
on the Docker host filesystem.\ndocker run --interactive --tty --read-only -v
/opt/app/data:/run/app/data:rw\ncentos /bin/bash\n3. Utilizing Docker
shared-storage volume plugins for Docker data volume to persist\ncontainer
data.\ndocker volume create -d convoy --opt o=size=20GB my-named-volume\ndocker
run --interactive --tty --read-only -v my-named-volume:/run/app/data\ncentos
/bin/bash\n3. Transmitting container data outside of the docker during the
container's runtime\nfor container data to persist container data. Examples
include hosted databases,\nnetwork file shares, and APIs.\n"
  tag "Default Value": "By default, a container will have its root filesystem
writable allowing all container\nprocesses to write files owned by the
container's runtime user.\n"
end
