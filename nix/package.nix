{ perSystem, pkgs, ... }:
let
  inherit (pkgs) bash resholve;
  inherit (pkgs.lib) getExe;

  pname = "pre-save-cache";
  dependencies = with pkgs; [ coreutils ];
in
resholve.mkDerivation {
  inherit pname;
  version = "0.0.1";
  src = ../pre-save-cache.bash;
  meta.mainProgram = pname;
  dontUnpack = true;

  installPhase = ''
    install -D $src $out/bin/${pname}
  '';

  solutions.default = {
    scripts = [ "bin/${pname}" ];
    interpreter = "${getExe bash}";
    inputs = dependencies;
    # execer = [
    #   "cannot:${getExe git}"
    #   "cannot:${getExe direnv}"
    #   "cannot:${getExe' perl "shasum"}"
    # ];
    fake.external = [
      "nix-collect-garbage"
    ];
  };

  passthru.devshellModule =
    { pkgs, ... }:
    {
      devshell.packages = [bash] ++ dependencies;
    };
}