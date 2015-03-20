# chef-provisioner
A Chef cookbook to build a chef-provisioner node.

Specifically this will be focused on Chef Enterprise, 
or environments where a central Chef Server ALREADY exists.
It is also focused on use within AWS. I intend to add support
for other cloud providers in the future. Or if you'd like to 
contribute, for this repo and add support for your specific
cloud.


If you are looking for something to provision a new chef
cluster, etc look here: 
https://github.com/opscode-cookbooks/chef-server-cluster .

This cookbook borrows heavily from that cookbook as well as
the pipeline cookbook here:


It is a glorified wrapper of functionality from each of those
cookbooks.


Else, you can use this cookbook to create a provisioner
within your current chef structure.
