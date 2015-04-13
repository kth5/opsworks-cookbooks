group node['spiral']['users']['group'] do
  action :create
  append true
end

user 'tomcat' do
  comment 'Tomcat'
  system true
  gid node['spiral']['users']['group'] 
  home '/opt/tomcat'
  shell '/bin/false'
  action :create
end
