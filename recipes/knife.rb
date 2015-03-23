#
# Cookbook Name: chef-provisioner
# Recipes: knife
# Author: Ian Henry <ianjhenry00@gmail.com>
# Copyright (C) 2015
#

directory "#{node['provisioner']['home']}/.chef" do
  owner node['provisioner']['user']
  group node['provisioner']['group']
  mode 0755
end

# search data bag chef_orgs for each chef server or org
# write out knife and pem
search(:chef_orgs, '*:*').each do |org|
  template "#{node['provisioner']['home']}/.chef/knife.rb" do
    cookbook 'chef-provisioner'
    source 'knife.rb.erb'
    owner node['provisioner']['user']
    group node['provisioner']['group']
    mode 0644
    variables(
        chef_server_url: org['chef_server_url'],
        client_node_name: org['client']
    )
  end

  file "#{node['provisioner']['home']}/.chef/#{org['client']}.pem" do
    content org['pem']
    owner node['provisioner']['user']
    group node['provisioner']['group']
    mode 0644
  end
end
