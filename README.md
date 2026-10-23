[PT-BR](/README.md) | [ENG](/docs/README-ENG.md)

# Meu NixOS
Minha configuração pessoal do NixOS. **KDE Plasma com uma estética pixel art em tons de creme e marrom, usando o [Plasma Overdose](https://github.com/Notify-ctrl/Plasma-Overdose) como tema base**.

O setup utiliza NixOS 26.05 com **Home Manager** para as configurações do usuário e **Plasma Manager** para a configuração declarativa do KDE.

Esta configuração foi feita para o meu hardware e minhas preferências, mas a organização em módulos deve tornar fácil encontrar algo que você queira aproveitar.

## Screenshots

<h3 align="center">🖥️ Plasma Overdose Cream</h3>
<p align="center">
  <img src=".github/screenshot-1.png" width="90%" alt="Desktop">
</p>
<h3 align="center">🐉 Hydra Launcher + Discord</h3>
<p align="center">
  <img src=".github/screenshot-2.png" width="90%" alt="Desktop">
</p>

## Como tudo funciona

A configuração é dividida em três camadas principais:

| Camada | Responsabilidades |
| --- | --- |
| [NixOS](docs/NIXOS.md) | Hardware, boot, usuários, rede, serviços do sistema e pacotes |
| [Home Manager](docs/HOME-MANAGER.md) | Aplicativos, shell, dotfiles e arquivos no diretório home |
| [Plasma Manager](docs/PLASMA-MANAGER.md) | Configurações do KDE, atalhos, window rules e wallpapers |

O conjunto principal de pacotes segue o NixOS 26.05. O Zen Browser utiliza um input separado do `unstable`, enquanto os demais inputs fornecem:

- `home-manager`;
- `plasma-manager`;
- `nix-cachyos-kernel`;
- `nix-flatpak` (para gerenciamento declarativo de Flatpaks);
- `millennium` (para personalizar a Steam);
- `qylock` (para os incríveis temas do `sddm`);
- `bedrock-on-linux` (Minecraft Bedrock, versão GDK, rodando via Wine/Proton);
- `lsfg-vk` (Lossless Scaling).

## Validar e aplicar

A partir da raiz do repositório:

```sh
# Avalia a configuração sem fazer o build do sistema inteiro
nix flake check --no-build --no-write-lock-file

# Faz o build do Tidaler e executa os checks de empacotamento
nix build --no-link --no-write-lock-file .#tidaler
```

O workflow do GitHub Actions também executa esses checks.

Para testar e depois aplicar permanentemente a configuração do sistema:

```sh
sudo nixos-rebuild test --flake .#hephaestus
sudo nixos-rebuild switch --flake .#hephaestus
```

O comando `test` ativa a configuração sem defini-la como padrão para o próximo boot. Já o `switch` também a torna padrão para os próximos boots.

Se você pretende adaptar este setup, revise primeiro a configuração de hardware, o nome de usuário, os paths do diretório home, as configurações específicas dos monitores e a identidade SSH.

Não altere `system.stateVersion` nem `home.stateVersion` durante atualizações rotineiras: essas opções controlam os padrões de compatibilidade, não as versões dos pacotes.

## Créditos

Este setup utiliza e se baseia nos seguintes projetos:

- [NixOS](https://nixos.org/), [Home Manager](https://github.com/nix-community/home-manager) e [Plasma Manager](https://github.com/nix-community/plasma-manager)
- [KDE Plasma](https://kde.org/pt-br/plasma-desktop/)
- [Pixora icons](https://github.com/tsora1603/pixora-icons) (meu próprio tema de ícones!)
- [Plasma Overdose](https://github.com/Notify-ctrl/Plasma-Overdose), por Notify-ctrl (a base do tema KDE)
- [Millennium](https://github.com/SteamClientHomebrew/Millennium) e o [tema Win95 para Steam](https://github.com/ricewind012/win95-themes/blob/master/docs/steam.md), por ricewind012
- [Qylock](https://github.com/Darkkal44/qylock)
- [plasma-always-floating-panel-patch](https://github.com/illatillmods/plasma-always-floating-panel-patch)
