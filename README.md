PRUSS-C
=======

C Library for the BeagleBone (Black) Programmable Realtime Unit SubSystem

###Repo Explanation

###Compiling and Executing example GPIO program
#####Issues to consider before running:
    Issue #1:
        I am using arm-linux-gnueabihf- for my gcc and ar tools, so you will want to check which compiler you            have downloaded and make sure you have that correctly in all the Makefiles needed
    
    Issue #2:
        The paths in the Makefiles are all assuming you have cloned this git repo into the /root directory. If           that is not the case, you will need to change all the paths in the Makefiles from /root/PRUSS-C/etc to           /root/path/to/PRUSS-C/etc
    
    Issue #3:
        Make sure you have the following lines written in the memory section of /usr/share/ti/cgt-pru/lib/lnk.cmd
        
        MEMORY
        {
        PAGE 2:
        MEM : org = 0x00026000 len = 0x00002000 CREGISTER=4
        } 
        
    Issue #4:
        In the /root/PRUSS-C/PRUSS_LIB/example/Makefile you need to make sure the CGTDIR variable is set to the path where you have your libc.a saved


    
