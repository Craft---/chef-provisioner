name 'chef-provisioner'
maintainer 'Ian Henry'
maintainer_email 'ianjhenry00@gmail.com'
license 'All rights reserved'
description 'Installs/Configures chef-provisioner'
long_description 'Installs/Configures chef-provisioner'

version '0.2.0'

%w( build-essential chef-dk ).each do |g|
  depends g
end
