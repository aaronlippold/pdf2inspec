control "M-1.17" do
  title "1.17 Enable detailed billing (Scored)"
  desc  "Enable Detailed Billing to cause the generation of a log record for
every event or hourly ongoing activity which incurs cost in an AWS account.
These records are aggregated into CSV files of hourly records, and written to
an S3 bucket. A CSV (Comma Separated Values) file of billing records is written
at least every 24 hours; writing of files is often more frequent. Detailed
Billing records can be used as an overview of AWS activity across the whole of
an account, in addition to per-Region CloudTrail, Config and other
service-specific JSON-based logs. Billing records can be graphed over time
using the Cost Explorer tool, and budgeting alerts can be configured on billing
records and pushed to SNS in the event of spend over time, or predicted spend
at current rate, going above a customer-set threshold - this can be used as a
simple means of detecting anomalous utilisation of AWS resources and thereby
triggering investigation activities. Billing records can also be broken out by
tag, which can serve as a starting point in identifying which part of the
environment, or organisation, the anomalous activity is occurring in. "
  impact 0.5
  tag "ref": "1.
https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-whatis.html
2.
https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billingpermissions-ref.html#billing-example-policies"
  tag "severity": "medium"
  tag "cis_id": "1.17"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "There is currently no AWS CLI support for this operation,
so it is necessary to use the
Management Console.
As a user with IAM permission to read billing information
(aws-portal:ViewBilling): Sign in to the AWS Management Console and open the
Billing and Cost Management
console at https://console.aws.amazon.com/billing/home#/. On the navigation
pane, choose Preferences. Verify whether the “Receive Billing Reports” check
box is ticked. If it is not, billing
reports are not being generated.
"
  tag "fix": "There is currently no AWS CLI support for this operation, so it
is necessary to use the
Management Console.
As a user with IAM permission to read and write billing information
(aws-portal:*Billing):
Sign in to the AWS Management Console and open the Billing and Cost Management

console at https://console.aws.amazon.com/billing/home#/.
On the navigation pane, choose Preferences.
Select the Receive Billing Reports check box.
Designate the Amazon S3 bucket <S3_billing_bucket> where you want AWS to
publish your detailed billing reports.
Ensure that policy allows read access only to appropriate groups of users
(finance,
auditors, etc). For appropriate groups in IAM who you want to have read access,

include the following policy element:'Statement':[
{
'Effect':'Allow',
'Action':[
's3:GetObject',
's3:GetObjectVersion”,
“s3:GetBucketLocation'
],
'Resource':'arn:aws:s3:::<S3_billing_bucket>/*'
}
]
After your S3 bucket has been verified, under Report, select the check boxes
for the
reports that you want to receive.
Choose Save preferences
Detailed billing reports can take up to 24 hours to start being generated. Wait
>24
hours, and examine your designated S3 bucket to verify that files with names of
the
form (eg) <AWS account
number>-<aws-billing-detailed-line-items-with-resourcesand-tags-yyyy-mm>.csv.zip
are being generated.
"
end
