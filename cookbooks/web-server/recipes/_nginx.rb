#
# Cookbook Name:: web-server
# Recipe:: _nginx
#
# Copyright 2016, LIGHT CAFE INC.
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
  action :install
end

service "nginx" do
  supports :status => true, :restart => true, :reload => true
  action [:enable]
end

%W{
  site_01
  site_02
  site_03
}.each do |t|

  template "/etc/nginx/conf.d/#{t}.conf" do
    source "etc/nginx/conf.d/#{t}.conf.erb"
    owner "root"
    group "root"
    mode  0644
    action :create
  end

end