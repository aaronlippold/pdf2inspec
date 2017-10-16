control "M-2.8" do
  title "2.8 Enable user namespace support (Scored)"
  desc  "
    Enable user namespace support in Docker daemon to utilize container user to
host user remapping. This recommendation is beneficial where containers you are
using do not have an
    explicit container user defined in the container image. If container images
that you are
    using have a pre-defined non-root user, this recommendation may be skipped
since this
    feature is still in its infancy and might give you unpredictable issues and
complexities.
    The Linux kernel user namespace support in Docker daemon provides
additional security
    for the Docker host system. It allows a container to have a unique range of
user and group
    IDs which are outside the traditional user and group range utilized by the
host system.
    For example, the root user will have expected administrative privilege
inside the container
    but can effectively be mapped to an unprivileged UID on the host system.

  "
  impact 0.5
  tag "ref": "1.
http://man7.org/linux/man-pages/man7/user_namespaces.7.html\n2.
https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-usernamespace-options\n3.
http://events.linuxfoundation.org/sites/events/files/slides/User%20Namespaces\n%20-%20ContainerCon%202015%20-%2016-9-final_0.pdf\n"
  tag "severity": "medium"
  tag "cis_id": "2.8"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 2 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "ps -p $(docker inspect --format='{{ .State.Pid }}' <CONTAINER
ID>) -o\npid,user\nThe above command would find the PID of the container and
then would list the host user\nassociated with the container process. If the
container process is running as root, then this\nrecommendation is
non-compliant.\nAlternatively, you can run docker info to ensure that the
userns is listed under Security\nOptions:\ndocker info --format '{{
.SecurityOptions }}'\n"
  tag "fix": "Please consult Docker documentation for various ways in which
this can be configured\ndepending upon your requirements. Your steps might also
vary based on platform - For\nexample, on Red Hat, sub-UIDs and sub-GIDs
mapping creation does not work\nautomatically. You might have to create your
own mapping.\nHowever, the high-level steps are as below:\nStep 1: Ensure that
the files /etc/subuid and /etc/subgid exist.\ntouch /etc/subuid
/etc/subgid\nStep 2: Start the docker daemon with --userns-remap flag\ndockerd
--userns-remap=default\n"
  tag "Default Value": "By default, user namespace is not remapped.\n"
end
