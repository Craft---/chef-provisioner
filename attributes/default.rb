default['provisioner']['chefdk']['version'] = 'latest'

# aws objects
default['provisioner']['databag_name'] = ''
default['provisioner']['key_name'] = ''

# general node options
default['provisioner']['home'] = ENV['HOME']
default['provisioner']['user'] = 'root'
default['provisioner']['group'] = 'root'

# Knife options
default['provisioner']['knife']['ssl_verify'] = ''

# Driver Configuration
default['provisioner']['driver'] = \
{
  'gems' => [
    {
      'name' => 'chef-provisioning-aws',
      'require' => 'chef/provisioning/aws_driver'
    }
  ],
  'with-parameter' => 'aws::us-east-1'
}
default['provisioner']['driver']['machine_options'] = \
{
  'ssh_username' => 'ubuntu',
  'use_private_ip_for_ssh' => false,
  'bootstrap_options' => {
    'key_name' => 'dev-provisioner',
    'image_id' => 'ami-b99ed989',
    'instance_type' => 'm3.medium'
  }
}
