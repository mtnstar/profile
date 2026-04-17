#!/bin/bash
 
NK_UUID="d2fb94e6-9434-4c98-bdaf-23475af26b90"  # Find with: nitrocli encrypted open && blkid
NK_DEV="/dev/disk/by-uuid/$NK_UUID"
 
nko() {
  nitrocli encrypted open || return 1
  sleep 1  # give the kernel a moment to register the volume
  udisksctl mount -b "$NK_DEV" && echo "Nitrokey mounted"
}

nkc() {
  udisksctl unmount -b "$NK_DEV" && nitrocli encrypted close && echo "Nitrokey locked"
}
