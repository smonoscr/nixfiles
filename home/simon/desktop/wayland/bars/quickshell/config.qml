import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Qt5Compat.GraphicalEffects

import "./style.qml" as Style
import "./modules" as Modules

Window {
    id: topBar
    visible: true
    width: Screen.width
    height: 32
    x: 0
    y: 0
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    color: "transparent"

    Rectangle {
        id: mainBar
        anchors.fill: parent
        anchors.margins: Style.theme.bar.margin
        radius: Style.theme.bar.radius
        color: Style.theme.bar.background

        RowLayout {
            anchors.fill: parent
            anchors.leftMargin: Style.theme.bar.padding
            anchors.rightMargin: Style.theme.bar.padding
            spacing: Style.theme.bar.spacing

            // Left section
            RowLayout {
                Layout.alignment: Qt.AlignLeft
                spacing: Style.theme.bar.spacing

                Modules.Dashboard {}
                Modules.Workspaces {}
                Modules.Storage {}
                Modules.Ram {}
                Modules.Cpu {}
                Modules.CpuTemp {}
            }

            // Middle section (with stretch)
            RowLayout {
                Layout.alignment: Qt.AlignCenter
                Layout.fillWidth: true
                spacing: Style.theme.bar.spacing

                Modules.Clock {}
                Modules.Media {}
            }

            // Right section
            RowLayout {
                Layout.alignment: Qt.AlignRight
                spacing: Style.theme.bar.spacing

                Modules.Systray {}
                Modules.Microphone {}
                Modules.Volume {}
                Modules.Bluetooth {}
                Modules.Network {}
                Modules.Notifications {}
                Modules.Hypridle {}
                Modules.Power {}
            }
        }
    }

    // Drop shadow effect
    DropShadow {
        anchors.fill: mainBar
        horizontalOffset: 0
        verticalOffset: 2
        radius: 8.0
        samples: 17
        color: "#20000000"
        source: mainBar
    }
}