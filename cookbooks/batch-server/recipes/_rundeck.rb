#
# Cookbook Name:: batch-server
# Recipe:: _rundeck
#
# Copyright 2016, LIGHT CAFE INC.
#
# All rights reserved - Do Not Redistribute
#

bash "install-rundeck" do
  not_if "rpm -q rundeck"
  code <<-EOC
    rpm -Uvh http://repo.rundeck.org/latest.rpm
  EOC
  notifies :install, "package[rundeck]", :immediately
end

package "rundeck" do
  action :nothing
end

service "rundeckd" do
  supports :status => true, :restart => true
  action [ :enable ]
end

template "/etc/rundeck/framework.properties" do
  source "etc/rundeck/framework.properties.erb"
  owner "rundeck"
  group "rundeck"
  mode  0644
  action :create
  notifies :restart, "service[rundeck]"
end

template "/etc/rundeck/rundeck-config.properties" do
  source "etc/rundeck/rundeck-config.properties.erb"
  owner "rundeck"
  group "rundeck"
  mode  0644
  action :create
  notifies :restart, "service[rundeck]"
end

template "/etc/rundeck/profile" do
  source "etc/rundeck/profile.erb"
  owner "rundeck"
  group "rundeck"
  mode  0644
  action :create
  notifies :restart, "service[rundeck]"
end
