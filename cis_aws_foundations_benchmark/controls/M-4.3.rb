control "M-4.3" do
  title "4.3 Ensure VPC flow logging is enabled in all VPCs (Scored)"
  desc  "VPC Flow Logs is a feature that enables you to capture information
about the IP traffic going to and from network interfaces in your VPC. After
you've created a flow log, you can view and retrieve its data in Amazon
CloudWatch Logs. It is recommended that VPC Flow Logs be enabled for packet
'Rejects' for VPCs. VPC Flow Logs provide visibility into network traffic that
traverses the VPC and can be used to detect anomalous traffic or insight during
security workflows. "
  impact 0.5
  tag "ref": "1. CCE-79202-8 2. CIS CSC v6.0 #6.5, #12.9 3.
http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/flow-logs.html"
  tag "severity": "medium"
  tag "cis_id": "4.3"
  tag "cis_control": [["6.5", "12.9"], "6.1"]
  tag "cis_level": 2
  tag "nist": [["SI-4 (4)", 4], ["SI-4 (11)", 4]]
  tag "audit text": "Perform the following to determine if VPC Flow logs is
enabled:
Via the Management Console:
Sign into the management console
Select Services then VPC
In the left navigation pane, select Your VPCs
Select a VPC
In the right pane, select the Flow Logs tab.
Ensure a Log Flow exists that has Active in the Status column.
"
  tag "fix": "Perform the following to determine if VPC Flow logs is enabled:
Via the Management Console:
Sign into the management console
Select Services then VPC
In the left navigation pane, select Your VPCs
Select a VPC
In the right pane, select the Flow Logs tab.
If no Flow Log exists, click Create Flow Log
For Filter, select Reject
Enter in a Role and Destination Log Group Click Create Log Flow
10. Click on CloudWatch Logs Group
Note: Setting the filter to 'Reject' will dramatically reduce the logging data
accumulation
for this recommendation and provide sufficient information for the purposes of
breach
detection, research and remediation. However, during periods of least privilege
security
group engineering, setting this the filter to 'All' can be very helpful in
discovering existing
traffic flows required for proper operation of an already running environment.

"
end
