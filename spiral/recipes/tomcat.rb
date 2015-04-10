include_recipe 'apt'
include_recipe 'spiral::default'

remote_file "/tmp/tomcat-#{node['spiral']['tomcat']['version']}.tar.gz" do
  source "/opt/apache-tomcat-#{node['spiral']['tomcat']['url']}"
end

execute 'tomcat_extract' do
  command 'tar xzf /tmp/tomcat.tar.gz -C /opt'
end

link "/opt/tomcat"do
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
