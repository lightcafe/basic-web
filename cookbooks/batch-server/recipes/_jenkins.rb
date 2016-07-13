#
# Cookbook Name:: batch-server
# Recipe:: _jenkins
#
# Copyright 2016, LIGHT CAFE INC.
#
# All rights reserved - Do Not Redistribute
#

bash "install-jenkins" do
  not_if "rpm -q jenkins"
  code <<-EOC
    wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat/jenkins.repo
    rpm --import http://pkg.jenkins.io/redhat/jenkins.io.key
  EOC
  notifies :install, "package[jenkins]", :immediately
end

package "jenkins" do
  action :nothing
end

service "jenkins" do
  supports :status => true, :restart => true
  action [ :enable ]
end

template "/etc/sysconfig/jenkins" do
  source "etc/sysconfig/jenkins.erb"
  owner "jenkins"
  group "jenkins"
  mode  0644
  action :create
  notifies :restart, "service[jenkins]"
end
