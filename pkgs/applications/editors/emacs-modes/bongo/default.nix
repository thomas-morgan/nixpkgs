{ stdenv, fetchurl, emacs }:

let version = "1.0";

in stdenv.mkDerivation rec {
  name = "bongo-${version}";

  src = fetchurl {
    url = "https://github.com/dbrock/bongo/archive/${version}.tar.gz";
    sha256 = "1pcsyyrvj7djjjwpaswd1i782hvqvlvs39cy9ns0k795si6xd64d";
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
    description = "Flexible and usable media player for Emacs";
    homepage = http://www.emacswiki.org/cgi-bin/wiki/Bongo;
    license = stdenv.lib.licenses.gpl2Plus;

    platforms = stdenv.lib.platforms.all;
  };
}
