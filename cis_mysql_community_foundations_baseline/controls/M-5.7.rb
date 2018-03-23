control "M-5.7" do
  title "5.7 Ensure 'grant_priv' Is Not Set to 'Y' for Non-Administrative Users
(Scored)"
  desc  "The GRANT OPTION privilege exists in different contexts (mysql.user,
mysql.db) for the purpose of governing the ability of a privileged user to
manipulate the privileges of other users. The GRANT privilege allows a
principal to grant other principals additional privileges. This may be used by
an attacker to compromise MySQL. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/privileges-provided.html#priv_grant-
option"
  tag "severity": "medium"
  tag "cis_id": "5.7"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statements to audit this
setting:
SELECT user, host FROM mysql.user WHERE Grant_priv = 'Y';
SELECT user, host FROM mysql.db WHERE Grant_priv = 'Y';
Ensure only administrative users are returned in the result
set.

"
  tag "fix": "Perform the following steps to remediate this setting: Enumerate
the non-administrative users found in the result sets
of the audit
procedure For each user, issue the following SQL statement (replace
'<user>' with the non-
administrative user:
REVOKE GRANT OPTION ON *.* FROM <user>;
"
end
