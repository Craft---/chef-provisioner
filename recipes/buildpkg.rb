#
# Cookbook Name:: chef-provisioner
# Recipes:: build-essential
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#
node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential::default'

case node['platform_family']
  when 'debian'
    package 'zlib1g-dev' do
      action :install
    end
  when 'rhel'
    package 'zlib-devel' do
      action :install
    end
    package 'libxml2.x86_64' do
      action :install
    end
    package 'zlib-devel' do
      action :install
    end
    #include_recipe 'chef-provisioner::chefdk'
end


