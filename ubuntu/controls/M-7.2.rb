control "M-7.2" do
  title "7.2 Ensure the minimum number of manager nodes have been created\nin a
swarm (Scored)"
  desc  "
    Ensure that the minimum number of required manager nodes is created in a
swarm.
    Manager nodes within a swarm have control over the swarm and change its
configuration
    modifying security parameters. Having excessive manager nodes could render
the swarm
    more susceptible to compromise.
    If fault tolerance is not required in the manager nodes, a single node
should be elected as a
    manger. If fault tolerance is required then the smallest practical odd
number to achieve the
    appropriate level of tolerance should be configured.

  "
  impact 0.5
  tag "ref": "1. https://docs.docker.com/engine/swarm/manage-nodes/\n2.
https://docs.docker.com/engine/swarm/admin_guide/#/add-manager-nodes-forfault-tolerance\n"
  tag "severity": "medium"
  tag "cis_id": "7.2"
  tag "cis_control": "5 Controlled Use of Administration Privileges\n"
  tag "cis_level": "Level 1 - Docker"
  tag "nist": ["AC-6"]
  tag "audit": "Run docker info and verify the number of managers.\ndocker info
--format '{{ .Swarm.Managers }}'\nAlternatively run the below command.\ndocker
node ls | grep 'Leader'\n"
  tag "fix": "If an excessive number of managers is configured, the excess can
be demoted as worker\nusing the following command:\ndocker node demote
<ID>\nWhere is the node ID value of the manager to be demoted.\n"
  tag "Default Value": "A single manager is all that is required to start a
given cluster.\n"
end
