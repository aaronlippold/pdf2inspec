control "M-2.3" do
  title "2.3 Ensure the S3 bucket CloudTrail logs to is not publicly accessible
(Scored)"
  desc  "CloudTrail logs a record of every API call made in your AWS account.
These logs file are stored in an S3 bucket. It is recommended that the bucket
policy or access control list (ACL) applied to the S3 bucket that CloudTrail
logs to prevents public access to the CloudTrail logs. Allowing public access
to CloudTrail log content may aid an adversary in identifying weaknesses in the
affected account's use or configuration. "
  impact 0.5
  tag "ref": "1. CCE-78915-6"
  tag "severity": "medium"
  tag "cis_id": "2.3"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 1"
  tag "nist": ["Not Mapped"]
  tag "audit": "Perform the following to determine if any public access is
granted to an S3 bucket via an
ACL or S3 bucket policy:
Via the Management Console Go to the Amazon CloudTrail console
at https://console.aws.amazon.com/cloudtrail/home In the API activity history
pane on the left, click Trails In the Trails pane, note the bucket names in the
S3 bucket column Go to Amazon S3 console at
https://console.aws.amazon.com/s3/home For each bucket noted in step 3,
right-click on the bucket and click Properties In the Properties pane, click
the Permissions tab. The tab shows a list of grants, one row per grant, in the
bucket ACL. Each row
identifies the grantee and the permissions granted. Ensure no rows exists that
have the Grantee set to Everyone or the Grantee set to
Any Authenticated User. If the Edit bucket policy button is present, click it
to review the bucket policy.
10. Ensure the policy does not contain a Statement having an Effect set to
Allow and
a Principal set to *.
Via CLI: Get the name of the S3 bucket that CloudTrail is logging to:
aws cloudtrail describe-trails --query 'trailList[*].S3BucketName' Ensure the
AllUsers principal is not granted privileges to that <bucket>:
aws s3api get-bucket-acl --bucket <s3_bucket_for_cloudtrail> --query
'Grants[?Grantee.URI==`http://acs.amazonaws.com/groups/global/AllUsers`]'
Ensure the AuthenticatedUsersprincipal is not granted privileges to that
<bucket>:
aws s3api get-bucket-acl --bucket <s3_bucket_for_cloudtrail> --query
'Grants[?Grantee.URI==`http://acs.amazonaws.com/groups/global/Authenticated
Users`]' Get the S3 Bucket Policy
aws s3api get-bucket-policy --bucket <s3_bucket_for_cloudtrail> Ensure the
policy does not contain a Statement having an Effect set to Allow and a
Principal set to *.
"
  tag "fix": "Perform the following to remove any public access that has been
granted to the bucket via
an ACL or S3 bucket policy:
Go to Amazon S3 console at https://console.aws.amazon.com/s3/home
Right-click on the bucket and click Properties
In the Properties pane, click the Permissions tab.
The tab shows a list of grants, one row per grant, in the bucket ACL. Each row

identifies the grantee and the permissions granted.
Select the row that grants permission to Everyone or Any Authenticated User
Uncheck all the permissions granted to Everyone or Any Authenticated
User (click x to delete the row).
Click Save to save the ACL.
If the Edit bucket policy button is present, click it.
Remove any Statement having an Effect set to Allow and a Principal set to *.
"
  tag "Default Value": "By default, S3 buckets are not publicly accessible\n"
end
