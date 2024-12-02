{ stdenv, fetchgit, lib }:

stdenv.mkDerivation {
  name = "lookbusy";
  version = "1.3";
  src = fetchgit {
    url = "https://github.com/uluckas/lookbusy";
    rev = "refs/heads/main";
    sha256 = "sha256-618HiG2AlymzLCmuGIrtRC203VFZg9e1wJWuVGz2hdY=";
  };

  buildInputs = [ ];

  meta = with lib; {
    description = "This is lookbusy, a tool for keeping the systems busy.  It uses relatively simple techniques to generate CPU activity, memory and disk utilization and traffic.";
    license = licenses.gpl2;
  };
}
