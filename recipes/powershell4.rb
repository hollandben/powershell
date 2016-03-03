#
# Author:: Julian C. Dunn (<jdunn@chef.io>)
# Cookbook Name:: powershell
# Recipe:: powershell4
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

# PowerShell 4.0 Download Page
# http://www.microsoft.com/en-us/download/details.aspx?id=40855

reboot 'Install WMF' do
  action :nothing
  delay_mins 1
  reason 'Installing Windows Management Framework 4'
end

powershell '4.0' do
  action :install
  notifies :request_reboot, 'reboot[Install WMF]', :immediately
end
