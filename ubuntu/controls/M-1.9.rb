control "M-1.9" do
  title "1.9 Ensure auditing is configured for Docker files and directories
docker.socket (Scored)"
  desc  "
    Audit docker.socket, if applicable.
    Apart from auditing your regular Linux file system and system calls, audit
all Docker
    related files and directories. Docker daemon runs with root privileges. Its
behavior
    depends on some key files and directories. docker.socket is one such file.
It holds various
    parameters for Docker daemon socket. It must be audited, if applicable.

  "
  impact 0.5
  tag "ref": "1.
https://access.redhat.com/documentation/enUS/Red_Hat_Enterprise_Linux/6/html/Security_Guide/chap-system_auditing.html\n"
  tag "severity": "medium"
  tag "cis_id": "1.9"
  tag "cis_control": "14.6 Enforce Detailed Audit Logging For Sensitive
Information\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["AU-2"]
  tag "audit": "Step 1: Find out the file location:\nsystemctl show -p
FragmentPath docker.socket\nStep 2: If the file does not exist, this
recommendation is not applicable. If the file exists,\nverify that there is an
audit rule corresponding to the file:\nFor example, execute the below
command:\nauditctl -l | grep docker.socket\nThis should list a rule for
docker.socket as per its location.\n"
  tag "fix": "If the file exists, add a rule for it.\nFor example,\nAdd the
line as below in /etc/audit/audit.rules file:\n-w
/usr/lib/systemd/system/docker.socket -k docker\nThen, restart the audit
daemon. For example,\nservice auditd restart\n"
  tag "Default Value": "By default, Docker related files and directories are
not audited. The file docker.socket may\nnot be available on the system.\n"
end
