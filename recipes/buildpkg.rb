#
# Cookbook Name:: chef-provisioner
# Recipes:: build-essential
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#
node.set['build-essential']['compile_time'] = true
include_recipe 'build-essential::default'


include_recipe 'chef-provisioner::chefdk'