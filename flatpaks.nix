{ ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      "io.github.ciromattia.kcc"
      "io.mrarm.mcpelauncher"
      "org.vinegarhq.Sober" 
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
