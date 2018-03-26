control "M-5.3" do
  title "5.3 Ensure 'process_priv' Is Not Set to 'Y' for Non-­‐Administrative
Users (Scored)"
  desc  "The PROCESS privilege found in the mysql.user table determines whether
a given user can see statement execution information for all sessions. The
PROCESS privilege allows principals to view currently executing MySQL
statements beyond their own, including statements used to manage passwords.
This may be leveraged by an attacker to compromise MySQL or to gain access to
potentially sensitive data. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/privileges-­‐provided.html#priv_process "
  tag "severity": "medium"
  tag "cis_id": "5.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Execute the following SQL statement to audit this setting:

select user, host from mysql.user where Process_priv = 'Y';
Ensure only administrative users are returned in the result set.
"
  tag "fix": "Perform the following steps to remediate this setting: Enumerate
the non-­‐administrative users found in the result set of the audit
procedure For each user, issue the following SQL statement (replace '<user>'
with the non-­‐
administrative user:
REVOKE PROCESS ON *.* FROM '<user>';
"
end
