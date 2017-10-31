control "M-3.5" do
  title "3.5 Ensure a log metric filter and alarm exist for CloudTrail
configuration changes (Scored)"
  desc  "Real-time monitoring of API calls can be achieved by directing
CloudTrail Logs to CloudWatch Logs and establishing corresponding metric
filters and alarms. It is recommended that a metric filter and alarm be
established for detecting changes to CloudTrail's configurations. Monitoring
changes to CloudTrail's configuration will help ensure sustained visibility to
activities performed in the AWS account. "
  impact 0.5
  tag "ref": "1. CCE-79190-5"
  tag "severity": "medium"
  tag "cis_id": "3.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Perform the following to determine if the account is
configured as prescribed: Identify the log group name configured for use with
CloudTrail:
aws cloudtrail describe-trails Note the <cloudtrail_log_group_name> value
associated with
CloudWatchLogsLogGroupArn:
'arn:aws:logs:eu-west-1:<aws_account_number>:log-group:<cloudtrail_log_group_name>:*'
Get a list of all associated metric filters for this
<cloudtrail_log_group_name>:
aws logs describe-metric-filters --log-group-name '<cloudtrail_log_group_name>'
Ensure the output from the above command contains the following:
'filterPattern': '{ ($.eventName = CreateTrail) || ($.eventName = UpdateTrail)
||
($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName =
StopLogging) }' Note the <cloudtrail_cfg_changes_metric> value associated with
the filterPattern
found in step 4. Get a list of CloudWatch alarms and filter on the
<cloudtrail_cfg_changes_metric>
captured in step 5.
aws cloudwatch describe-alarms --query
'MetricAlarms[?MetricName==`<cloudtrail_cfg_changes_metric>`]' Note the
AlarmActions value - this will provide the SNS topic ARN value. Ensure there is
at least one subscriber to the SNS topic
aws sns list-subscriptions-by-topic --topic-arn <sns_topic_arn>
"
  tag "fix": "Perform the following to setup the metric filter, alarm, SNS
topic, and subscription: Create a metric filter based on filter pattern
provided which checks for Cloudtrail
configuration changes and the <cloudtrail_log_group_name> taken from audit step
2.
aws logs put-metric-filter --log-group-name <cloudtrail_log_group_name>
--filter-name
<cloudtrail_cfg_changes_metric> --metric-transformations
metricName=<cloudtrail_cfg_changes_metric>,metricNamespace='CISBenchmark',metricVal

ue=1 --filter-pattern '{ ($.eventName = CreateTrail) || ($.eventName =
UpdateTrail) ||
($.eventName = DeleteTrail) || ($.eventName = StartLogging) || ($.eventName =
StopLogging) }'
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
aws cloudwatch put-metric-alarm --alarm-name <cloudtrail_cfg_changes_alarm>
-metric-name <cloudtrail_cfg_changes_metric> --statistic Sum --period 300
-threshold 1 --comparison-operator GreaterThanOrEqualToThreshold
--evaluation-periods 1
--namespace 'CISBenchmark' --alarm-actions <sns_topic_arn>
"
end
