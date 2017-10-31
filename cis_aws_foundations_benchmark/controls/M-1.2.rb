control "M-1.2" do
  title "1.2 Ensure multi-factor authentication (MFA) is enabled for all IAM
users that have a console password (Scored)"
  desc  "Multi-Factor Authentication (MFA) adds an extra layer of protection on
top of a user name and password. With MFA enabled, when a user signs in to an
AWS website, they will be prompted for their user name and password as well as
for an authentication code from their AWS MFA device. It is recommended that
MFA be enabled for all accounts that have a console password. Enabling MFA
provides increased security for console access as it requires the
authenticating principal to possess a device that emits a time-sensitive key
and have knowledge of a credential. "
  impact 0.5
  tag "ref": "1. 2. 3. 4. http://tools.ietf.org/html/rfc6238
http://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa.html
CCE-78901-6 CIS CSC v6.0 #5.6, #11.4, #12.6, #16.11"
  tag "severity": "medium"
  tag "cis_id": "1.2"
  tag "cis_control": [["5.6", "11.4", "12.6", "16.11"], "6.1"]
  tag "cis_level": 1
  tag "nist": [["IA-2 (1)", 4], ["SC-23", 4], ["IA-2 (1)", 4], ["IA-2 (1)", 4]]
  tag "audit text": "Perform the following to determine if a MFA device is
enabled for all IAM users having a
console password:
Via Management Console Open the IAM console at
https://console.aws.amazon.com/iam/. In the left pane, select Users If the MFA
Device or Password columns are not visible in the table, click the gear
icon at the upper right corner of the table and ensure a checkmark is next to
both,
then click Close. Ensure each user having a checkmark in the Password column
also has a value in the
MFA Device column.
Via the CLI Run the following command (OSX/Linux/UNIX) to generate a list of
all IAM users
along with their password and MFA status:
aws iam generate-credential-report
aws iam get-credential-report --query 'Content' --output text | base64 -d | cut

-d, -f1,4,8 The output of this command will produce a table similar to the
following:
user,password_enabled,mfa_active
elise,false,false
brandon,true,true
rakesh,false,false
helene,false,false
paras,true,true
anitha,false,false For any column having password_enabled set to true, ensure
mfa_active is also set
to true.
"
  tag "fix": "Perform the following to enable MFA: Sign in to the AWS
Management Console and open the IAM console at
https://console.aws.amazon.com/iam/. In the navigation pane, choose Users. In
the User Name list, choose the name of the intended MFA user. Choose the
Security Credentials tab, and then choose Manage MFA Device. In the Manage MFA
Device wizard, choose A virtual MFA device, and then choose
Next Step.
IAM generates and displays configuration information for the virtual MFA
device,
including a QR code graphic. The graphic is a representation of the 'secret
configuration key' that is available for manual entry on devices that do not
support
QR codes. Open your virtual MFA application. (For a list of apps that you can
use for hosting
virtual MFA devices, see Virtual MFA Applications.) If the virtual MFA
application
supports multiple accounts (multiple virtual MFA devices), choose the option to

create a new account (a new virtual MFA device). Determine whether the MFA app
supports QR codes, and then do one of the
following:
o Use the app to scan the QR code. For example, you might choose the camera
icon or choose an option similar to Scan code, and then use the device's
camera to scan the code.
o In the Manage MFA Device wizard, choose Show secret key for manual
configuration, and then type the secret configuration key into your MFA
application.
When you are finished, the virtual MFA device starts generating one-time
passwords. In the Manage MFA Device wizard, in the Authentication Code 1 box,
type the onetime password that currently appears in the virtual MFA device.
Wait up to 30
seconds for the device to generate a new one-time password. Then type the
second
one-time password into the Authentication Code 2 box. Choose Active Virtual
MFA.
Forced IAM User Self-Service Remediation
Amazon has published a pattern that forces users to self-service setup MFA
before they
have access to their complete permissions set. Until they complete this step,
they
cannot access their full permissions. This pattern can be used on new AWS
accounts. It can also be used on existing accounts - it is recommended users
are given
instructions and a grace period to accomplish MFA enrollment before active
enforcement on existing AWS accounts.
How to Delegate Management of Multi-Factor Authentication to AWS IAM Users
"
end
