
require_relative '../../libraries/powershell_version'
require_relative '../../libraries/powershell_install_helpers'

describe Powershell::InstallHelpers do
  let(:target_practice) do
    class TargetPractice
      include ::Powershell::VersionHelpers
      include ::Powershell::InstallHelpers
    end
    TargetPractice.new
  end

  let(:node) { { kernel: { machine: 'x86_64' }, platform_version: '6.3.9200' } }

  before do
    allow(target_practice).to receive(:node).and_return(node)
  end

  context '#os_version' do
    it 'returns Gem::Version 6.3 for Server 2012 R2' do
      expect(target_practice.os_version).to eq ::Gem::Version.new('6.3')
    end
  end

  context '#powershell_features' do
    it 'returns an array of [4,2]' do
      result = [::Gem::Version.new('4'), ::Gem::Version.new('2')]
      expect(target_practice.powershell_features).to eq result
    end
  end

  context '#enable?' do
    it 'returns true for powershell 2 on Server 2012 R2' do
      expect(target_practice.enable?('2')).to eq true
    end

    it 'returns true for powershell 4 on Server 2012 R2' do
      expect(target_practice.enable?('4')).to eq true
    end
  end

  context '#major_minor_build' do
    it 'returns 2.0 for powershell 2' do
      expect(target_practice.major_minor_build('4.0')).to eq ::Gem::Version.new('4.0')
    end

    it 'returns 3.0 for powershell 3' do
      expect(target_practice.major_minor_build('4.0')).to eq ::Gem::Version.new('4.0')
    end

    it 'returns 4.0 for powershell 4' do
      expect(target_practice.major_minor_build('4.0')).to eq ::Gem::Version.new('4.0')
    end

    it 'returns 5.0.10514 for powershell 5 Prod Preview' do
      expect(target_practice.major_minor_build('5.0.10514.6')).to eq ::Gem::Version.new('5.0.10514')
    end

    it 'returns 5.0.10586 for powershell 5 RTM' do
      expect(target_practice.major_minor_build('5.0.10586.117')).to eq ::Gem::Version.new('5.0.10586')
    end
  end
end
