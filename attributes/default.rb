default['provisioner']['chefdk']['version'] = 'latest'

# AWS objects
default['provisioner']['aws']['databag_name'] = ''
default['provisioner']['aws']['key_name'] = ''
default['provisioner']['aws']['key_id'] = ''
default['provisioner']['aws']['access_key'] = ''
default['provisioner']['aws']['region'] = 'us-east-1'

# general node options
default['provisioner']['home'] = ENV['HOME']
default['provisioner']['user'] = 'root'
default['provisioner']['group'] = 'root'

# Knife options
default['provisioner']['knife']['ssl_verify'] = 'verify_none'

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
  'ssh_username' => 'root',
  'use_private_ip_for_ssh' => false,
  'bootstrap_options' => {
    'key_name' => 'dev-provisioner',
    'image_id' => 'ami-c2a818aa',
    'instance_type' => 't2.small'
  }
}
