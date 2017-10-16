control "M-5.9" do
  title "5.9 Ensure the host's network namespace is not shared (Scored)"
  desc  "
    The networking mode on a container when set to --net=host, skips placing
the container
    inside separate network stack. In essence, this choice tells Docker to not
containerize the
    container's networking. This would network-wise mean that the container
lives \"outside\"
    in the main Docker host and has full access to its network interfaces.
    This is potentially dangerous. It allows the container process to open
low-numbered ports
    like any other root process. It also allows the container to access network
services like Dbus on the Docker host. Thus, a container process can
potentially do unexpected things
    such as shutting down the Docker host. You should not use this option.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/userguide/networking/\n2.
https://docs.docker.com/engine/reference/run/#network-settings\n"
  tag "severity": "medium"
  tag "cis_id": "5.9"
  tag "cis_control": "12 Boundary Defense\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SC-7"]
  tag "audit": "docker ps --quiet --all | xargs docker inspect --format '{{ .Id
}}:\nNetworkMode={{ .HostConfig.NetworkMode }}'\nIf the above command returns
NetworkMode=host, it means that --net=host option was\npassed when container
was started. This would be non-compliant.\n"
  tag "fix": "Do not pass --net=host option when starting the container.\n"
  tag "Default Value": "By default, container connects to Docker bridge.\n"
end
