{ stdenv, fetchurl, fontforge }:

let version = "0.6.1";

in stdenv.mkDerivation rec {
  name = "fonts-tlwg-${version}";

  src = fetchurl {
    url = "ftp://linux.thai.net/pub/thailinux/software/fonts-tlwg/${name}.tar.xz";
    sha256 = "0dx5mfgzx8v9m4yzhgfqq3lvcnnlwzf3zb43yv4n1phz48r9iyvp";
  };

  buildInputs = [ fontforge ];

  meta = {
    description = "A collection of Thai scalable fonts";
    longDescription = ''
      Fonts-TLWG (formerly ThaiFonts-Scalable) is a collection of Thai
      scalable fonts available in free licenses. Its goal is to
      provide fonts that conform to existing standards and
      recommendations, so that it can be a reference implementation.
    '';
    homepage = http://linux.thai.net/projects/fonts-tlwg;
  };
}
