control "M-2.8" do
  title "2.8 Ensure rotation for customer created CMKs is enabled (Scored)"
  desc  "AWS Key Management Service (KMS) allows customers to rotate the
backing key which is key material stored within the KMS which is tied to the
key ID of the Customer Created customer master key (CMK). It is the backing key
that is used to perform cryptographic operations such as encryption and
decryption. Automated key rotation currently retains all prior backing keys so
that decryption of encrypted data can take place transparently. It is
recommended that CMK key rotation be enabled. Rotating encryption keys helps
reduce the potential impact of a compromised key as data encrypted with a new
key cannot be accessed with a previous key that may have been exposed. "
  impact 0.5
  tag "ref": "1. https://aws.amazon.com/kms/pricing/ 2.
http://csrc.nist.gov/publications/nistpubs/800-57/sp80057_part1_rev3_general.pdf
3. CCE-78920-6"
  tag "severity": "medium"
  tag "cis_id": "2.8"
  tag "cis_control": "No CIS Control"
  tag "cis_level": "Level 2"
  tag "nist": ["Not Mapped"]
  tag "audit": "Via the Management Console: Sign in to the AWS Management
Console and open the IAM console at
https://console.aws.amazon.com/iam. In the left navigation pane, choose
Encryption Keys. Select a customer created master key (CMK) Under the Key
Policy section, move down to Key Rotation. Ensure the Rotate this key every
year checkbox is checked.
Via CLI Run the following command to get a list of all keys and their
associated KeyIds
aws kms list-keys For each key, note the KeyId and run the following command
aws kms get-key-rotation-status --key-id <kms_key_id> Ensure KeyRotationEnabled
is set to true
"
  tag "fix": "Via the Management Console: Sign in to the AWS Management Console
and open the IAM console
at https://console.aws.amazon.com/iam. In the left navigation pane, choose
Encryption Keys. Select a customer created master key (CMK) Under the Key
Policy section, move down to Key Rotation. Check the Rotate this key every year
checkbox.
Via CLI Run the following command to enable key rotation:
aws kms enable-key-rotation --key-id <kms_key_id>
"
end
