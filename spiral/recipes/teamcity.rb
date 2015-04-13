include_recipe 'spiral::tomcat'

remote_file '/opt/tomcat/webapps/TeamCity.war'
  source 'http://download.jetbrains.com/teamcity/TeamCity-9.0.3.war'
end
