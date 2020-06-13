#!/bin/bash
	
sudo apt-get autoremove
sudo apt-get clean
# zero out drive
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
