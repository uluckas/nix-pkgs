{ stdenv, pkgs}:

stdenv.mkDerivation {
  name = "lookbusy";
  version = "1.3";
  src = pkgs.fetchgit {
    url = "https://github.com/uluckas/lookbusy";
    rev = "refs/heads/main";
    sha256 = "sha256-618HiG2AlymzLCmuGIrtRC203VFZg9e1wJWuVGz2hdY=";
  };
}
