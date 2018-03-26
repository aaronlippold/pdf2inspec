control "M-5.5" do
  title "5.5 Ensure 'shutdown_priv' Is Not Set to 'Y' for Non-­‐Administrative
Users (Scored)"
  desc  "The SHUTDOWN privilege simply enables use of the shutdown option to
the mysqladmin command, which allows a user with the SHUTDOWN privilege the
ability to shut down the MySQL server. The SHUTDOWN privilege allows principals
to shutdown MySQL. This may be leveraged by an attacker to negatively impact
the availability of MySQL. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/privileges-­‐
provided.html#priv_shutdown "
  tag "severity": "medium"
  tag "cis_id": "5.5"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to audit this setting:

SELECT user, host FROM mysql.user WHERE Shutdown_priv = 'Y';
Ensure only administrative users are returned in the result set.
"
  tag "fix": "Perform the following steps to remediate this setting: Enumerate
the non-­‐administrative users found in the result set of the audit
procedure For each user, issue the following SQL statement (replace '<user>'
with the non-­‐
administrative user):
REVOKE SHUTDOWN ON *.* FROM '<user>';
"
end
