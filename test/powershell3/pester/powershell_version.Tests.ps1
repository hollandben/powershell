describe "PowerShell Version" {
  it "Version 3 or newer is available" {
    $psversiontable.PSVersion.Major -ge 3 | should be $true  
  }
}