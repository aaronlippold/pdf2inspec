control "M-5.8" do
  title "5.8 Ensure 'repl_slave_priv' Is Not Set to 'Y' for Non-­‐Slave Users
(Scored)"
  desc  "The REPLICATION SLAVE privilege governs whether a given user (in the
context of the master server) can request updates that have been made on the
master server. The REPLICATION SLAVE privilege allows a principal to fetch
binlog files containing all data changing statements and/or changes in table
data from the master. This may be used by an attacker to read/fetch sensitive
data from MySQL. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/privileges-­‐
provided.html#priv_replication-­‐slave "
  tag "severity": "medium"
  tag "cis_id": "5.8"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to audit this setting:

SELECT user, host FROM mysql.user WHERE Repl_slave_priv = 'Y';
Ensure only accounts designated for slave users are granted this privilege.
"
  tag "fix": "Perform the following steps to remediate this setting: Enumerate
the non-­‐slave users found in the result set of the audit procedure For each
user, issue the following SQL statement (replace '<user>' with the non-­‐
slave user):
REVOKE REPLICATION SLAVE ON *.* FROM <user>; Use the REVOKE statement to remove
the SUPER privilege from users who shouldn't have
it.
"
end
