control "M-1.1" do
  title "1.1 Avoid the use of the 'root' account (Scored)"
  desc  "The 'root' account has unrestricted access to all resources in the AWS
account. It is highly recommended that the use of this account be avoided. The
'root' account is the most privileged AWS account. Minimizing the use of this
account and adopting the principle of least privilege for access management
will reduce the risk of accidental changes and unintended disclosure of highly
privileged credentials. "
  impact 0.5
  tag "ref": "1.
http://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html 2. CIS CSC
v6.0 #5.1"
  tag "severity": "medium"
  tag "cis_id": "1.1"
  tag "cis_control": "5.1"
  tag "cis_level": "Level 1"
  tag "nist": ["AC-6 (9)"]
  tag "audit": "Implement the Ensure a log metric filter and alarm exist for
usage of 'root'
account recommendation in the Monitoring section of this benchmark to receive
notifications of root account usage. Additionally, executing the following
commands will
provide ad-hoc means for determining the last time the root account was used:
aws iam generate-credential-report
aws iam get-credential-report --query 'Content' --output text | base64 -d | cut
-d, f1,5,11,16 | grep -B1 '<root_account>'
Note: there are a few conditions under which the use of the root account is
required, such
as requesting a penetration test or creating a CloudFront private key.
"
  tag "fix": "Follow the remediation instructions of the Ensure IAM policies
are attached only to
groups or roles recommendation
"
end
