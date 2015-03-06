{ stdenv, fetchurl, emacs }:

let version = "1.0.4";

in stdenv.mkDerivation {
  name = "dictem-${version}";

  src = fetchurl {
    url = "http://www.mova.org/~cheusov/pub/dictem/dictem-${version}.tar.gz";
    sha256 = "d28f3a51c3991f04b25534a9aecdff2473ff71d697ac978d0641f4026518c1ad";
  };

  buildInputs = [ emacs ];

  buildPhase = ''
    emacs -L . --batch -f batch-byte-compile *.el
  '';

  installPhase = ''
    install -d $out/share/emacs/site-lisp
    install *.el *.elc $out/share/emacs/site-lisp
  '';

  meta = {
    description = "DICT protocol client (rfc-2229) for [X]Emacs";
    homepage = http://www.emacswiki.org/emacs/DictEm;
    license = stdenv.lib.licenses.gpl2Plus;

    platforms = stdenv.lib.platforms.all;
  };
}
