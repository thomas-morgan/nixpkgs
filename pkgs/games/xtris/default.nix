{ stdenv, fetchurl, libX11 }:

stdenv.mkDerivation {
  name = "xtris-1.15";
  
  src = fetchurl {
    url = http://ftp.uni-erlangen.de/mirrors/gentoo/distfiles/xtris-1.15.tar.gz;
    sha256 = "0s1xjdn24dpz3djkrrn4bybydbb2dxl5rj81c99ihaiqjl3v74ap";
  };
  
  prePatch = "substituteInPlace Makefile --replace /usr/local $out";

  buildInputs = [ libX11 ];
  
  meta = {
    description = "A multi-player version of Tetris for the X Window system";
    license = stdenv.lib.licenses.gpl2Plus;
  };
}
