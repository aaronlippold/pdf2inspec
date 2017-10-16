control "M-3.11" do
  title "3.11 Ensure a log metric filter and alarm exist for changes to Network
Access Control Lists (NACL) (Scored)"
  desc  "Real-time monitoring of API calls can be achieved by directing
CloudTrail Logs to CloudWatch Logs and establishing corresponding metric
filters and alarms. NACLs are used as a stateless packet filter to control
ingress and egress traffic for subnets within a VPC. It is recommended that a
metric filter and alarm be established for changes made to NACLs. Monitoring
changes to NACLs will help ensure that AWS resources and services are not
unintentionally exposed. "
  impact 0.5
  tag "ref": "1. CCE-79196-2"
  tag "severity": "medium"
  tag "cis_id": "3.11"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 2"
  tag "nist": ["Not Mapped"]
  tag "audit": "Perform the following to determine if the account is configured
as prescribed: Identify the log group name configured for use with CloudTrail:

aws cloudtrail describe-trails Note the <cloudtrail_log_group_name> value
associated with
CloudWatchLogsLogGroupArn:
'arn:aws:logs:eu-west-1:<aws_account_number>:log-group:<cloudtrail_log_group_name>:*'
Get a list of all associated metric filters for this
<cloudtrail_log_group_name>:
aws logs describe-metric-filters --log-group-name '<cloudtrail_log_group_name>'
Ensure the output from the above command contains the following:
'filterPattern': '{ ($.eventName = CreateNetworkAcl) || ($.eventName =
CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName =
DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) ||
($.eventName =
ReplaceNetworkAclAssociation) }' Note the <nacl_changes_metric> value
associated with the filterPattern found in step Get a list of CloudWatch alarms
and filter on the <nacl_changes_metric> captured in
step 5.
aws cloudwatch describe-alarms --query
'MetricAlarms[?MetricName==`<nacl_changes_metric>`]' Note the AlarmActions
value - this will provide the SNS topic ARN value. Ensure there is at least one
subscriber to the SNS topic
aws sns list-subscriptions-by-topic --topic-arn <sns_topic_arn>
"
  tag "fix": "Perform the following to setup the metric filter, alarm, SNS
topic, and subscription: Create a metric filter based on filter pattern
provided which checks for NACL changes
and the <cloudtrail_log_group_name> taken from audit step 2.
aws logs put-metric-filter --log-group-name <cloudtrail_log_group_name>
--filter-name
<nacl_changes_metric> --metric-transformations
metricName=<nacl_changes_metric>,metricNamespace='CISBenchmark',metricValue=1
-filter-pattern '{ ($.eventName = CreateNetworkAcl) || ($.eventName =
CreateNetworkAclEntry) || ($.eventName = DeleteNetworkAcl) || ($.eventName =
DeleteNetworkAclEntry) || ($.eventName = ReplaceNetworkAclEntry) ||
($.eventName =
ReplaceNetworkAclAssociation) }'
Note: You can choose your own metricName and metricNamespace strings. Using the
same
metricNamespace for all Foundations Benchmark metrics will group them together.
Create an SNS topic that the alarm will notify
aws sns create-topic --name <sns_topic_name>
Note: you can execute this command once and then re-use the same topic for all

monitoring alarms. Create an SNS subscription to the topic created in step 2
aws sns subscribe --topic-arn <sns_topic_arn> --protocol <protocol_for_sns>
-notification-endpoint <sns_subscription_endpoints>
Note: you can execute this command once and then re-use the SNS subscription
for all
monitoring alarms. Create an alarm that is associated with the CloudWatch Logs
Metric Filter created in step
1 and an SNS topic created in step 2
aws cloudwatch put-metric-alarm --alarm-name <nacl_changes_alarm> --metric-name

<nacl_changes_metric> --statistic Sum --period 300 --threshold 1
--comparisonoperator GreaterThanOrEqualToThreshold --evaluation-periods 1
--namespace
'CISBenchmark' --alarm-actions <sns_topic_arn>
"
end
