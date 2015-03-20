#
# Cookbook Name: chef-provisioner
# Recipe: ssh_config
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#
ssh_keys = data_bag_item(node['provisioner']['data_bag'], node['provisioner']['key_name'])
key_dir  = File.join(Dir.home, '.ssh')
key_name = node['provisioner']['driver']['machine_options']['bootstrap_options']['key_name']

directory key_dir do
  recursive true
end

file File.join(key_dir, key_name) do
  content ssh_keys['private_ssh_key']
  sensitive true
end

file File.join(key_dir, "#{key_name}.pub") do
  content ssh_keys['public_ssh_key']
  sensitive true
end