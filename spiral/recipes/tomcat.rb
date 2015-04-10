include_recipe 'apt'
include_recipe 'spiral::default'

execute 'tomcat_download' do
  command "wget -O /tmp/tomcat.tar.gz -q #{node['spiral']['tomcat']['url']}"
end

execute 'tomcat_extract' do
  command "tar xzf /tmp/tomcat.tar.gz -C /opt/ && mv /opt/apache-tomcat-#{node['spiral']['tomcat']['version']} /opt/tomcat"
end

directory "/opt/tomcat" do
  owner 'tomcat'
  group node['spiral']['users']['group']
  mode '0755'
  action :create
end

supervisor_service 'tomcat' do
  action :enable
  autostart true
  user 'tomcat'
end
