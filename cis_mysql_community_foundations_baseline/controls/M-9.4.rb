control "M-9.4" do
  title "9.4 Ensure 'super_priv' Is Not Set to 'Y' for Replication Users
(Scored)"
  desc  "The SUPER privilege found in the mysql.user table governs the use of a
variety of MySQL features.  These features include, CHANGE MASTER TO, KILL,
mysqladmin kill option, PURGE BINARY LOGS, SET GLOBAL, mysqladmin debug option,
logging control, and more. The SUPER privilege allows principals to perform
many actions, including view and terminate currently executing MySQL statements
(including statements used to manage passwords). This privilege also provides
the ability to configure MySQL, such as enable/disable logging, alter data,
disable/enable features.  Limiting the accounts that have the SUPER privilege
reduces the chances that an attacker can exploit these capabilities. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/privileges-­‐provided.html#priv_super"
  tag "severity": "medium"
  tag "cis_id": "9.4"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to audit this setting:

select user, host from mysql.user where user='repl' and Super_priv = 'Y';
No rows should be returned.
NOTE: Substitute your replication user's name for repl in the above query.
"
  tag "fix": "Execute the following steps to remediate this setting: Enumerate
the replication users found in the result set of the audit procedure For each
replication user, issue the following SQL statement (replace 'repl' with
your replication user's name):
REVOKE SUPER ON *.* FROM 'repl';
"
end
