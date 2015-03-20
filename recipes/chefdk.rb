#
# Cookbook Name:: chef-provisioner
# Recipes:: chefdk
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#
chef_dk 'provisioner_chefdk' do
  version node['provisioner']['chefdk']['version']
  global_shell_init true
  action :install
end
