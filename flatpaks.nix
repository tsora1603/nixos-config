{ ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "io.github.ciromattia.kcc"
      "io.mrarm.mcpelauncher"
      "org.vinegarhq.Sober"
      "org.strawberrymusicplayer.strawberry"
      "org.mediaharbor.MediaHarbor"
    ];

    uninstallUnmanaged = false;
    uninstallUnused = false;

    update = {
      onActivation = false;

      auto = {
        enable = true;
        onCalendar = "weekly";
      };
    };
  };
}
