{
  description = "Tiny BusyBox container via Nix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:

  let

    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };

  in rec {

    packages.${system}.default =

      pkgs.dockerTools.buildLayeredImage {

        name = "busy";
        tag  = "latest";
        contents = with pkgs; [ pkgsStatic.busybox ];

        config = {
          Entrypoint = [ "/bin/sh" ];
          WorkingDir = "/";
        };
      };
  };
}
