# Loop through servers.csv and attept to create an tcp connection to each
$csv = Import-Csv servers.csv -Header ("Server","Port")
foreach ($line in $csv) {
  Write-Host "Attempting to connect to " $line.Server " on port " $line.Port
  $tcp = New-Object Net.Sockets.TcpClient
  try
   {
      $tcp.Connect($line.Server,$line.Port)
   } catch {}

   if($tcp.Connected)
   {
       $tcp.Close()
       $msg = "** Connected! **"
   }
   else
   {
      $msg = "** Failed! **"                               
   }
    Write-Host $msg
}
