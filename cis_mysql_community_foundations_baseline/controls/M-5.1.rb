control "M-5.1" do
  title "5.1 Ensure Only Administrative Users Have Full Database Access
(Scored)"
  desc  "The mysql.user and mysql.db tables list a variety of privileges that
can be granted (or denied) to MySQL users.   Some of the privileges of concern
include:  Select_priv, Insert_priv, Update_priv, Delete_priv, Drop_priv, and so
on. Typically, these privileges should not be available to every MySQL user and
often are reserved for administrative use only. Limiting the accessibility of
the 'mysql' database will protect the confidentiality, integrity, and
availability of the data housed within MySQL. A user which has direct access to
mysql.* might view password hashes, change permissions, or alter or destroy
information intentionally or unintentionally. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "5.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement(s) to assess this
recommendation:
SELECT user, host
FROM mysql.user
WHERE (Select_priv = 'Y')
OR (Insert_priv = 'Y')
OR (Update_priv = 'Y')
OR (Delete_priv = 'Y')
OR (Create_priv = 'Y')
OR (Drop_priv = 'Y');
SELECT user, host
FROM mysql.db
WHERE db = 'mysql'
AND ((Select_priv = 'Y')
OR (Insert_priv = 'Y')
OR (Update_priv = 'Y')
OR (Delete_priv = 'Y')

OR (Create_priv = 'Y')
OR (Drop_priv = 'Y'));
Ensure all users returned are administrative users.
"
  tag "fix": "Perform the following actions to remediate this setting:
Enumerate non-administrative users resulting from the audit
procedure For each non-administrative user, use the REVOKE statement to
remove privileges as
appropriate
"
end
