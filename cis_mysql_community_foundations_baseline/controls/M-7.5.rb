control "M-7.5" do
  title "7.5 Ensure Password Complexity Is in Place (Scored)"
  desc  "Password complexity includes password characteristics such as length,
case, length, and character sets. Complex passwords help mitigate dictionary,
brute forcing, and other password attacks.  This recommendation prevents users
from choosing weak passwords which can easily be guessed. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/validate-password-plugin.html"
  tag "severity": "medium"
  tag "cis_id": "7.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statements to assess this
recommendation:
SHOW VARIABLES LIKE 'validate_password%';
The result set from the above statement should show:
 validate_password_length should be 14 or more
 validate_password_mixed_case_count should be 1 or more
 validate_password_number_count should be 1 or more

 validate_password_special_char_count should be 1 or more
 validate_password_policy should be MEDIUM or STRONG
The following lines should be present in the global configuration:
plugin-load=validate_password.so
validate-password=FORCE_PLUS_PERMANENT
Check if users have a password which is identical to
the username:
SELECT user,authentication_string,host FROM mysql.user
WHERE authentication_string=CONCAT('*', UPPER(SHA1(UNHEX(SHA1(user)))));
NOTE: This method is only capable of checking the
post-4.1 password format which is also
known as mysql_native_password.
"
  tag "fix": "Add to the global configuration:
plugin-load=validate_password.so
validate-password=FORCE_PLUS_PERMANENT
validate_password_length=14
validate_password_mixed_case_count=1
validate_password_number_count=1
validate_password_special_char_count=1
validate_password_policy=MEDIUM
And change passwords for users which have passwords which
are identical to their
username.
"
end
