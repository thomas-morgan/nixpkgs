{ stdenv, fetchurl, unzip }:

let version = "3.001";

in stdenv.mkDerivation {
  name = "kanji-stroke-orders-${version}";

  src = fetchurl {
    url = "https://dl.dropboxusercontent.com/u/39004158/KanjiStrokeOrders_v${version}.zip";
    sha256 = "0158hs3bf559afda3bag467wpwl4066vi9nqj3y4z1wfnkvqr7bs";
  };

  buildInputs = [ unzip ];

  unpackPhase = ''
    mkdir KanjiStrokeOrders_v${version}
    cd KanjiStrokeOrders_v${version}
    echo unzip $src
    unzip $src
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp KanjiStrokeOrders_v${version}.ttf $out/share/fonts/truetype/
  '';

  meta = {
    description = "Font showing stroke order diagrams for Japanese characters";
    longDescription = ''
      This font provides an easy way to view stroke order diagrams for over 6500
      kanji, over 180 kana symbols, the Latin characters and quite a few other
      symbols.
    '';
    homepage = https://sites.google.com/site/nihilistorguk/;
    license = stdenv.lib.licenses.bsd3;
  };
}
