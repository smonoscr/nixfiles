import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import "../style.qml" as Style

Item {
    id: volumeModule
    implicitWidth: row.implicitWidth
    implicitHeight: parent.height

    property int volume: 50
    property bool muted: false

    RowLayout {
        id: row
        spacing: Style.theme.module.spacing
        anchors.centerIn: parent

        // Volume Icon
        Text {
            text: muted ? "󰝟" : volume <= 0 ? "󰖁" : volume <= 30 ? "󰕿" : volume <= 60 ? "󰖀" : "󰕾"
            font.family: "Font Awesome 6 Free"
            font.pixelSize: Style.theme.font.size
            color: Style.theme.module.icon

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    muted = !muted
                    if (muted) {
                        volumeModule.execCommand("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
                    }
                }
            }
        }

        // Volume Text
        Text {
            visible: true // Based on your hyprpanel config where label is true
            text: muted ? "Muted" : volume + "%"
            font.family: Style.theme.font.family
            font.pixelSize: Style.theme.font.size
            font.weight: Style.theme.font.weight
            color: Style.theme.module.text
        }
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton | Qt.MiddleButton
        onClicked: (mouse) => {
            if (mouse.button === Qt.RightButton) {
                volumeModule.execCommand("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
            } else if (mouse.button === Qt.MiddleButton) {
                volumeModule.execCommand("pwvucontrol")
            }
        }
        onWheel: (wheel) => {
            if (wheel.angleDelta.y > 0) {
                volumeModule.execCommand("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- --limit 0.0")
                volume = Math.max(0, volume - 5)
            } else {
                volumeModule.execCommand("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.0")
                volume = Math.min(100, volume + 5)
            }
        }
    }

    // Function to execute shell commands
    function execCommand(command) {
        const process = Qt.createQmlObject('import QtQuick; QtObject { 
            function exec(cmd) { 
                const proc = new Process();
                proc.start(cmd);
            }
        }', volumeModule, 'DynamicProcess');
        process.exec(command);
    }

    // Popup menu for volume control
    Popup {
        id: volumePopup
        width: 280
        height: 400
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside

        background: Rectangle {
            color: Style.theme.menu.background
            border.color: Style.theme.menu.border
            border.width: Style.theme.menu.borderWidth
            radius: Style.theme.menu.radius
        }

        // Volume slider and additional controls would go here
        // This is a simplified version
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Style.theme.menu.padding
            spacing: Style.theme.menu.spacing

            Slider {
                Layout.fillWidth: true
                from: 0
                to: 100
                value: volumeModule.volume
                onValueChanged: {
                    volumeModule.volume = value
                    volumeModule.execCommand(`wpctl set-volume @DEFAULT_AUDIO_SINK@ ${value}% --limit 1.0`)
                }

                background: Rectangle {
                    x: parent.leftPadding
                    y: parent.topPadding + parent.availableHeight / 2 - height / 2
                    width: parent.availableWidth
                    height: 4
                    radius: 2
                    color: Style.theme.colors.lightgrey

                    Rectangle {
                        width: parent.width * parent.parent.value / parent.parent.to
                        height: parent.height
                        color: Style.theme.colors.springgreen
                        radius: 2
                    }
                }

                handle: Rectangle {
                    x: parent.leftPadding + parent.visualPosition * (parent.availableWidth - width)
                    y: parent.topPadding + parent.availableHeight / 2 - height / 2
                    width: 16
                    height: 16
                    radius: 8
                    color: parent.pressed ? Style.theme.button.pressed : parent.hovered ? Style.theme.button.hover : Style.theme.button.active
                }
            }
        }
    }
}