name 'chef-provisioner'
maintainer 'Ian Henry'
maintainer_email 'ianjhenry00@gmail.com'
license 'All rights reserved'
description 'Installs/Configures chef-provisioner'
long_description 'Installs/Configures chef-provisioner'

version '0.1.0'

%w( chef-dk chef-server-ingredient ).each do |g|
  depends g
end
