control "M-7.6" do
  title "7.6 Ensure No Users Have Wildcard Hostnames (Scored)"
  desc  "MySQL can make use of host wildcards when granting permissions to
users on specific databases.  For example, you may grant a given privilege to
'<user>'@'%'.   Avoiding the use of wildcards within hostnames helps control
the specific locations from which a given user may connect to and interact with
the database. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "7.6"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to assess this
recommendation:
SELECT user, host FROM mysql.user WHERE host = '%';
Ensure no rows are returned.
"
  tag "fix": "Perform the following actions to remediate this setting:
Enumerate all users returned after running the audit
procedure Either ALTER the user's host to be specific or DROP the
user"
end