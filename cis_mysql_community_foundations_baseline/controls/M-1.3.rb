control "M-1.3" do
  title "1.3 Disable MySQL Command History (Scored)"
  desc  "On Linux/UNIX, the MySQL client logs statements executed interactively
to a history file.  By default, this file is named .mysql_history in the user's
home directory. Most interactive commands run in the MySQL client application
are saved to a history file.  The MySQL command history should be disabled.
Disabling the MySQL command history reduces the probability of exposing
sensitive information, such as passwords and encryption keys.  "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/mysql-logging.html 2.
http://bugs.mysql.com/bug.php?id=72158"
  tag "severity": "medium"
  tag "cis_id": "1.3"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 2
  tag "audit text": "Execute the following commands to assess this
recommendation:
find /home -name '.mysql_history'
For each file returned determine whether that file is
symbolically linked to /dev/null.
"
  tag "fix": "Perform the following steps to remediate this setting: Remove
.mysql_history if it exists. Use either of the techniques below to prevent it
from
being created again: Set the MYSQL_HISTFILE environment variable to /dev/null.

This
will need to be placed in the shell's startup script. Create
$HOME/.mysql_history as a symbolic to
/dev/null.
> ln -s /dev/null $HOME/.mysql_history
"
  tag "Default Value": "By default, the MySQL command history file is
located\nin $HOME/.mysql_history.\n"
end
