set frame  0
axes location off
set folder [lindex $argv 0]
set output ${folder}/outputs
#set outputobjfolder ${output}/animate.1%07d.obj
set outputimgfolder ${output}/image.1%07d.tga

foreach pdb [lsort -decreasing [glob ${folder}/tmp_froda*.pdb]] { 
  mol addfile $pdb 

  incr frame
} 

mol modselect 0 0 all
mol modstyle 0 0 Newcartoon
mol modcolor 0 0 Chain
