$impath=$args[0]
$im = (Get-Item $impath)
write-host "$impath"
Add-Type -Path "AForge.Imaging.dll"
$img = [System.Drawing.Image]::FromFile($impath)
$filter = [AForge.Imaging.Filters.Mean]::new()
$filter.ApplyInPlace($img)
$newpath = (join-path $im.DirectoryName $im.BaseName) + "_average.png"
$img.Save($newpath)