{ stdenv, fetchurl, unzip }:

stdenv.mkDerivation {
  name = "ipafont-003.03";

  src = fetchurl {
    url = "http://dl.sourceforge.jp/ipafonts/51868/IPAfont00303.zip";
    sha256 = "1rbgfq14ld0cwas6bx5h7pwyv2hkfa8ihnphsaz1brxqliwysmgp";
  };

  buildInputs = [ unzip ];

  unpackPhase = ''
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/opentype
    cp ./IPAfont00303/*.ttf $out/share/fonts/opentype/
  '';

  meta = {
    description = "Japanese font package with Mincho and Gothic fonts";
    longDescription = ''
      IPAFont is a Japanese font developed by the Information-technology
      Promotion Agency of Japan. It provides both Mincho and Gothic fonts,
      suitable for both display and printing.
    '';
    homepage = http://ipafont.ipa.go.jp/ipafont/;
    license = stdenv.lib.licenses.ipa;
    maintainers = [ stdenv.lib.maintainers.auntie ];
  };
}
