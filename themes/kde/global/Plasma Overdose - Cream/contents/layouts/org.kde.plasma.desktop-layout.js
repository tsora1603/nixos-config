var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometries-3127x1309": "",
                    "ItemGeometriesHorizontal": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "630",
                    "DialogWidth": "810"
                },
                "/General": {
                    "arrangement": "1",
                    "changedPositions": "{}",
                    "lastResolution": "3127x1309",
                    "positions": "{\"3127x1309\":[\"19\",\"11\",\"desktop:/steam.desktop\",\"18\",\"8\",\"desktop:/hydralauncher.desktop\",\"18\",\"9\",\"desktop:/The Adventures of Elliot The Millennium Tales.desktop\",\"8\",\"2\",\"desktop:/main.xml\",\"0\",\"2\",\"desktop:/io.mrarm.mcpelauncher.desktop\",\"8\",\"3\",\"desktop:/org.kde.discover.desktop\",\"1\",\"0\",\"desktop:/Aseprite.desktop\",\"18\",\"7\",\"desktop:/org.vinegarhq.Sober.desktop\",\"8\",\"4\"]}",
                    "sortMode": "-1"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///home/tsora/Pictures/Wallpapers/MONITOR1/Astral_Grave/wallhaven-l8xwdp_3440x1440.png",
                    "SlidePaths": "/home/tsora/.local/share/wallpapers/,/nix/store/ihbjs797yxfczzl18467izpxi9gp8ykv-breeze-6.6.6/share/wallpapers/,/run/current-system/sw/share/wallpapers/"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        },
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometries-1080x1920": "",
                    "ItemGeometriesVertical": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "1",
                    "wallpaperplugin": "org.kde.image"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///home/tsora/Pictures/Wallpapers/MONITOR2/Permanent/old-pc.png"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/": {
                            "popupHeight": "545",
                            "popupWidth": "780"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/General": {
                            "favoritesPortedToKAstats": "true"
                        }
                    },
                    "plugin": "org.kde.plasma.kickoff"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/General": {
                            "groupedTaskVisualization": "3",
                            "highlightWindows": "true",
                            "launchers": "preferred://filemanager,preferred://browser,file:///nix/store/bsvz84v6p7z3fbcgjqxlckdljpmfw5fp-user-environment/share/applications/vesktop.desktop,file:///nix/store/bbaf7ply9nhl6dv16wan0a7jvgar7l41-system-path/share/applications/org.kde.discover.desktop",
                            "separateLaunchers": "false",
                            "taskMaxWidth": "Wide"
                        }
                    },
                    "plugin": "org.kde.plasma.icontasks"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        }
                    },
                    "plugin": "org.kde.plasma.showdesktop"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "400",
                            "popupWidth": "560"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        }
                    },
                    "plugin": "org.kde.plasma.analogclock"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 4.2,
            "hiding": "normal",
            "location": "bottom",
            "maximumLength": 65.45,
            "minimumLength": 65.45,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
