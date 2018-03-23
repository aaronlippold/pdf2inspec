control "M-7.2" do
  title "7.2 Ensure 'sql_mode' Contains 'NO_AUTO_CREATE_USER' (Scored)"
  desc  "NO_AUTO_CREATE_USER is an option for sql_mode that prevents a GRANT
statement from automatically creating a user when authentication information is
not provided.  Blank passwords negate the benefits provided by authentication
mechanisms.  Without this setting an administrative user might accidentally
create a user without a password. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "7.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Execute the following SQL statements to assess this
recommendation:
SELECT @@global.sql_mode;
SELECT @@session.sql_mode;
Ensure that each result contains NO_AUTO_CREATE_USER.
"
  tag "fix": "Perform the following actions to remediate this setting:
 Open the MySQL configuration file (my.cnf) Find the sql_mode setting in the
[mysqld] area Add the NO_AUTO_CREATE_USER to the sql_mode setting"
end
