resource_name :powershell

provides :powershell, platform: 'windows'

property :version, String, name_property: true
property :source, String
property :checksum, String
property :timeout, Fixnum, default: 2700

load_current_value do
  if node[:languages] && node[:languages][:powershell]
    version node[:languages][:powershell][:version]
  end
end

include ::Powershell::VersionHelpers
include ::Powershell::InstallHelpers

action :install do
  new_major_version = major_version(new_resource.version)

  return if new_major_version == 2 && server_2008r2?(node)
  return if new_major_version == 5 && server_2016?(node)

  if enable?(new_resource.version)
    if new_major_version == 2
      windows_feature 'MicrosoftWindowsPowerShellV2' do
        action :install
      end
    else
      windows_feature 'MicrosoftWindowsPowerShell' do
        action :install
      end
    end
  elsif Powershell::VersionHelper.powershell_version?(new_resource.version)
    Chef::Log.info("PowerShell V#{new_resource.version} (or a newer version) is already installed on this machine.")
  elsif install?(new_resource.version)
    windows_package "Microsoft Windows PowerShell V#{new_resource.version}" do
      source property_is_set?(:source) ? new_resource.source : default_install_source(new_resource.version)
      checksum property_is_set?(:checksum) ? new_resource.checksum : default_checksum(new_resource.version)
      timeout new_resource.timeout
      installer_type :custom
      options '/quiet /norestart'
      success_codes [0, 42, 127, 3010, 2_359_302] if respond_to?(:success_codes)
      returns [0, 42, 127, 3010, 2_359_302] if respond_to?(:returns)
      action :install
    end
  else
    Chef::Log.warn("Installing PowerShell version #{new_resource.version} is not appropriate for this platform")
  end
end

