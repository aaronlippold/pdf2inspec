control "M-2.6" do
  title "2.6 Set a Password Expiry Policy for Specific Users (Not Scored)"
  desc  "Password expiry for specific users provides user passwords with a
unique time bounded lifetime. Allows additional security factors pertinent to a
specific user to provide further password security; predetermined by varying
security needs and usability requirements in a system or organization [1]. "
  impact 0.5
  tag "ref": "1. [1]
http://csrc.nist.gov/publications/drafts/800-­‐118/draft-­‐sp800-­‐118.pdf(ES-­‐2)
"
  tag "severity": "medium"
  tag "cis_id": "2.6"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Returns all users currently using the global setting
default_password_life, and hence have
no specific user password expiry set.
SELECT user, host, password_lifetime from mysql.user from mysql.user where
password_lifetime IS NULL;
"
  tag "fix": "Using the user and host information from the audit procedure, set
each user a password
lifetime e.g.
ALTER USER 'jeffrey'@'localhost' PASSWORD EXPIRE INTERVAL 90 DAY;
"
  tag "Default Value": "NULL. The user's password_lifetime takes on the value
set in global\ndefault_password_lifetime variable.\n"
end
