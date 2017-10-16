control "M-5.26" do
  title "5.26 Ensure container health is checked at runtime (Scored)"
  desc  "
    If the container image does not have an HEALTHCHECK instruction defined,
use --health-cmd
    parameter at container runtime for checking container health.
    One of the important security triads is availability. If the container
image you are using
    does not have a pre-defined HEALTHCHECK instruction, use the --health-cmd
parameter to
    check container health at runtime.
    Based on the reported health status, you could take necessary actions.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/reference/run/#healthcheck\n"
  tag "severity": "medium"
  tag "cis_id": "5.26"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "Run the below command and ensure that all the containers are
reporting health status:\ndocker ps --quiet | xargs docker inspect --format '{{
.Id }}: Health={{\n.State.Health.Status }}'\n"
  tag "fix": "Run the container using --health-cmd and the other
parameters.\nFor example,\ndocker run -d --health-cmd='stat /etc/passwd || exit
1' nginx\n"
  tag "Default Value": "By default, health checks are not done at container
runtime.\n"
end
