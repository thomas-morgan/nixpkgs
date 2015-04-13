{ stdenv, fetchgit, ... } @ args:

let
  lastRelease = "4.0-rc7";
  revision = "e5e02de0665ef2477e7a018193051387c6fe0fbc";

in import ./generic.nix (args // rec {
  version = "${lastRelease}-${revision}";
  modDirVersion = "${lastRelease}-${revision}";
  extraMeta.branch = "4.0";

  src = fetchgit {
    url = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git";
    rev = revision;
    sha256 = "1m5fn3mk98xwdnav5sgngyxknzsy67pnk9ighb5585h48ydgsk7n";
  };

  features.iwlwifi = true;
  features.efiBootStub = true;
  features.needsCifsUtils = true;
  features.canDisableNetfilterConntrackHelpers = true;
  features.netfilterRPFilter = true;

  # Should the testing kernels ever be built on Hydra?
  extraMeta.hydraPlatforms = [];

} // (args.argsOverride or {}))
