#
# Cookbook Name:: web-server
# Recipe:: _tomcat7
#
# Copyright 2016, LIGHT CAFE INC.
#
# All rights reserved - Do Not Redistribute
#

package "tomcat7" do
  action :install
end

package "tomcat7-log4j" do
  action :install
end

package "tomcat7-webapps" do
  action :install
end

%W{
  tomcat7_01
  tomcat7_02
  tomcat7_03
}.each do |t|

  link "/etc/init.d/#{t}" do
    to "/etc/init.d/tomcat7"
    notifies :enable, "service[#{t}]", :immediately
  end

  service "#{t}" do
    supports :status => true, :restart => true
    action :nothing
  end

  template "/etc/sysconfig/#{t}" do
    source "etc/sysconfig/#{t}.erb"
    owner "root"
    group "tomcat"
    mode  0664
    action :create
  end

  template "/usr/share/#{t}/conf/server.xml" do
    source "usr/share/#{t}/conf/server.xml.erb"
    owner "root"
    group "tomcat"
    mode  0664
    action :create
  end

  directory "/usr/share/#{t}" do
    owner "root"
    group "tomcat"
    mode  0775
    action :create
  end

  directory "/usr/share/#{t}/webapps" do
    owner "root"
    group "tomcat"
    mode  0775
    action :create
  end

  directory "/var/log/#{t}" do
    owner "root"
    group "tomcat"
    mode  0775
    action :create
  end

  directory "/var/cache/#{t}" do
    owner "root"
    group "tomcat"
    mode  0775
    action :create
  end

  directory "/var/cache/#{t}/temp" do
    owner "root"
    group "tomcat"
    mode  0775
    action :create
  end

  directory "/var/cache/#{t}/work" do
    owner "root"
    group "tomcat"
    mode  0775
    action :create
  end

  link "/usr/share/#{t}/lib" do
    to "/usr/share/java/tomcat7"
  end

  link "/usr/share/#{t}/logs" do
    owner "root"
    group "tomcat"
    to "/var/log/#{t}"
  end

  link "/usr/share/#{t}/temp" do
    owner "root"
    group "tomcat"
    to "/var/cache/#{t}/temp"
  end

  link "/usr/share/#{t}/work" do
    owner "root"
    group "tomcat"
    to "/var/cache/#{t}/work"
  end

  bash "Copy tomcat7 bin" do
    code <<-EOH
    cp -pLR /usr/share/tomcat7/bin /usr/share/#{t}
    EOH
    action :run
    not_if { File.exists?("/usr/share/#{t}/bin") }
  end

  bash "Copy tomcat7 conf" do
    code <<-EOH
      cp -pLR /usr/share/tomcat7/conf /usr/share/#{t}
    EOH
    action :run
    not_if { File.exists?("/usr/share/#{t}/conf") }
  end

end