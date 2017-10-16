control "M-1.14" do
  title "1.14 Ensure hardware MFA is enabled for the 'root' account (Scored)"
  desc  "The root account is the most privileged user in an AWS account. MFA
adds an extra layer of protection on top of a user name and password. With MFA
enabled, when a user signs in to an AWS website, they will be prompted for
their user name and password as well as for an authentication code from their
AWS MFA device. For Level 2, it is recommended that the root account be
protected with a hardware MFA. A hardware MFA has a smaller attack surface than
a virtual MFA. For example, a hardware MFA does not suffer the attack surface
introduced by the mobile smartphone on which a virtual MFA resides. Note: Using
hardware MFA for many, many AWS accounts may create a logistical device
management issue. If this is the case, consider implementing this Level 2
recommendation selectively to the highest security AWS accounts and the Level 1
recommendation applied to the remaining accounts. Link to order AWS compatible
hardware MFA device: http://onlinenoram.gemalto.com/ "
  impact 0.5
  tag "ref": "1. 2. 3. 4. CCE-78911-5 CIS CSC v6.0 #5.6, #11.4, #12.6, #16.11
Order Hardware MFA: http://onlinenoram.gemalto.com/
http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_vir
tual.html 5.
http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_enable_ph
ysical.html#enable-hw-mfa-for-root"
  tag "severity": "medium"
  tag "cis_id": "1.14"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 2"
  tag "nist": ["Not Mapped"]
  tag "audit": "Perform the following to determine if the root account has a
hardware MFA setup: Run the following command to list all virtual MFA devices:

aws iam list-virtual-mfa-devices If the output contains one MFA with the
following Serial Number, it means the MFA
is virtual, not hardware and the account is not compliant with this
recommendation:
'SerialNumber': 'arn:aws:iam::<aws_account_number>:mfa/root-account-mfa-device'

"
  tag "fix": "Perform the following to establish a hardware MFA for the root
account: Sign in to the AWS Management Console and open the IAM console at
https://console.aws.amazon.com/iam/.
Note: to manage MFA devices for the root AWS account, you must use your root
account
credentials to sign in to AWS. You cannot manage MFA devices for the root
account
using other credentials. Choose Dashboard, and under Security Status, expand
Activate MFA on your root
account. Choose Activate MFA In the wizard, choose A hardware MFA device and
then choose Next Step. In the Serial Number box, enter the serial number that
is found on the back of the
MFA device. In the Authentication Code 1 box, enter the six-digit number
displayed by the
MFA device. You might need to press the button on the front of the device to
display
the number. Wait 30 seconds while the device refreshes the code, and then enter
the next sixdigit number into the Authentication Code 2 box. You might need to
press the
button on the front of the device again to display the second number. Choose
Next Step. The MFA device is now associated with the AWS account. The
next time you use your AWS account credentials to sign in, you must type a code

from the hardware MFA device.
"
end
