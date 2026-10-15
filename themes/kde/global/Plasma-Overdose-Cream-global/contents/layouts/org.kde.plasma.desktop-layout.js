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
                    "changedPositions": "{\"desktop:/hydralauncher.desktop\":[\"3127x1309\",\"0\",\"1\"],\"desktop:/org.kde.discover.desktop\":[\"3127x1309\",\"1\",\"0\"],\"desktop:/org.vinegarhq.Sober.desktop\":[\"3127x1309\",\"0\",\"2\"],\"desktop:/steam.desktop\":[\"3127x1309\",\"0\",\"0\"]}",
                    "lastResolution": "3127x1309",
                    "positions": "{\"3127x1309\":[\"1\",\"28\",\"desktop:/org.kde.discover.desktop\",\"1\",\"0\",\"desktop:/org.vinegarhq.Sober.desktop\",\"0\",\"2\",\"desktop:/hydralauncher.desktop\",\"0\",\"1\",\"desktop:/steam.desktop\",\"0\",\"0\"]}",
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
                            "popupHeight": "549",
                            "popupWidth": "772"
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
                            "launchers": "preferred://filemanager,preferred://browser,applications:vesktop.desktop,applications:org.kde.discover.desktop"
                        }
                    },
                    "plugin": "org.kde.plasma.icontasks"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "450",
                            "popupWidth": "560"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        }
                    },
                    "plugin": "org.kde.plasma.showdesktop"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "3",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 3.1,
            "hiding": "normal",
            "location": "left",
            "maximumLength": 65.45,
            "minimumLength": 65.45,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
