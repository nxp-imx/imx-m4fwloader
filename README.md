# imx-m4fwloader
Tool for loading firmware to M4 core on i.MX6SX and i.MX7D from Linux user space.

### How to use this
- Use the environment provided to you by Yocto:
	- For example:
	- ``source /opt/poky/1.8/environment-setup-cortexa9hf-vfp-neon-poky-linux-gnueabi``
	- ``$CC m4fwloader.c -o m4fwloader``
	- You get m4fwloader binary...
- Then you need to build your M4 application and link it to some address. (e.g 0x00910000, try: https://github.com/EmbeddedRPC/erpc-imx-demos/tree/master/MCU/example_rpmsg)
- Load it using m4fwloader: ``./m4fwloader myapp.bin 0x00910000``
- Optionally use --verbose parameter to see what is written to each registers
- Warning: Use this tool for debugging only, since it accesses directly the registers from the user space and requires therefore root priviledges!
- You have been warned... :-)
- Optionally, you can trigger an interrupt using message unit (MU) to the M4 core to get RPMsg started - this is normally done by Linux Kernel during startup: ``./m4fwloader kick 0`` 
- Whole usage is here:
	- ``m4fwloader [filename.bin] [0xLOADADDR] [--verbose]``  # loads new firmware  
	- or: ``m4fwloader stop``                    # holds the auxiliary core in reset  
	- or: ``m4fwloader start``                   # releases the auxiliary core from reset  
	- or: ``m4fwloader kick [n]``                # triggers interrupt on RPMsg virtqueue n
- by Marek Novak: marek.novak@nxp.com
