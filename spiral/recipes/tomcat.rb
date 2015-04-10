include_recipe 'apt'
include_recipe 'spiral::default'

execute 'tomcat_download' do
  command "wget -O /tmp/tomcat.tar.gz -q #{node['spiral']['tomcat']['url']}"
end

execute 'tomcat_extract' do
  command "tar xzf /tmp/tomcat.tar.gz -C /opt/"
end
