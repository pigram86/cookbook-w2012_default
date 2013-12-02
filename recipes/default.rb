#
# Cookbook Name:: w2012_default
# Recipe:: default
#
# Copyright (C) 2013 Todd Pigram
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#    http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# install default roles w/dism
# install file-services
windows_feature node[:w2012][:file] do
  action :install
  not_if {reboot_pending?}
end

# install corefileserver
windows_feature node[:w2012][:corefile] do
  action :install
  not_if {reboot_pending?}
end 

# install windowsserverbackup
windows_feature node[:w2012][:backup] do
  action :install
  not_if {reboot_pending?}
end

# install wsrm
windows_feature node[:w2012][:wsrm] do
  action :install
  not_if {reboot_pending?}
end

# install net 3 features
windows_feature node[:w2012][:netsf] do
  action :install
  not_if {reboot_pending?}
end

# install net 3
windows_feature node[:w2012][:net] do
  action :install
  not_if {reboot_pending?}
end

# if feature installs, schedule a reboot at end of chef run
windows_reboot 60 do
  reason 'reboot needed'
  only_if {reboot_pending?}
end 