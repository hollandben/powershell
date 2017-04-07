#
# Author:: Steven Murawski (<smurawski@chef.io>)
#
# Copyright:: 2017, Chef Software, Inc
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

module Powershell
  class Package
    # Shamelessly borrowed from the criteo-cookbooks/ms_dotnet cookbook!
    # Thanks for the idea!
    attr_reader :arch, :nt_version, :is_core, :is_server, :machine_type

    def initialize(node)
      @arch = node['kernel']['machine'] == 'x86_64' ? 'x64' : 'x86'
      @nt_version = ::Windows::VersionHelper.nt_version(node)
      @is_core = ::Windows::VersionHelper.core_version?(node)
      @is_server = ::Windows::VersionHelper.server_version?(node)

      @machine_type = if core?
        :core
      elsif server?
        :server
      else
        :workstation
      end
    end

    def packages
      
    end

  end
end
