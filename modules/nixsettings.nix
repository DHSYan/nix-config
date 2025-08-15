{ inputs, ... }:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

  nix.gc = {
    automatic = true;
    randomizedDelaySec = "14m";
    options = "--delete-older-than 10d";
    dates = "weekly";
  };
}
