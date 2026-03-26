pragma Singleton
import QtQuick
import Quickshell.Io
import Qt.labs.platform

QtObject {
    id: root
    property bool loaded: false

    property color background: "#B2111718"
    property color background90: "#E6111718"
    property color border: "#D99E60"
    property color accent: "#B27A8364"
    property color text: "#edd1bf"

    function parseColorVar(name, fallback) {
        let data = String(colorFile.text());
        let regex = new RegExp("\\\\$" + name + "\\\\s*=\\\\s*rgb\\\\(([0-9a-fA-F]{6,8})\\\\)");
        let match = data.match(regex);
        if (!match || match.length < 2)
            return fallback;
        return "#" + match[1].slice(0, 6);
    }

    function updateFromDmsColors() {
        let surface = parseColorVar("surface", background);
        let onSurface = parseColorVar("onSurface", text);
        let primary = parseColorVar("primary", border);
        let outline = parseColorVar("outline", primary);

        root.background = "#B2" + surface.replace("#", "");
        root.background90 = "#E6" + surface.replace("#", "");
        root.border = primary;
        root.accent = "#B2" + outline.replace("#", "");
        root.text = onSurface;
        root.loaded = true;
    }

    Behavior on background {
        ColorAnimation {
            duration: root.loaded ? 800 : 0
            easing.type: Easing.BezierSpline
            easing.bezierCurve: [0.22, 1, 0.36, 1, 1, 1]
        }
    }
    Behavior on background90 {
        ColorAnimation {
            duration: root.loaded ? 800 : 0
            easing.type: Easing.BezierSpline
            easing.bezierCurve: [0.22, 1, 0.36, 1, 1, 1]
        }
    }
    Behavior on border {
        ColorAnimation {
            duration: root.loaded ? 800 : 0
            easing.type: Easing.BezierSpline
            easing.bezierCurve: [0.22, 1, 0.36, 1, 1, 1]
        }
    }
    Behavior on accent {
        ColorAnimation {
            duration: root.loaded ? 800 : 0
            easing.type: Easing.BezierSpline
            easing.bezierCurve: [0.22, 1, 0.36, 1, 1, 1]
        }
    }
    Behavior on text {
        ColorAnimation {
            duration: root.loaded ? 800 : 0
            easing.type: Easing.BezierSpline
            easing.bezierCurve: [0.22, 1, 0.36, 1, 1, 1]
        }
    }

    property string dmsColorsPath: String(StandardPaths.writableLocation(StandardPaths.HomeLocation)).replace(/^file:\/\//, "") + "/.config/hypr/dms/colors.conf"

    property var _watcher: FileView {
        id: colorFile
        path: root.dmsColorsPath
        blockLoading: true
        onLoaded: {
            try {
                root.updateFromDmsColors();
            } catch (e) {}
        }
    }

    property var _timer: Timer {
        interval: 2000
        repeat: true
        running: true
        onTriggered: colorFile.reload()
        Component.onCompleted: colorFile.reload()
    }
}
