control "M-6.1" do
  title "6.1 Ensure image sprawl is avoided (Not Scored)"
  desc  "
    Do not keep a large number of container images on the same host. Use only
tagged images
    as appropriate.
    Tagged images are useful to fall back from \"latest\" to a specific version
of an image in
    production. Images with unused or old tags may contain vulnerabilities that
might be
    exploited, if instantiated. Additionally, if you fail to remove unused
images from the system
    and there are various such redundant and unused images, the host filesystem
may become
    full and could lead to denial of service.

  "
  impact 0.5
  tag "ref": "1.
http://craiccomputing.blogspot.in/2014/09/clean-up-unused-docker-containersand.html\n2.
https://forums.docker.com/t/command-to-remove-all-unused-images/20/8\n3.
https://github.com/docker/docker/issues/9054\n4.
https://docs.docker.com/engine/reference/commandline/rmi/\n5.
https://docs.docker.com/engine/reference/commandline/pull/\n6.
https://github.com/docker/docker/pull/11109\n"
  tag "severity": "medium"
  tag "cis_id": "6.1"
  tag "cis_control": "18 Application Software Security\n"
  tag "cis_level": "Level 1 - Linux Host OS"
  tag "nist": ["SI-1"]
  tag "audit": "Step 1 Make a list of all image IDs that are currently
instantiated by executing below\ncommand:\ndocker images --quiet | xargs docker
inspect --format '{{ .Id }}: Image={{\n.Config.Image }}'\nStep 2: List all the
images present on the system by executing below command:\ndocker images\nStep
3: Compare the list of image IDs populated from Step 1 and Step 2 and find out
images\nthat are currently not being instantiated. If any such unused or old
images are found,\ndiscuss with the system administrator the need to keep such
images on the system. If such\na need is not justified enough, then this
recommendation is non-compliant.\n"
  tag "fix": "Keep the set of the images that you actually need and establish a
workflow to remove old or\nstale images from the host. Additionally, use
features such as pull-by-digest to get specific\nimages from the
registry.\nAdditionally, you can follow below set of steps to find out unused
images on the system and\ndelete them.\nStep 1 Make a list of all image IDs
that are currently instantiated by executing below\ncommand:\ndocker images
--quiet | xargs docker inspect --format '{{ .Id }}: Image={{\n.Config.Image
}}'\nStep 2: List all the images present on the system by executing below
command:\ndocker images\nStep 3: Compare the list of image IDs populated from
Step 1 and Step 2 and find out images\nthat are currently not being
instantiated.\nStep 4: Decide if you want to keep the images that are not
currently in use. If not delete\nthem by executing below command:\ndocker rmi
$IMAGE_ID\n"
  tag "Default Value": "Images and layered filesystems remain accessible on the
host until the administrator\nremoves all tags that refer to those images or
layers.\n"
end
