include_recipe 'apt'
include_recipe 'spiral::default'

execute 'tomcat_download' do
  command "/usr/bin/wget -O /tmp/tomcat.tar.gz -q #{node['spiral']['tomcat']['url']}"
end
