# General Node Variables
default['provisioner']['compile_time'] = true
default['provisioner']['home'] = ENV['HOME']
default['provisioner']['user'] = 'root'
default['provisioner']['group'] = 'root'
default['provisioner']['data_bag'] = 'secrets'

default['provisioner']['chef']['key_name'] = "dev-provisioner-aws-us-west-2"

default['chef_dk']['version'] = 'latest'
default['chef_dk']['global_shell_init'] = true

# AWS object
aws_config = Chef::DataBagItem.load(node['provisioner']['data_bag'], node['provisioner']['chef']['key_name'])
default['provisioner']['aws']['key_id'] = aws_config['access_key_id']
default['provisioner']['aws']['access_key'] = aws_config['access_key']
default['provisioner']['aws']['region'] = aws_config['aws_region']

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
  'with-parameter' => 'aws::us-west-2'
}
default['provisioner']['driver']['machine_options'] = \
{
  'ssh_username' => 'root',
  'use_private_ip_for_ssh' => false,
  'bootstrap_options' => {
    'key_name' => 'dev-provisioner',
    'image_id' => 'ami-ecb68a84',
    'instance_type' => 'm3.medium'
  }
}
