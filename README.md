# chef-provisioner
A Chef cookbook to build a chef-provisioner node.

Specifically this will be focused on Chef Enterprise, 
or environments where a central Chef Server ALREADY exists.
It is also focused on use within AWS. I intend to add support
for other cloud providers in the future. Or if you'd like to 
contribute, for this repo and add support for your specific
cloud.

TODO: no support for any provider other than aws
TODO: Not dynamically setting the validation setting in the knife.rb
TODO: WARNING A LOT TO DO

If you are looking for something to provision a new chef
cluster, etc look here: 
https://github.com/opscode-cookbooks/chef-server-cluster .

This cookbook borrows heavily from that cookbook as well as
the pipeline cookbook here:


It is a glorified wrapper of functionality from each of those
cookbooks.

####Create a databag on your central chef server

I'm using an item named `<keyname>-<aws>-<region>` from the attribute
`node['provisioner'][key-name']`. The data in this data bag needs to be
populated with info from AWS. Hopefully you know where to get it. It
might be simplest to generate a new SSH key for this whole operation
then create a public key from the private .pem file you receive from
aws.

```json
{
  "id": "<provisioner_key_name>",
  "private_ssh_key": "<private_aws_ssh_key>",
  "public_ssh_key": "<public_aws_ssh_key_key>",
  "access_key_id": "<aws_access_key_id>",
  "access_key": "<aws_access_key>",
  "aws_region": "<aws_region>"
}
```

Be sure the values of the ssh keys are a single line, replacing actual
newlines in the files with \n. Do this by running them through irb with
the command `File.open('<private_key.pem>').read` and also
`File.open('<public_key.pub>').read`.

#### Using this cookbook

After creating your ssh keys and databags, just attach the default recipe
to your runlist. It should handle the rest for you.

Else, you can use this cookbook to create a provisioner
within your current chef structure.
