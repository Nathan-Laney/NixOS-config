{ inputs, lib, config, pkgs, ... }: 
{
  nixpkgs = {
    # # You can add overlays here
    # overlays = [
    #   # Add overlays your own flake exports (from overlays and pkgs dir):
    #   outputs.overlays.additions
    #   outputs.overlays.modifications
    #   outputs.overlays.unstable-packages

    #   # You can also add overlays exported from other flakes:
    #   # neovim-nightly-overlay.overlays.default

    #   # Or define it inline, for example:
    #   # (final: prev: {
    #   #   hi = final.hello.overrideAttrs (oldAttrs: {
    #   #     patches = [ ./change-hello-to-hi.patch ];
    #   #   });
    #   # })
    # ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
    };
  };
  home.username = "nathan";
  home.homeDirectory = "/home/nathan";
  

  home.packages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    discord
    steam
    vscode
    tailscale	
    tailscale-systray
    s3fs
    bitwarden
    inkscape
    python3
    python310Packages.distutils_extra
    conda
    libstdcxx5
    git
    signal-desktop
    slack
  ];

  home.file = {
    
  };

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;
  programs.git = {
	enable = true;
	userName = "Nathan Laney";
	userEmail = "nathaniel.laney@gmail.com";
};

  home.stateVersion = "22.11"; # Please read the comment before changing.
}
