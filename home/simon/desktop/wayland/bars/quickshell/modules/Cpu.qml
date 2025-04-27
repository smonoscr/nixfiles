import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../style.qml" as Style

Item {
    id: cpuModule
    implicitWidth: row.implicitWidth
    implicitHeight: parent.height

    property int usage: 0
    property int updateInterval: 2000

    Timer {
        interval: updateInterval
        running: true
        repeat: true
        onTriggered: {
            // In a real implementation, this would read from /proc/stat
            // For demo purposes, using a random value
            usage = Math.random() * 100
        }
    }

    RowLayout {
        id: row
        spacing: Style.theme.module.spacing
        anchors.centerIn: parent

        // CPU Icon
        Text {
            text: ""  // Using your existing CPU icon
            font.family: "Font Awesome 6 Free"
            font.pixelSize: Style.theme.font.size
            color: Style.theme.colors.orange
        }

        // CPU Usage Text
        Text {
            text: Math.round(usage) + "%"
            font.family: Style.theme.font.family
            font.pixelSize: Style.theme.font.size
            font.weight: Style.theme.font.weight
            color: Style.theme.module.text
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        
        // Tooltip component
        ToolTip {
            visible: parent.containsMouse
            delay: 500
            text: "CPU Usage: " + Math.round(usage) + "%"
            font.family: Style.theme.font.family
            
            background: Rectangle {
                color: Style.theme.colors.black2
                border.color: Style.theme.colors.grey
                radius: Style.theme.menu.radius
            }
        }
    }
}