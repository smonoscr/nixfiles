pragma Singleton
import QtQuick

QtObject {
    readonly property var theme: QtObject {
        readonly property var colors: QtObject {
            readonly property color white: "#eeeeee"
            readonly property color black: "#171717"
            readonly property color black2: "#1e1e1e"
            readonly property color grey: "#282828"
            readonly property color lightgrey: "#999999"
            readonly property color springgreen: "#33d17a"
            readonly property color red: "#ed333b"
            readonly property color red2: "#c01c28"
            readonly property color blue: "#3584e4"
            readonly property color yellow: "#e5a50a"
            readonly property color orange: "#ff7800"
            readonly property color purple: "#9141ac"
        }

        readonly property var bar: QtObject {
            readonly property int height: 32
            readonly property int margin: 4
            readonly property int padding: 8
            readonly property int spacing: 6
            readonly property int radius: 10
            readonly property color background: colors.black
            readonly property real opacity: 1.0
        }

        readonly property var font: QtObject {
            readonly property string family: "Inter Display"
            readonly property int size: 13
            readonly property int weight: Font.Medium
        }

        readonly property var module: QtObject {
            readonly property color background: colors.black
            readonly property color icon: colors.white
            readonly property color text: colors.white
            readonly property int spacing: 4
            readonly property int radius: 6
        }

        readonly property var button: QtObject {
            readonly property color hover: Qt.darker(colors.springgreen, 1.1)
            readonly property color pressed: Qt.darker(colors.springgreen, 1.2)
            readonly property color active: colors.springgreen
            readonly property color inactive: colors.lightgrey
            readonly property int radius: 6
        }

        readonly property var menu: QtObject {
            readonly property color background: colors.black
            readonly property color border: colors.grey
            readonly property int borderWidth: 1
            readonly property int radius: 8
            readonly property int padding: 8
            readonly property int spacing: 4
        }
    }
}