include_recipe "spiral_java::default"

execute 'tomcat_download' do
  command "/usr/bin/wget -O /tmp/tomcat.tar.gz -q #{node['spiral']['tomcat']['url']"
end
