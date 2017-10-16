control "M-2.4" do
  title "2.4 Ensure CloudTrail trails are integrated with CloudWatch Logs
(Scored)"
  desc  "AWS CloudTrail is a web service that records AWS API calls made in a
given AWS account. The recorded information includes the identity of the API
caller, the time of the API call, the source IP address of the API caller, the
request parameters, and the response elements returned by the AWS service.
CloudTrail uses Amazon S3 for log file storage and delivery, so log files are
stored durably. In addition to capturing CloudTrail logs within a specified S3
bucket for long term analysis, realtime analysis can be performed by
configuring CloudTrail to send logs to CloudWatch Logs. For a trail that is
enabled in all regions in an account, CloudTrail sends log files from all those
regions to a CloudWatch Logs log group. It is recommended that CloudTrail logs
be sent to CloudWatch Logs. Note: The intent of this recommendation is to
ensure AWS account activity is being captured, monitored, and appropriately
alarmed on. CloudWatch Logs is a native way to accomplish this using AWS
services but does not preclude the use of an alternate solution. Sending
CloudTrail logs to CloudWatch Logs will facilitate real-time and historic
activity logging based on user, API, resource, and IP address, and provides
opportunity to establish alarms and notifications for anomalous or sensitivity
account activity. "
  impact 0.5
  tag "ref": "1. https://aws.amazon.com/cloudtrail/ 2. CCE-78916-4 3. CIS CSC
v6.0 #6.6, #14.6"
  tag "severity": "medium"
  tag "cis_id": "2.4"
  tag "cis_control": "6.6 14.6"
  tag "cis_level": "Level 1"
  tag "nist": ["SI-4 (2)"]
  tag "audit": "Perform the following to ensure CloudTrail is configured as
prescribed:
Via the AWS management Console Sign in to the AWS Management Console and open
the CloudTrail console
at https://console.aws.amazon.com/cloudtrail/ Under All Buckets, click on the
target bucket you wish to evaluate Click Properties on the top right of the
console Click Trails in the left menu Ensure a CloudWatch Logs log group is
configured and has a recent (~one dayld) Last log file delivered timestamp.
Via CLI Run the following command to get a listing of existing trails:
aws cloudtrail describe-trails Ensure CloudWatchLogsLogGroupArn is not empty
and note the value of the Name
property. Using the noted value of the Name property, run the following
command:
aws cloudtrail get-trail-status --name <trail_name> Ensure the
LatestcloudwatchLogdDeliveryTime property is set to a recent (~one
day old) timestamp.
"
  tag "fix": "Perform the following to establish the prescribed state:
Via the AWS management Console Sign in to the AWS Management Console and open
the CloudTrail console
at https://console.aws.amazon.com/cloudtrail/ Under All Buckets, click on the
target bucket you wish to evaluate Click Properties on the top right of the
console Click Trails in the left menu Click on each trail where no CloudWatch
Logs are defined Go to the CloudWatch Logs section and click on Configure
Define a new or select an existing log group Click on Continue Configure IAM
Role which will deliver CloudTrail events to CloudWatch Logs Create/Select an
IAM Role and Policy Name Click Allow to continue
Via CLI
aws cloudtrail update-trail --name <trail_name> --cloudwatch-logs-log-group-arn

<cloudtrail_log_group_arn> --cloudwatch-logs-role-arn
<cloudtrail_cloudwatchLogs_role_arn>
"
end
