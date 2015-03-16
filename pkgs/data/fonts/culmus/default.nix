{ stdenv, fetchurl, mkfontdir, mkfontscale }:

let version = "0.130";

in stdenv.mkDerivation {
  name = "culmus-${version}";

  src = fetchurl {
    url = "http://liquidtelecom.dl.sourceforge.net/project/culmus/culmus/${version}/culmus-${version}.tar.gz";
    sha256 = "1hgr8rw64g5v10a06llracczqsdc1q9zff2gvxikm65wi3iq71ch";
  };

  buildInputs = [ mkfontdir mkfontscale ];

  installPhase = ''
    mkdir -p $out/share/fonts/{type1,truetype}
    cp *.afm *.pfa fonts.scale-type1 $out/share/fonts/type1/
    cp *.ttf fonts.scale-ttf $out/share/fonts/truetype/
    cd $out/share/fonts
    mkfontdir
    mkfontscale
  '';

  meta = {
    description = "Basic collection of Hebrew fonts for X Windows";
    longDescription = ''
      15 Hebrew font families providing a basic set of a serif (Frank
      Ruehl), sans serif (Nachlieli) and monospaced (Miriam Mono)
      fonts.  Also included Miriam, Drugulin, Aharoni, David, Hadasim
      etc.  Cantillation marks support is available in Keter YG and
      Shofar.
    '';
    homepage = http://culmus.sourceforge.net/;
    license = stdenv.lib.licenses.gpl2;
  };
}
