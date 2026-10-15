import QtQuick
import org.kde.kwin.decoration

// Note: I'm not considering maximized here because original game doesn't either.

Decoration {
  id: root

  property real pixelWidth: 1.5
  property color colorPurple: "#4D23CF"
  property color colorCyan: "#90F4E4"
  property color colorPink: "#F0D1F1"
  property color colorMagenta: "#EAA0E8"
  property color colorWhite: "#FFF8FF"
  property color colorGray: "#F0ECE0"
  // The old fixed QML shadow is now configurable in this theme's settings.
  property bool shadowEnabled: true
  property int shadowOpacity: 30
  property int shadowOffsetX: 2
  property int shadowOffsetY: 2
  property color shadowColor: "#4D23CF"
  // Inactive windows have independent shadow settings (and can be disabled).
  property bool inactiveShadowEnabled: true
  property int inactiveShadowOpacity: 20
  property int inactiveShadowOffsetX: 2
  property int inactiveShadowOffsetY: 2
  property color inactiveShadowColor: "#6A5C46"
  readonly property real buttonSize: pixelWidth * 10

  DecorationOptions {
    id: options
    deco: decoration
  }

  // Pixel-sharp drop shadow, with separate active/inactive palettes and
  // geometry. This is drawn by Aurorae, not KWin's compositor shadow effect.
  Rectangle {
    id: shadow
    visible: !decoration.client.maximized &&
             (decoration.client.active
               ? root.shadowEnabled && root.shadowOpacity > 0
               : root.inactiveShadowEnabled && root.inactiveShadowOpacity > 0)
    width: background.width
    height: background.height
    anchors.left: background.left
    anchors.top: background.top
    anchors.leftMargin: (decoration.client.active ? root.shadowOffsetX : root.inactiveShadowOffsetX) * root.pixelWidth
    anchors.topMargin: (decoration.client.active ? root.shadowOffsetY : root.inactiveShadowOffsetY) * root.pixelWidth
    color: decoration.client.active ? root.shadowColor : root.inactiveShadowColor
    opacity: (decoration.client.active ? root.shadowOpacity : root.inactiveShadowOpacity) / 100
    z: -1
  }

  Rectangle {
    id: background
    color: decoration.client.active ? root.colorCyan : root.colorGray
    border.width: root.pixelWidth
    border.color: root.colorPurple
    anchors.fill: parent
    anchors.leftMargin: root.padding.left
    anchors.rightMargin: root.padding.right
    anchors.topMargin: root.padding.top
    anchors.bottomMargin: root.padding.bottom

    Rectangle {
      id: bottomRect1
      anchors.bottom: parent.bottom
      anchors.left: parent.left
      anchors.leftMargin: root.pixelWidth * 3
      height: root.pixelWidth * 5.5
      width: root.pixelWidth * 18
      color: decoration.client.active ? root.colorMagenta : root.colorGray
      border.width: root.pixelWidth
      border.color: root.colorPurple
    }

    Row {
      anchors.top: bottomRect1.top
      anchors.left: bottomRect1.right
      anchors.leftMargin: root.pixelWidth
      spacing: root.pixelWidth * 0.5

      Repeater {
        model: 3
        Rectangle {
          height: root.pixelWidth * 3.5
          width: root.pixelWidth * 3.5
          color: "transparent"
          border.width: root.pixelWidth
          border.color: root.colorPurple
        }
      }
    }
  }

  Rectangle {
    id: titleRow
    color: decoration.client.active ? root.colorPink : root.colorGray
    border.width: root.pixelWidth
    border.color: root.colorPurple

    height: root.pixelWidth * 15

    anchors {
      left: background.left
      right: background.right
      top: background.top
      topMargin: 3 * root.pixelWidth
      leftMargin: 3 * root.pixelWidth
      rightMargin: 3 * root.pixelWidth
    }

    ButtonGroup {
      id: leftButtonGroup
      spacing: root.pixelWidth * 2
      explicitSpacer: root.buttonSize
      menuButton: menuButtonComponent
      appMenuButton: appMenuButtonComponent
      minimizeButton: minimizeButtonComponent
      maximizeButton: maximizeButtonComponent
      keepBelowButton: keepBelowButtonComponent
      keepAboveButton: keepAboveButtonComponent
      helpButton: helpButtonComponent
      shadeButton: shadeButtonComponent
      allDesktopsButton: stickyButtonComponent
      closeButton: closeButtonComponent
      buttons: options.titleButtonsLeft
      anchors {
        top: parent.top
        topMargin: root.pixelWidth * 2.5
        left: parent.left
        leftMargin: root.pixelWidth * 3
      }
    }

    Text {
      id: caption
      textFormat: Text.PlainText
      anchors {
        left: leftButtonGroup.right
        right: rightButtonGroup.left
        leftMargin: root.pixelWidth * 3
        rightMargin: root.pixelWidth * 3
        verticalCenter: parent.verticalCenter
      }
      color: root.colorPurple
      text: decoration.client.caption
      font: options.titleFont
      elide: Text.ElideMiddle
      renderType: Text.NativeRendering
    }

    ButtonGroup {
      id: rightButtonGroup
      spacing: root.pixelWidth * 2
      explicitSpacer: root.buttonSize
      menuButton: menuButtonComponent
      appMenuButton: appMenuButtonComponent
      minimizeButton: minimizeButtonComponent
      maximizeButton: maximizeButtonComponent
      keepBelowButton: keepBelowButtonComponent
      keepAboveButton: keepAboveButtonComponent
      helpButton: helpButtonComponent
      shadeButton: shadeButtonComponent
      allDesktopsButton: stickyButtonComponent
      closeButton: closeButtonComponent
      buttons: options.titleButtonsRight
      anchors {
        top: parent.top
        topMargin: root.pixelWidth * 2.5
        right: parent.right
        rightMargin: root.pixelWidth * 3
      }
    }

    Component.onCompleted: {
      decoration.installTitleItem(this);
    }
  }

  Rectangle {
    id: contentBackground
    color: root.colorWhite
    border.width: root.pixelWidth
    border.color: root.colorPurple
    anchors {
      fill: background
      leftMargin: root.pixelWidth * 3
      rightMargin: root.pixelWidth * 3
      topMargin: root.pixelWidth * 5 + titleRow.height
      bottomMargin: root.pixelWidth * 7
    }
  }

  Component {
    id: maximizeButtonComponent
    PixelButton {
      objectName: "maximizeButton"
      buttonType: DecorationOptions.DecorationButtonMaximizeRestore
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: keepBelowButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonKeepBelow
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: keepAboveButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonKeepAbove
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: helpButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonQuickHelp
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: minimizeButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonMinimize
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: shadeButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonShade
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: stickyButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonOnAllDesktops
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: closeButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonClose
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }
  Component {
    id: menuButtonComponent
    MenuButton {
      width: root.buttonSize
      height: root.buttonSize
    }
  }
  Component {
    id: appMenuButtonComponent
    PixelButton {
      buttonType: DecorationOptions.DecorationButtonApplicationMenu
      size: root.buttonSize
      mainColor: root.colorPurple
    }
  }

  // KWin decoration padding must NOT depend on focus. Previously, disabling
  // inactive shadows changed the padding to zero on blur; the resulting
  // geometry reallocation caused the window frame to jump or draw incorrectly.
  // Reserve enough space for either configured shadow while unmaximized.
  function updatePadding() {
    if (decoration.client.maximized) {
      padding.setBorders(0);
      return;
    }

    const activeExtent = root.shadowEnabled && root.shadowOpacity > 0
      ? Math.max(2, Math.abs(root.shadowOffsetX), Math.abs(root.shadowOffsetY))
      : 0;
    const inactiveExtent = root.inactiveShadowEnabled && root.inactiveShadowOpacity > 0
      ? Math.max(2, Math.abs(root.inactiveShadowOffsetX), Math.abs(root.inactiveShadowOffsetY))
      : 0;
    padding.setBorders(Math.max(activeExtent, inactiveExtent) * root.pixelWidth);
  }

  Connections {
    target: decoration.client
    function onMaximizedChanged() {
      root.updatePadding();
    }
  }

  Connections {
    target: decoration
    function onConfigChanged() {
      root.setupShadows();
      root.setupBorders();
      root.setupColors();
    }
  }

  function setupBorders() {
    let pw = decoration.readConfig("pixelWidth", 15);
    if (pw) root.pixelWidth = pw / 10;

    borders.setBorders(4 * pixelWidth);
    borders.bottom = 8 * pixelWidth;
    borders.setTitle(titleRow.height + 6 * pixelWidth);
    maximizedBorders.setBorders(4 * pixelWidth);
    maximizedBorders.bottom = 8 * pixelWidth;
    maximizedBorders.setTitle(titleRow.height + 6 * pixelWidth);
    extendedBorders.setBorders(4 * pixelWidth);
    extendedBorders.bottom = 8 * pixelWidth;
    extendedBorders.setTitle(titleRow.height + 6 * pixelWidth);

    updatePadding();
  }

  // Converts whatever readConfig() gives us (QColor, "#rrggbb", "r,g,b[,a]")
  // into a valid color, falling back to the default otherwise.
  // An invalid value assigned to a QML color property turns into black.
  function readColor(key, fallback) {
    let v = decoration.readConfig(key, fallback);
    try {
      if (typeof v === "string") {
        let m = v.match(/^\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*(?:,\s*(\d+))?\s*$/);
        if (m) {
          return Qt.rgba(m[1] / 255, m[2] / 255, m[3] / 255, m[4] !== undefined ? m[4] / 255 : 1);
        }
      }
      let c = Qt.color(v);
      if (c.a > 0) return c;
    } catch (e) {}
    return Qt.color(fallback);
  }

  function setupColors() {
    root.colorPurple = readColor("colorPurple", "#4D23CF");
    root.colorCyan = readColor("colorCyan", "#90F4E4");
    root.colorPink = readColor("colorPink", "#F0D1F1");
    root.colorMagenta = readColor("colorMagenta", "#EAA0E8");
    root.colorGray = readColor("colorGray", "#F0ECE0");
  }

  // Keep user settings within the controls' documented ranges. KConfig
  // typically returns a native bool, but handle string forms defensively.
  function setupShadows() {
    const enabled = decoration.readConfig("shadowEnabled", true);
    root.shadowEnabled = enabled === true || enabled === 1 || enabled === "true" || enabled === "1";
    root.shadowOpacity = Math.max(0, Math.min(100, Number(decoration.readConfig("shadowOpacity", 30)) || 0));
    root.shadowOffsetX = Math.max(-16, Math.min(16, Number(decoration.readConfig("shadowOffsetX", 2)) || 0));
    root.shadowOffsetY = Math.max(-16, Math.min(16, Number(decoration.readConfig("shadowOffsetY", 2)) || 0));
    root.shadowColor = readColor("shadowColor", "#4D23CF");

    const inactiveEnabled = decoration.readConfig("inactiveShadowEnabled", true);
    root.inactiveShadowEnabled = inactiveEnabled === true || inactiveEnabled === 1 ||
                                 inactiveEnabled === "true" || inactiveEnabled === "1";
    root.inactiveShadowOpacity = Math.max(0, Math.min(100, Number(decoration.readConfig("inactiveShadowOpacity", 20)) || 0));
    root.inactiveShadowOffsetX = Math.max(-16, Math.min(16, Number(decoration.readConfig("inactiveShadowOffsetX", 2)) || 0));
    root.inactiveShadowOffsetY = Math.max(-16, Math.min(16, Number(decoration.readConfig("inactiveShadowOffsetY", 2)) || 0));
    root.inactiveShadowColor = readColor("inactiveShadowColor", "#6A5C46");
    root.updatePadding();
  }

  Component.onCompleted: {
    setupShadows();
    setupBorders();
    setupColors();
  }
}
