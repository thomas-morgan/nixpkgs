# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, fftw, primitive, storableComplex, vector }:

cabal.mkDerivation (self: {
  pname = "vector-fftw";
  version = "0.1.3.2";
  sha256 = "0rfvr86yiwp4wb9qjggbbacmgkfj6xrk6h7xb4xmhmk88slvifm0";
  buildDepends = [ primitive storableComplex vector ];
  extraLibraries = [ fftw ];
  meta = {
    homepage = "http://hackage.haskell.org/package/vector-fftw";
    description = "A binding to the fftw library for one-dimensional vectors";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
