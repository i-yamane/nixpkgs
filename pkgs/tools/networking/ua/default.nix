{ lib, stdenv, buildGoPackage, fetchgit
, pkg-config
, glib, libxml2
}:

buildGoPackage rec {
  pname = "ua-unstable";
  version = "2017-02-24";
  rev = "325dab92c60e0f028e55060f0c288aa70905fb17";

  goPackagePath = "github.com/sloonz/ua";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/sloonz/ua.git";
    sha256 = "0452qknc8km9495324g6b5ja3shvk8jl7aa9nrjhdylf09dp2nif";
  };

  goDeps = ./deps.nix;

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ glib libxml2 ];

  meta = {
    homepage = "https://github.com/sloonz/ua";
    license = lib.licenses.isc;
    description = "Universal Aggregator";
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ ttuegel ];
  };
}
