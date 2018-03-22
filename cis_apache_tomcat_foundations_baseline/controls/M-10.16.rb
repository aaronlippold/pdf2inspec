control "M-10.16" do
  title "10.16 Do not allow cross context requests (Scored)"
  desc  "Setting crossContext to true allows for an application to call
ServletConext.getContext to return a dispatcher for another application.
Allowing crossContext creates the possibility for a malicious application to
make requests to a restricted application. "
  impact 0.5
  tag "ref": "1. http://tomcat.apache.org/tomcat-7.0-doc/config/context.html "
  tag "severity": "medium"
  tag "cis_id": "10.16"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Ensure all context.xml have the crossContext attribute set
to false or crossContext does not
exist.
# find . -name context.xml | xargs grep 'crossContext'
"
  tag "fix": "In all context.xml, set the crossContext attribute to false:
<Context ... crossContext=”false” />
"
  tag "Default Value": "By default, crossContext has a value of false.\n"
end
