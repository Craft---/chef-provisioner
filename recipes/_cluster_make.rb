node.set['provisioner']['chef'] ['key_name'] = 'dev-provisioner-aws-us-east-1'
node.set['provisioner']['driver']['with_parameter'] = 'aws::us-east-1'
node.set['provisioner']['driver']['machine_options']['bootstrap_options']['image_id'] = 'ami-ecb68a84'

machine 'dev-provisioner' do
  ohai_hints 'ec2' => '{}'
  files '/etc/hosts' => '/etc/hosts'
  action :allocate
end

machine 'dev-provisioner' do
  recipe 'chef-provisioner::default'
  action :converge
  converge true
end