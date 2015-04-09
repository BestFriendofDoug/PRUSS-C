#First, we need to make sure we have libstarterware.a, which is a package of the starterware files. It is created using 
#Makefile below
git clone https://gist.github.com/d3e761ade54df23f04a6.git
mv Makefile /root/PRUSS-C/PRUSS_LIB/AM335X_StarterWare_02_00_01_01/
cd /root/PRUSS-C/PRUSS_LIB/AM335X_StarterWare_02_00_01_01/
make
#Change directories as seen below, making sure the paths in the Makefile are correct, as noted in issue #2
cd /root/PRUSS-C/PRUSS_LIB/example
make
#move the .bin files into the example_apps folder so the Makefile will mv them to the /bin directory when it is created
mv data.bin text.bin /root/PRUSS-C/am335x_pru_package/pru_sw/example_apps
cd ../../am335x_pru_package/pru_sw/example_apps
make
cd blinkled
make
#set up the LD_LIBRARY_PATH variable correctly
export LD_LIBRARY_PATH=/usr/local/lib
#initiate the uio_pruss
modprobe uio_pruss
#compile the device tree overlay and move it into the correct directory
cd /root/PRUSS-C/overlay
dtc -O dtb -o KA-GPIO-Test-00A0.dtbo -b o -@ KA-GPIO-Test.dts
mv /root/PRUSS-C/overlay/KA-GPIO-Test-00A0.dtbo /lib/firmware
#set device tree as live tree 
echo KA-GPIO-Test:00A0 > /sys/devices/bone_capemgr.9/slots
cd /root/PRUSS-C/am335x_pru_package/pru_sw/example_apps/bin

