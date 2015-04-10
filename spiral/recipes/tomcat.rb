include_recipe 'apt'
include_recipe 'spiral::default'

dl_lcoation = "/opt/tomcat.tar.gz"

remote_file dl_location do
  source node['spiral']['tomcat']['url']
end

execute 'tomcat_extract' do
  command 'tar xzf #{dl_location} -C /opt'
end

link '/opt/tomcat' do
  to "/opt/apache-tomcat-#{node['spiral']['tomcat']['version']}"
end

directory "/opt/tomcat" do
  owner 'tomcat'
  group node['spiral']['users']['group']
  mode '0755'
  action :create
end

#supervisor_service 'tomcat' do
#  action :enable
#  autostart true
#  user 'tomcat'
#end
