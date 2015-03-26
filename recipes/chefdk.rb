#
# Cookbook Name:: chef-provisioner
# Recipes:: chefdk
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#
run_at_compile_time do
  chef_dk 'pipeline_chefdk' do
    version node['provisioner']['chefdk']['version']
    global_shell_init true
    action :install
  end
end

include_recipe 'chef-provisioner::build-essential'