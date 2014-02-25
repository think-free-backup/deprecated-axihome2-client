import QtQuick 2.0
import "../../../../Components"
import "../../../../GenericComponants"
import "../../../../Components/Device"

Device{

    id : device

    property string state : device.json.values[0].state

    DeviceState{

        Image{

            anchors.right: parent.right
            anchors.rightMargin: parent.width / 10
            anchors.verticalCenter: parent.verticalCenter
            height: 2* (parent.height/3)
            fillMode: Image.PreserveAspectFit

            source : "../../../../Images/note.png"
        }
    }

    DeviceControl{

        AndroidButton{

            id : bt_next
            anchors.right: parent.right
            anchors.rightMargin: 1
            anchors.verticalCenter: parent.verticalCenter
            height:parent.height - 2
            width:parent.width / 3

            border.width: 1
            border.color: "#444"

            text: ">>"

            onClicked: {

                network.call("domo", "callDevice", "\"" + device.json.backend + "\", \"" + device.json.instance + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[3] + "\", \"0\"");
            }
        }

        AndroidButton{

            id : bt_play
            anchors.right: bt_next.left
            anchors.verticalCenter: parent.verticalCenter
            height:parent.height - 2
            width:parent.width / 3

            border.width: 1
            border.color: "#444"

            text: (device.state === "play") ? "Stop" : "Play"

            onClicked: {

                network.call("domo", "callDevice", "\"" + device.json.backend + "\", \"" + device.json.instance + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[(device.state === "play") ? 1 : 0] + "\", \"0\"");
            }
        }

        AndroidButton{

            id : bt_previous
            anchors.right: bt_play.left
            anchors.verticalCenter: parent.verticalCenter
            height:parent.height - 2
            width:parent.width / 3

            border.width: 1
            border.color: "#444"

            text: "<<"

            onClicked: {

                network.call("domo", "callDevice", "\"" + device.json.backend + "\", \"" + device.json.instance + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[2] + "\", \"0\"");
            }
        }
    }
}
