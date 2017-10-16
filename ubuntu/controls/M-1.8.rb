control "M-1.8" do
  title "1.8 Ensure auditing is configured for Docker files and directories
docker.service (Scored)"
  desc  "
    Audit docker.service, if applicable.
    Apart from auditing your regular Linux file system and system calls, audit
all Docker
    related files and directories. Docker daemon runs with root privileges. Its
behavior
    depends on some key files and directories. docker.service is one such file.
The
    docker.service file might be present if the daemon parameters have been
changed by an
    administrator. It holds various parameters for Docker daemon. It must be
audited, if
    applicable.

  "
  impact 0.5
  tag "ref": "1.
https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html\n"
  tag "severity": "medium"
  tag "cis_id": "1.8"
  tag "cis_control": "14.6 Enforce Detailed Audit Logging For Sensitive
Information\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["AU-2"]
  tag "audit": "Step 1: Find out the file location:\nsystemctl show -p
FragmentPath docker.service\nStep 2: If the file does not exist, this
recommendation is not applicable. If the file exists,\nverify that there is an
audit rule corresponding to the file:\nFor example, execute the below
command:\nauditctl -l | grep docker.service\nThis should list a rule for
docker.service as per its location.\n"
  tag "fix": "If the file exists, add a rule for it.\nFor example,\nAdd the
line as below in /etc/audit/audit.rules file:\n-w
/usr/lib/systemd/system/docker.service -k docker\nThen, restart the audit
daemon. For example,\nservice auditd restart\n"
  tag "Default Value": "By default, Docker related files and directories are
not audited. The file docker.service\nmay not be available on the system.\n"
end
