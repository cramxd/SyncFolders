while (1){
    $sourceFolder = 'C:\Path\To\Source\Folder'
    $destinationFolder = 'C:Path\To\Destination\Folder'

    $src = Get-ChildItem -Recurse -Path $sourceFolder
    $dst = Get-ChildItem -Recurse -Path $destinationFolder
        
    #Compares source and destination folder recursively (returns '=>', '<=' or nothing if it hasn't been changed)
    $comp = Compare-Object -ReferenceObject $src -DifferenceObject $dst
        
    #Checks if there are changes (if comparison has returned '=>' or '<=')
    if($comp.SideIndicator -eq '<=' -or $comp.SideIndicator -eq '=>'){
        #Mirrors destination folder exactly how source folder is
        robocopy $sourceFolder $destinationFolder /MIR
    }
    Start-Sleep -s 10 #Wait 10 seconds to check everything again
}
