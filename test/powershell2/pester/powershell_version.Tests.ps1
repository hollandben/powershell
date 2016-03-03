describe "PowerShell Version" {
  it "Version 2 is available" {
    if ($PSVersionTable.PSVersion.Major -gt 2) {
      powershell -version 2 -noprofile -executionpolicy bypass '$psversiontable.psversion.major' | should be 2      
    }
    else {
      $psversiontable.PSVersion.Major | should be 2 
    }
  }
}