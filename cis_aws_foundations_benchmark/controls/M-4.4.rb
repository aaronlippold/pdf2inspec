control "M-4.4" do
  title "4.4 Ensure the default security group of every VPC restricts all
traffic (Scored)"
  desc  "A VPC comes with a default security group whose initial settings deny
all inbound traffic, allow all outbound traffic, and allow all traffic between
instances assigned to the security group. If you don't specify a security group
when you launch an instance, the instance is automatically assigned to this
default security group. Security groups provide stateful filtering of
ingress/egress network traffic to AWS resources. It is recommended that the
default security group restrict all traffic. The default VPC in every region
should have it's default security group updated to comply. Any newly created
VPCs will automatically contain a default security group that will need
remediation to comply with this recommendation. NOTE: When implementing this
recommendation, VPC flow logging is invaluable in determining the least
privilege port access required by systems to work properly because it can log
all packet acceptances and rejections occurring under the current security
groups. This dramatically reduces the primary barrier to least privilege
engineering discovering the minimum ports required by systems in the
environment. Even if the VPC flow logging recommendation in this benchmark is
not adopted as a permanent security measure, it should be used during any
period of discovery and engineering for least privileged security groups.
Configuring all VPC default security groups to restrict all traffic will
encourage least privilege security group development and mindful placement of
AWS resources into security groups which will in-turn reduce the exposure of
those resources. "
  impact 0.5
  tag "ref": "1. CCE-79201-0 2.
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-networksecurity.html
3. CIS CSC v6.0 #9.2"
  tag "severity": "medium"
  tag "cis_id": "4.4"
  tag "cis_control": [["9.2"], "6.1"]
  tag "cis_level": 2
  tag "nist": [["SC-7(5)", 4]]
  tag "audit text": "Perform the following to determine if the account is
configured as prescribed:
Security Group State Login to the AWS Management Console
at https://console.aws.amazon.com/vpc/home Repeat the next steps for all VPCs -
including the default VPC in each AWS region: In the left pane, click Security
Groups For each default security group, perform the following: Select the
default security group Click the Inbound Rules tab Ensure no rule exist Click
the Outbound Rules tab Ensure no rules exist
Security Group Members Login to the AWS Management Console
at https://console.aws.amazon.com/vpc/home Repeat the next steps for all
default groups in all VPCs - including the default VPC in
each AWS region: In the left pane, click Security Groups Copy the id of the
default security group. Change to the EC2 Management Console
at https://console.aws.amazon.com/ec2/v2/home In the filter column type
'Security Group ID : <security group id from #4>'
"
  tag "fix": "Security Group Members
Perform the following to implement the prescribed state:
Identify AWS resources that exist within the default security group
Create a set of least privilege security groups for those resources
Place the resources in those security groups
Remove the resources noted in #1 from the default security group
Security Group State Login to the AWS Management Console
at https://console.aws.amazon.com/vpc/home Repeat the next steps for all VPCs -
including the default VPC in each AWS region: In the left pane, click Security
Groups For each default security group, perform the following: Select the
default security group Click the Inbound Rules tab Remove any inbound rules
Click the Outbound Rules tab Remove any inbound rules
Recommended:
IAM groups allow you to edit the 'name' field. After remediating default groups
rules for
all VPCs in all regions, edit this field to add text similar to 'DO NOT USE. DO
NOT ADD
RULES'
"
end
