control "M-2.1.4" do
  title "2.1.4 The backups should be properly secured (Not Scored)"
  desc  "The backup files will contain all data in the databases. Filesystem
permissions and/or encryption should be used to prevent non authorized users
from gaining access to the backups.  Backups should be considered sensitive
information. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.1.4"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check who has access to the backup files.
 Are the files world-readable (e.g. rw-r--r-) Are they stored in a world
readable directory?
 Is the group MySQL and/or backup specific? If not: the file and directory must
not be group
readable
 Are the backups stored offsite? Who has access to the backups?
 Are the backups encrypted? Where is the encryption key stored? Does the
encryption key consists of  a
guessable password?
"
  tag "fix": "Implement encryption or use filesystem permissions.
"
end
