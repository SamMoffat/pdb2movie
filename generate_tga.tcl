set frame  0
axes location off
set folder [lindex $argv 0]
set negfolder $folder*-neg/*.pdb
set posfolder $folder*-pos/*.pdb
set outputobjfolder $folder/outputs/animate.%08d.obj
set outputimgfolder $folder/outputs/image.%08d.tga

foreach pdb [lsort -decreasing [glob $posfolder]] { 
  mol addfile $pdb 

  incr frame
} 

foreach pdb [lsort [glob $negfolder]] { 
  mol addfile $pdb 

  incr frame
} 

mol modselect 0 0 all
mol modstyle 0 0 Newcartoon
mol modcolor 0 0 Chain

# now writing out the images/objects
for {set framecount 0} {$framecount < $frame} {incr framecount 1} {
    set imgfilename [format $outputimgfolder $framecount]
    set objfilename [format $outputobjfolder $framecount]

    # images
    render snapshot $imgfilename
    # objects
    animate goto $framecount
    render Wavefront $objfilename
}

quit

