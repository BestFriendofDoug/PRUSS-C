CC := clpru
LD := lnkpru
HEXBIN := hexpru
 
SWDIR = /usr/share/pru_am335x_starterware
CGTDIR = /usr/share/ti/cgt-pru
NEWDIR = /root/seantest/PRUSS-C/PRUSS_LIB/AM335X_StarterWare_02_00_01_01
 
#INCLUDEDIR = -I$(SWDIR)/include -I$(SWDIR)/include/hw -I$(SWDIR)/include/pru -I$(CGTDIR)/include
INCLUDEDIR = -I$(SWDIR)/include -I$(SWDIR)/include/hw -I$(SWDIR)/include/pru -I$(CGTDIR)/include -I$(NEWDIR)/include -I$(NEWDIR)/include/hw
LIBDIR = -i$(SWDIR)/lib -i$(CGTDIR)/lib
 
CMD = lnk.cmd
OBJECTS = blinkled.o
TARGET = blinkled.out
 
CFLAGS := -O3 -Dam335x $(INCLUDEDIR)
 
$(TARGET): $(OBJECTS)
#	$(LD) $(CMD) -o $@ $(OBJECTS) $(LIBDIR) -llibstarterware.a
	$(LD) -i/usr/share/ti/cgt-pru/lib -l$(CMD) -o $@ $(OBJECTS) $(LIBDIR) -i/root/seantest/PRUSS-C/PRUSS_LIB/AM335X_StarterWare_02_00_01_01/build/pru -llibstarterware.a
	$(HEXBIN) $(TARGET) /root/bin.cmd
%.o: %.c
	$(CC) -c --output_file=$@ $< $(CFLAGS)
 
.PHONY: clean
 
clean:
	rm -f $(OBJECTS) $(TARGET)
