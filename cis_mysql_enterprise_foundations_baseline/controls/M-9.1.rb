control "M-9.1" do
  title "9.1 Ensure Replication Traffic Is Secured (Not Scored)"
  desc  "The replication traffic between servers should be secured. Security
measures should include ensuring the confidentiality and integrity of the
traffic, and performing mutual authentication between the servers before
performing replication. The replication traffic should be secured as it gives
access to all transfered information and might leak passwords. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "9.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check if the replication traffic is using one or more of
the following to provide
confidentiality and integrity for the traffic, and mutual authentication for
the servers:
A private network
A VPN
SSL/TLS
A SSH Tunnel
"
  tag "fix": "Secure the network traffic using one or more technologies to
provide confidentiality and
integrity for the traffic, and mutual authentication for the servers. "
end
