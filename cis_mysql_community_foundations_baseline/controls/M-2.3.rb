control "M-2.3" do
  title "2.3 Do Not Specify Passwords in Command Line (Not Scored)"
  desc  "When a command is executed on the command line, for example mysql -u
admin �p  password, the password may be visible in the user's shell/command
history or in the process list. If the password is visible in the process list
or user's shell/command history, an attacker will be able to access the MySQL
database using the stolen credentials.  "
  impact 0.5
  tag "ref": "1.
http://dev.mysql.com/doc/refman/5.7/en/mysql-config-editor.html 2.
http://dev.mysql.com/doc/refman/5.7/en/password-security-user.html"
  tag "severity": "medium"
  tag "cis_id": "2.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Check the process or task list if the password is
visible.
Check the shell or command history if the password
is visible.
"
  tag "fix": "Use -p without password and then enter the password when
prompted, use a properly
secured .my.cnf file, or store authentication information in
encrypted format in
.mylogin.cnf.
"
end
