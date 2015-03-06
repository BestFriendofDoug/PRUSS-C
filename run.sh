#To make sure we have the libprussdrv.so file in the correct directories, perform below command
cp /root/PRUSS-C/am335x_pru_package/pru_sw/app_loader/lib/libprussdrv.so /usr/local/lib
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
#move the device tree overlay into the correct directory
mv /root/PRUSS-C/overlay/KA-GPIO-Test-00A0.dtbo /lib/firmware
#set device tree as live tree 
echo KA-GPIO-Test:00A0 > /sys/devices/bone_capemgr.9/slots
cd bin
#execute blinkled program
./blinkled​
