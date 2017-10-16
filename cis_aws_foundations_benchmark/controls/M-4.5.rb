control "M-4.5" do
  title "4.5 Ensure routing tables for VPC peering are 'least access' (Not
Scored)"
  desc  "Once a VPC peering connection is estalished, routing tables must be
updated to establish any connections between the peered VPCs. These routes can
be as specific as desired even peering a VPC to only a single host on the other
side of the connection. Being highly selective in peering routing tables is a
very effective way of minimizing the impact of breach as resources outside of
these routes are inaccessible to the peered VPC. "
  impact 0.5
  tag "ref": "1.
http://docs.aws.amazon.com/AmazonVPC/latest/PeeringGuide/peeringconfigurations-partial-access.html
"
  tag "severity": "medium"
  tag "cis_id": "4.5"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 2"
  tag "nist": ["Not Mapped"]
  tag "audit": "Review routing tables of peered VPCs for whether they route all
subnets of each VPC and
whether that is necessary to accomplish the intended purposes for peering the
VPCs.
Via CLI: List all the route tables from a VPC and check if 'GatewayId' is
pointing to a
<peering_connection_id> (e.g. pcx-1a2b3c4d) and if 'DestinationCidrBlock' is as

specific as desired.
aws ec2 describe-route-tables --filter 'Name=vpc-id,Values=<vpc_id>' --query
'RouteTables[*].{RouteTableId:RouteTableId, VpcId:VpcId, Routes:Routes,
AssociatedSubnets:Associations[*].SubnetId}'
"
  tag "fix": "Remove and add route table entries to ensure that the least
number of subnets or hosts as
is required to accomplish the purpose for peering are routable.
Via CLI: For each <route_table_id> containing routes non compliant with your
routing policy
(which grants more than desired 'least access'), delete the non compliant
route:
aws ec2 delete-route --route-table-id <route_table_id> --destination-cidr-block

<non_compliant_destination_CIDR> Create a new compliant route:
aws ec2 create-route --route-table-id <route_table_id> --destination-cidr-block

<compliant_destination_CIDR> --vpc-peering-connection-id
<peering_connection_id>
"
end
