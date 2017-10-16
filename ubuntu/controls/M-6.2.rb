control "M-6.2" do
  title "6.2 Ensure container sprawl is avoided (Not Scored)"
  desc  "
    Do not keep a large number of containers on the same host.
    The flexibility of containers makes it easy to run multiple instances of
applications and
    indirectly leads to Docker images that exist at varying security patch
levels. It also means
    that you are consuming host resources that otherwise could have been used
for running
    'useful' containers. Having more than just the manageable number of
containers on a
    particular host makes the situation vulnerable to mishandling,
misconfiguration and
    fragmentation. Thus, avoid container sprawl and keep the number of
containers on a host
    to a manageable total.

  "
  impact 0.5
  tag "ref": "1.
https://zeltser.com/security-risks-and-benefits-of-docker-application/\n2.
http://searchsdn.techtarget.com/feature/Docker-networking-How-Linuxcontainers-will-change-your-network\n"
  tag "severity": "medium"
  tag "cis_id": "6.2"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["SI-1"]
  tag "audit": "Step 1 - Find the total number of containers you have on the
host:\ndocker info --format '{{ .Containers }}'\nStep 2 - Execute the below
commands to find the total number of containers that are\nactually running or
in the stopped state on the host.\ndocker info --format '{{ .ContainersStopped
}}'\ndocker info --format '{{ .ContainersRunning }}'\nIf the difference between
the number of containers that are stopped on the host and the\nnumber of
containers that are actually running on the host is large (say 25 or more),
then\nperhaps, the containers are sprawled on the host.\n"
  tag "fix": "Periodically check your container inventory per host and clean up
the stopped containers\nusing the below command:\ndocker container prune\n"
  tag "Default Value": "By default, Docker does not restrict the number of
containers you may have on a host.\n"
end
