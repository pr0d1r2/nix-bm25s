{ pkgs, src }:
pkgs.python313Packages.buildPythonPackage {
  pname = "bm25s";
  version = "0.3.9";

  inherit src;

  pyproject = true;

  build-system = with pkgs.python313Packages; [
    setuptools
    setuptools-scm
  ];

  dependencies = with pkgs.python313Packages; [
    numpy
  ];

  pythonImportsCheck = [ "bm25s" ];

  meta = with pkgs.lib; {
    description = "Fast BM25 implementation in Python using sparse matrices and numpy";
    homepage = "https://github.com/xhluca/bm25s";
    license = licenses.mit;
  };
}
