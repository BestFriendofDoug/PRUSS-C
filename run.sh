cp /root/PRUSS-C/am335x_pru_package/pru_sw/app_loader/lib/libprussdrv.so /usr/local/lib
cd /PRUSS-C/PRUSS_LIB/example
make
mv data.bin text.bin /root/PRUSS-C/am335x_pru_package/pru_sw/example_apps
cd ../../am335x_pru_package/pru_sw/example_apps
make
cd blinkled
make
modprobe uio_pruss 
export LD_LIBRARY_PATH=/usr/local/lib
mv /root/PRUSS-C/overlay/KA-GPIO-Test-00A0.dtbo /lib/firmware 
echo KA-GPIO-Test:00A0 > /sys/devices/bone_capemgr.9/slots
cd ../bin
./blinkled​
