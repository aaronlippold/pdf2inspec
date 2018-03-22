control "M-9.1" do
  title "9.1 Starting Tomcat with Security Manager (Scored)"
  desc  "Configure application to run in a sandbox using the Security Manager.
The Security Manager restricts what classes Tomcat can access thus protecting
your server from mistakes, Trojans, and malicious code. By running Tomcat with
the Security Manager, applications are run in a sandbox which can prevent
untrusted code from accessing files on the file system. "
  impact 0.5
  tag "ref": "1.
http://tomcat.apache.org/tomcat-7.0-doc/security-manager-howto.html  "
  tag "severity": "medium"
  tag "cis_id": "9.1"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Review the startup configuration in /etc/init.d for Tomcat
to ascertain if Tomcat is started
with the -security option
"
  tag "fix": "The security policies implemented by the Java SecurityManager are
configured in the
$CATALINA_HOME/conf/catalina.policy file. Once you have configured the
catalina.policy
file for use with a SecurityManager, Tomcat can be started with a
SecurityManager in place
by using the --security option:
$ $CATALINA_HOME/bin/catalina.sh start -security (Unix)
C:\\> %CATALINA_HOME%\\bin\\catalina start -security (Windows)
"
  tag "Default Value": "By default, the -security option is not utilized.\n"
end
