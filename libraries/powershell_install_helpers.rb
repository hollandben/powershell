module Powershell
  module InstallHelpers
    def powershell_version_lookup_2012r2
      {
        version_helper('6.3') => {
          version_helper('5.0.10586') => {
            'i386' => {
              'url' => 'https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win8.1-KB3134758-x86.msu',
              'checksum' => 'f9ee4bf2d826827bc56cd58fabd0529cb4b49082b2740f212851cc0cc4acba06'
            },
            'x86_64' => {
              'url' => 'https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win8.1AndW2K12R2-KB3134758-x64.msu',
              'checksum' => 'bb6af4547545b5d10d8ef239f47d59de76daff06f05d0ed08c73eff30b213bf2'
            }
          },
          version_helper('5.0.10514') => {
            'i386' => {
              'url' => 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win8.1AndW2K12R2-KB3066437-x86.msu',
              'checksum' => '0810a0eebf2239adde959561be8550f923ffb00e8b7d3a843143261937a0a5ab'
            },
            'x86_64' => {
              'url' => 'http://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win8.1AndW2K12R2-KB3066437-x64.msu',
              'checksum' => '9c57302ff0515a6b7eb53ab07bed0f5d420bd7204296d9f3fd17452fca1d5b3d'
            }
          }
        }
      }
    end

    def powershell_version_lookup_2012
      {
        version_helper('6.2') => {
          version_helper('5.0.10586') => {
            'x86_64' => {
              'url' => 'https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/W2K12-KB3134759-x64.msu',
              'checksum' => '6e59cec4bd30c505f426a319673a13c4a9aa8d8ff69fd0582bfa89f522f5ff00'
            }
          },
          version_helper('5.0.10514') => {
            'x86_64' => {
              'url' => 'https://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/W2K12-KB3066438-x64.msu',
              'checksum' => '281d85ec2317240f260f6a42c2c5c9dfbddfdb3bc361950f1ec29a7c06b8c857'
            }
          },
          version_helper('4.0') => {
            'x86_64' => {
              'url' => 'http://download.microsoft.com/download/3/D/6/3D61D262-8549-4769-A660-230B67E15B25/Windows8-RT-KB2799888-x64.msu',
              'checksum' => 'a68da0b05dbe245510578d9affb60fd624e906d21a57bfa35741a6f677091c66'
            }
          }
        }
      }
    end

    def powershell_version_lookup_2008r2
      {
        version_helper('6.1') => {
          version_helper('5.0.10586') => {
            'i386' => {
              'url' => 'https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win7-KB3134760-x86.msu',
              'checksum' => ''
            },
            'x86_64' => {
              'url' => 'https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win7AndW2K8R2-KB3134760-x64.msu',
              'checksum' => ''
            }
          },
          version_helper('5.0.10514') => {
            'i386' => {
              'url' => 'https://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win7AndW2K8R2-KB3066439-x86.msu',
              'checksum' => '8f019d7444b0995fe78bfc41115535c1f08ed9b08cd80f188d148bcd6c29d236'
            },
            'x86_64' => {
              'url' => 'https://download.microsoft.com/download/3/F/D/3FD04B49-26F9-4D9A-8C34-4533B9D5B020/Win7AndW2K8R2-KB3066439-x64.msu',
              'checksum' => '1c068cb6e342c2bc789bb009bc50d1bddc37e313106f696521c0b27b7cec3364'
            }
          },
          version_helper('4.0') => {
            'i386' => {
              'url' => 'http://download.microsoft.com/download/3/D/6/3D61D262-8549-4769-A660-230B67E15B25/Windows6.1-KB2819745-x86-MultiPkg.msu',
              'checksum' => 'd5dd77c5cd6370984257c81269ce40f83466d20339e44bb6de40c22d96641b98'
            },
            'x86_64' => {
              'url' => 'http://download.microsoft.com/download/3/D/6/3D61D262-8549-4769-A660-230B67E15B25/Windows6.1-KB2819745-x64-MultiPkg.msu',
              'checksum' => 'fbc0889528656a3bc096f27434249f94cba12e413142aa38946fcdd8edf6f4c5'
            }
          },
          version_helper('3.0') => {
            'i386' => {
              'url' => 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x86.msu',
              'checksum' => '2a23cb68bc87675c8ec7c7bfdfbb7f99262b69163bc7db7edc76ac1fb436a16e'
            },
            'x86_64' => {
              'url' => 'http://download.microsoft.com/download/E/7/6/E76850B8-DA6E-4FF5-8CCE-A24FC513FD16/Windows6.1-KB2506143-x64.msu',
              'checksum' => '8a8e35fa0e613fcc54644b8336d7dabbe5c6b57a1895e9caac2d0065746d1f8d'
            }
          }
        }
      }
    end

    def powershell_version_lookup
      powershell_version_lookup_2012r2
        .merge powershell_version_lookup_2012
        .merge powershell_version_lookup_2008r2
    end

    def major_minor_build(version)
      version_helper version.to_s.split('.')[0..2].join('.')
    end

    def default_install_source(powershell_version)
      powershell_version = major_minor_build(powershell_version)
      powershell_version_lookup[os_version(node)][powershell_version][os_architecture(node)]['url']
    end

    def default_checksum(powershell_version)
      powershell_version = version_helper(powershell_version)
      powershell_version_lookup[os_version(node)][powershell_version][os_architecture(node)]['checksum']
    end

    def enable?(new_version)
      powershell_features(node).include?(version_helper(new_version))
    end

    def install?(new_version)
      powershell_features(node).all? { |f| f < version_helper(new_version) }
    end

  end
end
