{ ... }:
{
  programs.ghostty = {
    enable = true;

    settings = {
      font-family = "DepartureMono Nerd Font Mono";
      font-size = 12;
      theme = "plasma-overdose-cream";
    };
 
    themes = {
      plasma-overdose-cream = {
        # Main UI
        background = "f0ece0";
        foreground = "202628";
        cursor-color = "c87922";
        cursor-text = "202628";
        selection-background = "6a5c46";
        selection-foreground = "ffffff";
        split-divider-color = "97603a";

        palette = [
          # ANSI colors
          "0=#202628"
          "1=#a83232"
          "2=#39734a"
          "3=#875321"
          "4=#213d58"
          "5=#80523a"
          "6=#356575"
          "7=#6a5c46"
          # Bright ANSI colors
          "8=#776250"
          "9=#b03b32"
          "10=#2d764f"
          "11=#946023"
          "12=#405a66"
          "13=#8b5940"
          "14=#426b75"
          "15=#b5a386"
        ];
      };
    };    
  };
  
  xdg.configFile."systemd/user/app-com.mitchellh.ghostty.service.d/zz-gtk-input.conf".text = ''
    [Service]
    Environment=GTK_IM_MODULE=simple
  '';
}
