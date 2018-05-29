set frame  0
axes location off
set folder [lindex $argv 0]
set output ${folder}/outputs
set outputobjfolder ${output}/animate.%08d.obj
set outputimgfolder ${output}/image.%08d.tga

foreach pdb [lsort -decreasing [glob ${folder}/*.pdb]] { 
  mol addfile $pdb 

  incr frame
} 

mol modselect 0 0 all
mol modstyle 0 0 Newcartoon
mol modcolor 0 0 Chain