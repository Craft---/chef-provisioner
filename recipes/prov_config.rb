#
# Cookbook Name:: chef-provisioner
# Recipes:: config
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#
# Lay Down AWS Config
directory "#{node['provisioner']['home']}/.aws" do
  owner node['provisioner']['user']
  group node['provisioner']['group']
  mode 0755
end

template "#{node['provisioner']['home']}/.aws/conf" do
  source 'aws_conf.erb'
  owner node['provisioner']['user']
  group node['provisioner']['group']
  mode 0755
  action :create_if_missing
end

# Install gems
node['provisioner']['driver']['gems'].each do |gem|
  chef_gem gem['name'] do
    compile_time true if Chef::Resource::ChefGem.method_defined?(:compile_time)
  end

  require gem['require'] if gem.key?('require')
end

# Configure Driver
provisioner_opts = node['provisioner']['driver']['machine_options'].to_hash
ChefHelpers.symbolize_keys_deep!(provisioner_opts)

with_driver(node['provisioner']['driver']['with-parameter'])
with_machine_options(provisioner_opts)
