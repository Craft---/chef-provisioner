name 'chef-provisioner'
maintainer 'Ian Henry'
maintainer_email 'ianjhenry00@gmail.com'
license 'All rights reserved'
description 'Installs/Configures chef-provisioner'
long_description 'Installs/Configures chef-provisioner'

version '0.1.3'

%w( build-essential now ).each do |g|
  depends g
end
