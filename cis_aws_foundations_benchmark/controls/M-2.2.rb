control "M-2.2" do
  title "2.2 Ensure CloudTrail log file validation is enabled (Scored)"
  desc  "CloudTrail log file validation creates a digitally signed digest file
containing a hash of each log that CloudTrail writes to S3. These digest files
can be used to determine whether a log file was changed, deleted, or unchanged
after CloudTrail delivered the log. It is recommended that file validation be
enabled on all CloudTrails. Enabling log file validation will provide
additional integrity checking of CloudTrail logs. "
  impact 0.5
  tag "ref": "1.
http://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-filevalidation-enabling.html
2. CCE-78914-9 3. CIS CSC v6.0 #6.3"
  tag "severity": "medium"
  tag "cis_id": "2.2"
  tag "cis_control": [["6.3"], "6.1"]
  tag "cis_level": 2
  tag "nist": [["AU-4", 4]]
  tag "audit text": "Perform the following on each trail to determine if log
file validation is enabled:
Via the management Console Sign in to the AWS Management Console and open the
IAM console
at https://console.aws.amazon.com/cloudtrail Click on Trails on the left
navigation pane You will be presented with a list of trails across all regions
Ensure at least one Trail has All specified in the Region column Click on a
trail via the link in the Name column Under the S3 section, ensure Enable log
file validation is set to Yes
Via CLI
aws cloudtrail describe-trails
Ensure LogFileValidationEnabled is set to true for each trail.
"
  tag "fix": "Perform the following to enable log file validation on a given
trail:
Via the management Console Sign in to the AWS Management Console and open the
IAM console
at https://console.aws.amazon.com/cloudtrail Click on Trails on the left
navigation pane
Click on target trail
Within the S3 section click on the edit icon (pencil)
Click Advanced
Click on the Yes radio button in section Enable log file validation
Click Save
Via CLI
aws cloudtrail update-trail --name <trail_name> --enable-log-file-validation
Note that periodic validation of logs using these digests can be performed by
running the
following command:
aws cloudtrail validate-logs --trail-arn <trail_arn> --start-time <start_time>
--endtime <end_time>
"
  tag "Default Value": "Not Enabled\n"
end
