describe "PowerShell Version" {
  it "Version 5 or newer is available" {
    $psversiontable.PSVersion.Major -ge 5 | should be $true
  }
}