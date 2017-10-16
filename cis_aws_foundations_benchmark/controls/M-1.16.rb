control "M-1.16" do
  title "1.16 Ensure IAM policies are attached only to groups or roles (Scored)"
  desc  "By default, IAM users, groups, and roles have no access to AWS
resources. IAM policies are the means by which privileges are granted to users,
groups, or roles. It is recommended that IAM policies be applied directly to
groups and roles but not users. Assigning privileges at the group or role level
reduces the complexity of access management as the number of users grow.
Reducing access management complexity may in-turn reduce opportunity for a
principal to inadvertently receive or retain excessive privileges. "
  impact 0.5
  tag "ref": "1.
http://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html 2.
http://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies_managed-vsinline.html
3. CCE-78912-3"
  tag "severity": "medium"
  tag "cis_id": "1.16"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 1"
  tag "nist": ["Not Mapped"]
  tag "audit": "Perform the following to determine if policies are attached
directly to users: Run the following to get a list of IAM users:
aws iam list-users --query 'Users[*].UserName' --output text For each user
returned, run the following command to determine if any policies are
attached to them:
aws iam list-attached-user-policies --user-name <iam_user>
aws iam list-user-policies --user-name <iam_user> If any policies are returned,
the user has a direct policy attachment.
"
  tag "fix": "Perform the following to create an IAM group and assign a policy
to it: Sign in to the AWS Management Console and open the IAM console at
https://console.aws.amazon.com/iam/. In the navigation pane, click Groups and
then click Create New Group. In the Group Name box, type the name of the group
and then click Next Step. In the list of policies, select the check box for
each policy that you want to apply to
all members of the group. Then click Next Step. Click Create Group
Perform the following to add a user to a given group: Sign in to the AWS
Management Console and open the IAM console
at https://console.aws.amazon.com/iam/. In the navigation pane, click Groups
Select the group to add a user to Click Add Users To Group Select the users to
be added to the group Click Add Users
Perform the following to remove a direct association between a user and policy:
Sign in to the AWS Management Console and open the IAM console
at https://console.aws.amazon.com/iam/. In the left navigation pane, click on
Users For each user: Select the user Click on the Permissions tab Expand
Managed Policies Click Detach Policy for each policy Expand Inline Policies
Click Remove Policy for each policy
"
end
