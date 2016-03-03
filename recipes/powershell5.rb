#
# Author:: Julian C. Dunn (<jdunn@chef.io>)
# Cookbook Name:: powershell
# Recipe:: powershell5
#
# Copyright:: Copyright (c) 2016 Chef Software, Inc.
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
#

# PowerShell 5.0 RTM Download Page
# https://www.microsoft.com/en-us/download/details.aspx?id=50395

reboot 'Install WMF' do
  action :nothing
  delay_mins 1
  reason 'Installing Windows Management Framework 5'
end

if Powershell::PowershellVersionHelper.new.server_2008r2?(node)
  # 2008 R2 is a special case, and needs WMF 4 installed first.
  powershell '4.0' do
    notifies :reboot_now, 'reboot[Install WMF]', :immediately
  end
end

powershell '5.0.10586' do
  action :install
  notifies :request_reboot, 'reboot[Install WMF]', :immediately
end
