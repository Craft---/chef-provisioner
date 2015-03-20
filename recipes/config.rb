#
# Cookbook Name:: chef-provisioner
# Recipes:: config
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#
# Install gems
node['provisioner']['driver']['gems'].each do |gem|
  chef_gem gem['name'] do
    compile_time true if Chef::Resource::ChefGem.method_defined?(:compile_time)
  end

  require gem['require'] if gem.has_key?('require')
end

# Configure Driver
provisioner_opts = node['provisioner']['driver']['machine_options'].to_hash
ChefHelpers.symbolize_keys_deep!(provisioner_machine_opts)

with_driver(node['provisioner']['driver']['with-parameter'])
with_machine_options(provisioner_opts)