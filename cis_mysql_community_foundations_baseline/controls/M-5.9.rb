control "M-5.9" do
  title "5.9 Ensure DML/DDL Grants Are Limited to Specific Databases and Users
(Scored)"
  desc  "DML/DDL includes the set of privileges used to modify or create data
structures.  This includes INSERT, SELECT, UPDATE, DELETE, DROP, CREATE, and
ALTER privileges. INSERT, SELECT, UPDATE, DELETE, DROP, CREATE, and ALTER are
powerful privileges in any database.  Such privileges should be limited only to
those users requiring such rights.  By limiting the users with these rights and
ensuring that they are limited to specific databases, the attack surface of the
database is reduced. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "5.9"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to audit this setting:

SELECT User,Host,Db
FROM mysql.db
WHERE Select_priv='Y'
OR Insert_priv='Y'
OR Update_priv='Y'
OR Delete_priv='Y'
OR Create_priv='Y'
OR Drop_priv='Y'
OR Alter_priv='Y';
Ensure all users returned should have these privileges on the
indicated databases.

NOTE: Global grants are covered in Recommendation 4.1.
"
  tag "fix": "Perform the following steps to remediate this setting: Enumerate
the unauthorized users, hosts, and databases returned
in the result set of
the audit procedure For each user, issue the following SQL statement (replace
'<user>' with the
unauthorized user, '<host>' with host name, and '<database>' with
the database
name):
REVOKE SELECT ON <host>.<database> FROM <user>;
REVOKE INSERT ON <host>.<database> FROM <user>;
REVOKE UPDATE ON <host>.<database> FROM <user>;
REVOKE DELETE ON <host>.<database> FROM <user>;
REVOKE CREATE ON <host>.<database> FROM <user>;
REVOKE DROP ON <host>.<database> FROM <user>;
REVOKE ALTER ON <host>.<database> FROM <user>; "
end
