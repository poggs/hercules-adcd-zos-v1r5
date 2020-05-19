#!/bin/bash
#
#  Extract DASD images from z/OS 1.5 ADCD archive
#

extractImage() {
  echo "Extracting image #$1"
  mkdir ISO$1
  cd ISO$1
  7z x ../ibm_adcd_zos15_cd$1of$2.iso # > /dev/null
  cd ..
}

extractVolume() {
  echo "Extracting $2 from ISO$1"
  cd DASD
  7z e ../ISO$1/ZOS15/$3.ZIP # > /dev/null
  cd ..
}

echo "Extracting files from ISO images"
for img in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15
do
  extractImage $img 15
done

echo "Extracting DASD images"
mkdir DASD

extractVolume 01 "first RES volume" Z5RES1
extractVolume 02 "second RES volume" Z5RES2
extractVolume 03 "second part of OS390DA volume 5" Z5USS1
extractVolume 03 "service volume" OS39M1
extractVolume 04 "HFS" Z5USS2
extractVolume 05 "DLIB volume 1" Z5DIS1
extractVolume 06 "DLIB volume 2" Z5DIS2
extractVolume 07 "DLIB volume 3" Z5DIS3
extractVolume 08 "database product volume (DB/2)" Z5DB21
extractVolume 09 "CICS volume" Z5CIC1
extractVolume 10 "IMS database products" Z5IMS1
extractVolume 11 "component broker" Z5WAS1
extractVolume 12 "WebSphere" Z5WAS2
extractVolume 13 "unknown" Z5DIS4
extractVolume 14 "unknown" Z5DB81
extractVolume 15 "unknown" Z5DB22
