require 'chef/dsl/registry_helper'

module Powershell

  module VersionHelper
    def self.powershell_version
      Powershell::PowershellVersionHelper.new.powershell_version
    end

    def self.powershell_version?(versionstring = nil)
      Powershell::PowershellVersionHelper.new.powershell_version?(versionstring)
    end

  end

  module VersionHelpers
    def major_version(version)
      version_helper(version).segments[0]
    end

    def version_helper(version)
      return version if version.is_a? ::Gem::Version
      ::Gem::Version.new(version)
    end

    def os_version(node)
      @os_version ||= version_helper(node[:platform_version].split('.')[0..1].join('.'))
    end

    def os_architecture(node)
      node[:kernel][:machine]
    end

    def server_2016?(node)
      os_version(node) == version_helper('10.0')
    end

    def server_2012r2?(node)
      os_version(node) == version_helper('6.3')
    end

    def server_2012?(node)
      os_version(node) == version_helper('6.2')
    end

    def server_2008r2?(node)
      os_version(node) == version_helper('6.1')
    end

    def powershell_features(node)
      versions = if server_2016?(node)
                   []
                 elsif server_2012r2?(node)
                   [4, 2]
                 elsif server_2012?(node)
                   [3, 2]
                 else
                   []
                 end
      versions.map { |v| version_helper v }
    end
  end

  class PowershellVersionHelper
    include Chef::DSL::RegistryHelper
    include Powershell::VersionHelpers

    def run_context
      Chef.run_context
    end

    def powershell_version?(versionstring)
      version_helper(powershell_version) >= version_helper(versionstring)
    end

    def powershell_version
      reg_keys = [{ key: 'HKLM\SOFTWARE\Microsoft\PowerShell\3\PowerShellEngine', value: 'PowerShellVersion' },
                  { key: 'HKLM\SOFTWARE\Microsoft\PowerShell\1\PowerShellEngine', value: 'PowerShellVersion' }]
      reg_keys.each do |x|
        return registry_get_values(x[:key]).find { |i| i[:name] == x[:value] }[:data] if
          registry_key_exists?(x[:key]) &&
          registry_value_exists?(x[:key], name: x[:value], type: :string)
      end
      nil
    end
  end

end unless defined?(Powershell::VersionHelper)
