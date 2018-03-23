control "M-5.2" do
  title "5.2 Ensure 'file_priv' Is Not Set to 'Y' for Non-­‐Administrative
Users (Scored)"
  desc  "The File_priv privilege found in the mysql.user table is used to allow
or disallow a user from  reading and writing files on the server host.  Any
user with the File_priv right granted has the ability to: Read files from the
local file system that are readable by the MySQL server (this includes
world-­‐readable files) Write files to the local file system where the MySQL
server has write access The File_priv right allows mysql users to read files
from disk and to write files to disk. This may be leveraged by an attacker to
further compromise MySQL.  It should be noted that the MySQL server should not
overwrite existing files. "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/privileges-­‐provided.html#priv_file"
  tag "severity": "medium"
  tag "cis_id": "5.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statement to audit this setting

select user, host from mysql.user where File_priv = 'Y';
Ensure only administrative users are returned in the result set.
"
  tag "fix": "Perform the following steps to remediate this setting: Enumerate
the non-­‐administrative users found in the result set of the audit
procedure For each user, issue the following SQL statement (replace '<user>'
with the non-­‐
administrative user:
REVOKE FILE ON *.* FROM '<user>';
"
end
