# Ubuntu unattended

Simple script container for unattended Ubuntu installation with gitlab script support
Installs a Ubuntu server installation with a preseed file and does a one time script execution that can be stored on gitlab (or any other link)
Fixes the problem that the late command from the preseed cant wget from github

Created with guidance from: 
https://github.com/dsgnr/Ubuntu-16.04-Unattended-Install


### How to:

Clone the repo to a local share

    git clone https://github.com/Thangart/Ubuntu_unattended

Change the url in the firstrun.sh script to your own git.

    vim Ubuntu_unattended/preseed/firstrun.sh

Change the preseed options to your liking

    vim Ubuntu_unattended/preseed/ubuntu-server.seed

Download the iso 

    wget http://releases.ubuntu.com/16.04.2/ubuntu-16.04.2-server-amd64.iso

Extract the files from the iso

    xorriso -osirrox on -indev ubuntu-16.04.2-server-amd64.iso -extract / custom-iso

cp the git location to the custom-iso location

    sudo cp -r Ubuntu_unattended/* custom-iso/

create the hybrid iso file with

    sudo dd if=ubuntu-16.04.2-server-amd64.iso bs=512 count=1 of=custom-iso/isolinux/isohdpfx.bin

Create the ISO

    cd custom-iso
    sudo xorriso -as mkisofs -isohybrid-mbr isolinux/isohdpfx.bin -c isolinux/boot.cat -b isolinux/isolinux.bin -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot -e boot/grub/efi.img -no-emul-boot -isohybrid-gpt-basdat -o ../custom-ubuntu-http.iso .

Boot with the created iso.
