{ stdenv, fetchhg, emacs, bongo }:

stdenv.mkDerivation rec {
  name = "org-player-1ffe67f";

  src = fetchhg {
    url = "https://bitbucket.org/eeeickythump/org-player/";
    rev = "1ffe67f";
    sha256 = "1xvgzdwdd1lrk0s1hislls4s1wvwv8sjdmdw0lb3z8737b2w2iqm";
  };

  buildInputs = [ emacs bongo ];

  buildPhase = ''
    emacs -L "${bongo}/share/emacs/site-lisp" --batch \
      -f batch-byte-compile *.el
  '';

  installPhase = ''
    install -d $out/share/emacs/site-lisp
    install *.el *.elc $out/share/emacs/site-lisp
  '';

  meta = {
    description = "Play audio and video files in org-mode hyperlinks";
    homepage = https://bitbucket.org/eeeickythump/org-player/;
    license = null;

    platforms = stdenv.lib.platforms.all;
  };
}
