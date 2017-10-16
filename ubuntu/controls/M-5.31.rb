control "M-5.31" do
  title "5.31 Ensure the Docker socket is not mounted inside any
containers(Scored)"
  desc  "
    The docker socket docker.sock should not be mounted inside a container.
    If the docker socket is mounted inside a container it would allow processes
running within
    the container to execute docker commands which effectively allows for full
control of the
    host.

  "
  impact 0.5
  tag "ref": "1.
https://raesene.github.io/blog/2016/03/06/The-Dangers-Of-Docker.sock/\n2.
https://forums.docker.com/t/docker-in-docker-vs-mounting-var-run-dockersock/9450/2\n3.
https://github.com/docker/docker/issues/21109\n"
  tag "severity": "medium"
  tag "cis_id": "5.31"
  tag "cis_control": "9 Limitation and Control of Network Ports, Protocols, and
Services\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SC-7"]
  tag "audit": "docker ps --quiet --all | xargs docker inspect --format '{{ .Id
}}:\nVolumes={{ .Mounts }}' | grep docker.sock\nThe above command would return
any instances where docker.sock had been mapped to\na container as a volume.\n"
  tag "fix": "Ensure that no containers mount docker.sock as a volume.\n"
  tag "Default Value": "By default, docker.sock is not mounted inside
containers.\n"
end
