# Cookbook Name:: nginx
# Recipe:: repo
# Author:: Nick Rycar <nrycar@bluebox.net>
#
# Copyright 2008-2012, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

case node['platform_family']
when 'rhel','fedora'
  case node['platform']
  when "centos"
    # See http://wiki.nginx.org/Install
    default['nginx']['upstream_repository'] = "http://nginx.org/packages/centos/#{node['platform_version'].to_i}/$basearch/"
  else
    default['nginx']['upstream_repository'] = "http://nginx.org/packages/rhel/#{node['platform_version'].to_i}/$basearch/"
  end
when 'debian'
  case node['platform']
  when 'debian'
    default['nginx']['upstream_repository'] = "http://nginx.org/packages/#{node['platform']}"
  when 'ubuntu'
    default['nginx']['upstream_repository'] = "http://ppa.launchpad.net/nginx/stable/ubuntu"
  end
end
