{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    
    settings = {
      user = {
        name = "tsora1603";
        email = "neiva.cesar07@proton.me";
      };

      init.defaultBranch = "main";

      pull.rebase = false;
      push.autoSetupRemote = true;

      core = {
        autocrlf = "input";
      };

      alias = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        lg = "log --oneline --graph --decorate --all";
      };
    };
  };
}
