describe "PowerShell Version" {
  it "Version 4 or newer is available" {
    $psversiontable.PSVersion.Major -ge 4 | should be $true
  }
}