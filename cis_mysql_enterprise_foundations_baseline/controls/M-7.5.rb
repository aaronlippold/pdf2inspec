control "M-7.5" do
  title "7.5 Ensure Passwords Are Set for All MySQL Accounts (Scored)"
  desc  "Blank passwords allow a user to login without using a password.
Without a password only knowing the username and the list of allowed hosts will
allow someone to connect to the server and assume the identity of the user.
This, in effect, bypasses authentication mechanisms. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "7.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL query to determine if any users
have a blank password:
SELECT User,host
FROM mysql.user
WHERE (plugin IN('mysql_native_password', 'mysql_old_password')
AND (LENGTH(Password) = 0
OR Password IS NULL))
OR (plugin='sha256_password' AND LENGTH(authentication_string) = 0);
No rows will be returned if all accounts have a password set.
"
  tag "fix": "For each row returned from the audit procedure, set a password
for the given user using
the following statement (as an example):
SET PASSWORD FOR <user>@'<host>' = PASSWORD('<clear password>')
NOTE: Replace <user>, <host>, and <clear password> with appropriate values. "
end
