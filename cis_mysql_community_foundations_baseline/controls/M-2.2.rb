control "M-2.2" do
  title "2.2 Dedicate Machine Running MySQL (Not Scored)"
  desc  "It is recommended that MySQL Server software be installed on a
dedicated server.  This architectural consideration affords flexibility in that
the database server can be placed on a separate zone allowing access only from
particular hosts and over particular protocols.  The attack surface is reduced
on a server with only the underlying operating system, MySQL server software,
and any security or operational tooling that may be additionally installed.  A
smaller attack surface reduces the probability of the data within MySQL being
compromised. "
  impact 0.5
  tag "severity": "medium"
  tag "cis_id": "2.2"
  tag "cis_control": ["No CIS Control", "6.1"]
  tag "cis_level": 1
  tag "audit text": "Verify there are no other roles enabled for the underlying
operating system and that no
additional applications or services unrelated to the proper operation of the
MySQL server
software are installed.
"
  tag "fix": "Remove excess applications or services and/or remove unnecessary
roles from the
underlying operating system.
"
end
