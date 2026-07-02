# Placeholder for the machine's real hardware-configuration.nix, so that the
# config can be evaluated (`just test`, CI) before the machine exists. Flakes
# only see git-tracked files, hence this must be committed. On install day,
# overwrite it with the machine-generated one and commit:
#
#   nixos-generate-config --show-hardware-config > hardware-configuration.nix

{ lib, ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/00000000-0000-0000-0000-000000000000";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0000-0000";
    fsType = "vfat";
  };

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
