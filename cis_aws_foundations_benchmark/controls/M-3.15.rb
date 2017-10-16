control "M-3.15" do
  title "3.15 Ensure appropriate subscribers to each SNS topic (Not Scored)"
  desc  "AWS Simple Notification Service (SNS) is a web service that can
publish messages from an application and immediately deliver them to
subscribers or other applications. Subscribers are clients interested in
receiving notifications from topics of interest; they can subscribe to a topic
or be subscribed by the topic owner. When publishers have information or
updates to notify their subscribers about, they can publish a message to the
topic – which immediately triggers Amazon SNS to deliver the message to all
applicable subscribers. It is recommended that the list of subscribers to given
topics be periodically reviewed for appropriateness. Reviewing subscriber
topics will help ensure that only expected recipients receive information
published to SNS topics. "
  impact 0.5
  tag "ref": "1. https://aws.amazon.com/sns/"
  tag "severity": "medium"
  tag "cis_id": "3.15"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 1"
  tag "nist": ["Not Mapped"]
  tag "audit": "Perform the following to ensure appropriate subscribers:
Via the AWS Management console: Sign in to the AWS Management Console and open
the SNS console
at https://console.aws.amazon.com/sns/ Click on Topics in the left navigation
pane Evaluate Topics by clicking on the value within the ARN column Within a
selected Topic evaluate:
 Topic owner
 Region Within the Subscriptions section evaluate:
 Subscription ID
 Protocol
 Endpoint
 Subscriber (Account ID)
Via CLI:
aws sns list-topics
aws sns list-subscriptions-by-topic --topic-arn <topic_arn>
"
  tag "fix": "Perform the following to remove undesired subscriptions:
Via Management Console Sign in to the AWS Management Console and open the SNS
console
at https://console.aws.amazon.com/sns/ Click on Subscriptions in the left
navigation pane For any undesired subscription, select the corresponding
checkboxes Click Actions Click Delete Subscriptions
"
  tag "Default Value": "Not Applicable\n"
end
