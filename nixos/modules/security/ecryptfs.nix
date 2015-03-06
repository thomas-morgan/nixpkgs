{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.security.ecryptfs;

in
{
  options = {
    security.ecryptfs = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Whether to install eCryptfs utilities with setuid wrappers
          and enable auto-mounting user private directories on login.

          Note that nixpkgs.config.ecryptfs.setuid must be enabled
          for eCryptfs utilities to use the setuid wrappers created
          by this option.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [ pkgs.ecryptfs ];
    security.setuidPrograms = [
      "mount.ecryptfs_private" "umount.ecryptfs_private"
    ];
  };
}
