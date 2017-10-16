control "M-2.11" do
  title "2.11 Ensure that authorization for Docker client commands is
enabled(Scored)"
  desc  "
    Use native Docker authorization plugins or a third party authorization
mechanism with
    Docker daemon to manage access to Docker client commands.
    Docker’s out-of-the-box authorization model is all or nothing. Any user
with permission to
    access the Docker daemon can run any Docker client command. The same is
true for callers
    using Docker’s remote API to contact the daemon. If you require greater
access control, you
    can create authorization plugins and add them to your Docker daemon
configuration. Using
    an authorization plugin, a Docker administrator can configure granular
access policies for
    managing access to Docker daemon.
    Third party integrations of Docker may implement their own authorization
models to
    require authorization with the Docker daemon outside of docker's native
authorization
    plugin (i.e. Kubernetes, Cloud Foundry, Openshift).

  "
  impact 0.5
  tag "ref": "1.
https://docs.docker.com/engine/reference/commandline/dockerd/#accessauthorization\n2.
https://docs.docker.com/engine/extend/plugins_authorization/\n3.
https://github.com/twistlock/authz\nNotes:\nAs a scored control, focus should
be on a PASS/FAIL if the authentication occurs when a\ndocker client command is
executed against docker daemon to enforce authentication. The\nnative docker
authentication plugin is just one method to enforce this control.\n"
  tag "severity": "medium"
  tag "cis_id": "2.11"
  tag "cis_control": "16 Account Monitoring and Control\n"
  tag "cis_level": "Level 2 - Docker"
  tag "nist": ["AC-2"]
  tag "audit": "ps -ef | grep dockerd\nEnsure that the --authorization-plugin
parameter is set as appropriate if using docker\nnative authorization.\ndocker
search hello-world\nEnsure that docker daemon requires authorization to perform
the above command.\n"
  tag "fix": "Step 1: Install/Create an authorization plugin.\nStep 2:
Configure the authorization policy as desired.\nStep 3: Start the docker daemon
as below:\ndockerd --authorization-plugin=<PLUGIN_ID>\n"
  tag "Default Value": "By default, authorization plugins are not set up.\n"
end
