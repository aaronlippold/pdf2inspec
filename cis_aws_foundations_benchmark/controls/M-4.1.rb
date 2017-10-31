control "M-4.1" do
  title "4.1 Ensure no security groups allow ingress from 0.0.0.0/0 to port 22
(Scored)"
  desc  "Security groups provide stateful filtering of ingress/egress network
traffic to AWS resources. It is recommended that no security group allows
unrestricted ingress access to port 22. Removing unfettered connectivity to
remote console services, such as SSH, reduces a server's exposure to risk. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "4.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following to determine if the account is
configured as prescribed: Login to the AWS Management Console
at https://console.aws.amazon.com/vpc/home In the left pane, click Security
Groups For each security group, perform the following: Select the security
group Click the Inbound Rules tab Ensure no rule exists that has a port range
that includes port 22 and has a
Source of 0.0.0.0/0
Note: A Port value of ALL or a port range such as 0-1024 are inclusive of port
22.
"
  tag "fix": "Perform the following to implement the prescribed state: Login to
the AWS Management Console
at https://console.aws.amazon.com/vpc/home In the left pane, click Security
Groups For each security group, perform the following: Select the security
group Click the Inbound Rules tab Identify the rules to be removed Click the x
in the Remove column Click Save
"
end
