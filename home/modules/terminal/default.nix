{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
  ];

  programs.git = {
    enable = true;
    userName = "Evan McPheron";
    userEmail = "evancmcpheron@gmail.com";
  };

  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    bashrcExtra = ''
      export QT_QPA_PLATFORMTHEME=gtk2

      export PATH=/home/etanheinmik/repos/swww/target/release/:$PATH
      export PATH=/home/etanheinmik/repos/swww/target/release/swww:$PATH
      export PATH=/home/etanheinmik/repos/woomer/target/release/woomer:$PATH
      export PATH=/home/etanheinmik/.cargo/bin/:$PATH
      export PATH=/home/etanheinmik/classes/ece391/riscv/bin:$PATH

      set -o vi
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      ls="eza";
      ll="eza -l";
      python-venv="source ~/.pyvenv/bin/activate";
      fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'";
      nmls="nmcli device wifi list";
      nmcn="nmcli device wifi connect --ask";
    };
  };
}
