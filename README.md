# chef-provisioner
A Chef cookbook to build a chef-provisioner node that can have
a runlist of provisioning recipes attached to it to allow for
centralized provisioning.

Specifically this will be focused on Chef Enterprise, 
or environments where a central Chef Server ALREADY exists.
It is also focused on use within AWS. I intend to add support
for other cloud providers in the future. Or if you'd like to 
contribute, for this repo and add support for your specific
cloud.

TODO: no support for any provider other than aws
TODO: Not dynamically setting the validation setting in the knife.rb
TODO: WARNING A LOT TO DO
TODO: Get CentOS Working

The thing to keep in mind is this cookbook is for setting up a
centralized provisioning node. It assumes that you are using a
centralized or hosted chef server already and not executing your
provisioning recipes from your own workstation. Your provisioning
recipes can then get attached to the node's runlist and the
provisioner will handle the provisioning of those nodes in aws.

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
newlines in the files with \n. I have included a dummy data bag that can be used
as long as you enter the ssh keys. To do this you can run them through irb with
the command `File.open('<private_key.pem>').read` and also
`File.open('<public_key.pub>').read`.

#### Using this cookbook

After creating your ssh keys and databags, just attach the default recipe
to your runlist. It should handle the rest for you.

Else, you can use this cookbook to create a provisioner
within your current chef structure.
