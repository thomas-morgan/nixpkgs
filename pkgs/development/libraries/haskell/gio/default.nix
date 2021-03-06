# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, glib, gtk2hsBuildtools, mtl }:

cabal.mkDerivation (self: {
  pname = "gio";
  version = "0.13.0.3";
  sha256 = "15025jj6i1gpvjs46545vzmvs6ka41x15lrllqr9hd0qsyhibsf5";
  buildDepends = [ glib mtl ];
  buildTools = [ gtk2hsBuildtools ];
  pkgconfigDepends = [ glib ];
  meta = {
    homepage = "http://projects.haskell.org/gtk2hs/";
    description = "Binding to the GIO";
    license = self.stdenv.lib.licenses.lgpl21;
    platforms = self.ghc.meta.platforms;
  };
})
