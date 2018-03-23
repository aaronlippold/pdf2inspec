control "M-7.4" do
  title "7.4 Ensure 'default_password_lifetime' Is Less Than Or Equal To '90'
(Scored)"
  desc  "Password expiry provides passwords with a time bounded lifetime. This
benchmark prevents a password being set for an indefinite period, therefore
reducing the time available a compromised password is known to an attacker. "
  impact 0.5
  tag "ref": "1.
https://dev.mysql.com/doc/refman/5.7/en/password-expiration-policy.html 2.
https://dev.mysql.com/doc/refman/5.7/en/password-expiration-sandbox- mode.html"
  tag "severity": "medium"
  tag "cis_id": "7.4"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Level 1 MySQL RDBMS:
SHOW VARIABLES LIKE 'default_password_lifetime';
default_password_lifetime should be less than or equal to
90.
"
  tag "fix": "Level 1 MySQL RDBMS: global policy
SET GLOBAL default_password_lifetime=90
and in the configuration file: default_password_lifetime=90
As part of Installation and Planning consider set an expiry
policy for specific users. Doing
this will take precedence over the setting specified in
default_password_lifetime. For
example:
ALTER USER 'jeffrey'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
"
  tag "Default Value": "global policy:\ndefault_password_lifetime=360\nper user
policy:\nDEFAULT - as per default_password_lifetime value.\n"
end
