control "M-10.1" do
  title "10.1 Ensure Web content directory is on a separate partition from the
Tomcat system files (Not Scored)"
  desc  "Store web content on a separate partition from Tomcat system files.
The web document directory is where the files which are severed to the end user
reside. In the past, directory traversal exploits have allowed malicious users
to play havoc on a web server including executing code, uploading files, and
reading sensitive data. Even if you do not have any directory traversal
exploits in your server or code at this time, that doesn’t mean they won’t be
introduced in the future. Moving your web document directory onto a different
partition will prevent these kinds of attacks from doing more damage to other
part of the file system. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "10.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Locate the Tomcat system files and web content directory.
Review the system partitions
and ensure the system files and web content directory are on separate
partitions.
# df $CATALINA_HOME/webapps
# df $CATALINA_HOME
"
  tag "fix": "Move the web content files to a separate partition from the
tomcat system files and update
your configuration.
"
  tag "Default Value": "Not Applicable\n"
end
