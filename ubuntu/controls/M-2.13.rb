control "M-2.13" do
  title "2.13 Ensure operations on legacy registry (v1) are Disabled (Scored)"
  desc  "
    The latest Docker registry is v2. All operations on the legacy registry
version (v1) should be
    restricted.
    Docker registry v2 brings in many performance and security improvements
over v1. It
    supports container image provenance and other security features such as
image signing
    and verification. Hence, operations on Docker legacy registry should be
restricted.

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/edge/engine/reference/commandline/dockerd/#legacyregistries\n2.
https://docs.docker.com/registry/spec/api/\n3.
https://the.binbashtheory.com/creating-private-docker-registry-2-0-with-tokenauthentication-service/\n4.
https://blog.docker.com/2015/07/new-tool-v1-registry-docker-trusted-registryv2-open-source/\n5.
http://www.slideshare.net/Docker/docker-registry-v2\n"
  tag "severity": "medium"
  tag "cis_id": "2.13"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["SI-1"]
  tag "audit": "ps -ef | grep dockerd\nThe above command should list
--disable-legacy-registry as an option passed to the\ndocker daemon.\n"
  tag "fix": "Start the docker daemon as below:\ndockerd
--disable-legacy-registry\n"
  tag "Default Value": "By default, legacy registry operations are allowed.\n"
end
