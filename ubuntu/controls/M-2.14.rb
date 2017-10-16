control "M-2.14" do
  title "2.14 Ensure live restore is Enabled (Scored)"
  desc  "
    The --live-restore enables full support of daemon-less containers in
docker. It ensures
    that docker does not stop containers on shutdown or restore and properly
reconnects to
    the container when restarted.
    One of the important security triads is availability. Setting
--live-restore flag in the
    docker daemon ensures that container execution is not interrupted when the
docker
    daemon is not available. This also means that it is now easier to update
and patch the
    docker daemon without execution downtime.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/admin/live-restore/\n"
  tag "severity": "medium"
  tag "cis_id": "2.14"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "Run docker info and ensure that the Live Restore Enabled
property is set to true.\ndocker info --format '{{ .LiveRestoreEnabled
}}'\nAlternatively run the below command and ensure that --live-restore is
used.\nps -ef | grep dockerd\n"
  tag "fix": "Run the docker in daemon mode and pass --live-restore as an
argument.\nFor Example,\ndockerd --live-restore\n"
  tag "Default Value": "By default, --live-restore is not enabled.\n"
end
