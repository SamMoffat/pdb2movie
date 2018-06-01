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
