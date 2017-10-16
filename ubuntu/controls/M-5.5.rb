control "M-5.5" do
  title "5.5 Ensure sensitive host system directories are not mounted
on\ncontainers (Scored)"
  desc  "
    Sensitive host system directories such as below should not be allowed to be
mounted as
    container volumes especially in read-write mode.
    /
    /boot
    /dev
    /etc
    /lib
    /proc
    /sys
    /usr
    If sensitive directories are mounted in read-write mode, it would be
possible to make
    changes to files within those sensitive directories. The changes might
bring down security
    implications or unwarranted changes that could put the Docker host in
compromised state.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/tutorials/dockervolumes/\n"
  tag "severity": "medium"
  tag "cis_id": "5.5"
  tag "cis_control": "14 Controlled Access Based on the Need to Know\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-6"]
  tag "audit": "docker ps --quiet --all | xargs docker inspect --format '{{ .Id
}}:\nVolumes={{ .Mounts }}'\nThe above commands would return the list of
current mapped directories and whether\nthey are mounted in read-write mode for
each container instance.\n"
  tag "fix": "Do not mount host sensitive directories on containers especially
in read-write mode.\n"
  tag "Default Value": "Docker defaults to a read-write volume but you can also
mount a directory read-only. By\ndefault, no sensitive host directories are
mounted on containers.\n"
end
