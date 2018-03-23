control "M-3.8" do
  title "3.8 Ensure Plugin Directory Has Appropriate Permissions (Scored)"
  desc  "The plugin directory is the location of the MySQL plugins. Plugins are
storage engines or user defined functions (UDFs). Limiting the accessibility of
these objects will protect the confidentiality, integrity, and availability of
the MySQL database.  If someone can modify plugins then these plugins might be
loaded when the server starts and the code will get executed. "
  impact 0.5
  tag "ref": "1. http://dev.mysql.com/doc/refman/5.7/en/install-­‐plugin.html"
  tag "severity": "medium"
  tag "cis_id": "3.8"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "To assess this recommendation, execute the following SQL
statement to discover the Valuef plugin_dir:
show variables where variable_name = 'plugin_dir';
Then, execute the following command at a terminal prompt (using the discovered

plugin_dir Value) to determine the permissions.
ls -l <plugin_dir Value>/.. | egrep '^drwxr[-w]xr[-w]x[ \\t]*[0-9][ \\t]*mysql[

\\t]*mysql.*plugin.*$'
Lack of output implies a finding.
NOTE: Permissions are intended to be either 775 or 755.
"
  tag "fix": "To remediate this setting, execute the following commands at a
terminal prompt using the
plugin_dir Value from the audit procedure.
chmod 775 <plugin_dir Value> (or use 755)
chown mysql:mysql <plugin_dir Value>
"
end
