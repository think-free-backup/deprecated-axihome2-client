import QtQuick 2.0
import "../../../Components"
import "../../../Components/Device"

Device{

    id : device

    DeviceState{

        Image{

            anchors.right: parent.right
            anchors.rightMargin: parent.width / 10
            anchors.verticalCenter: parent.verticalCenter
            height: 2* (parent.height/3)
            width: 2* (parent.height/3)

            source : "../../../Images/bulb-off.png"
        }

        Image{

            anchors.right: parent.right
            anchors.rightMargin: parent.width / 10
            anchors.verticalCenter: parent.verticalCenter
            height: 2* (parent.height/3)
            width: 2* (parent.height/3)

            source : "../../../Images/bulb-on.png"

            opacity : (device.json.values[0].state / 255)
        }
    }

    DeviceControl{

        Button{

            id : bt_on
            anchors.right: parent.right
            anchors.rightMargin: 1
            anchors.verticalCenter: parent.verticalCenter
            height:parent.height - 2
            width:parent.width / 2
            border.width: 1
            border.color: "#444"

            text: "On"

            onClicked: {

                network.call("domo", "callModule", "\"" + device.json.processor + "\", \"" + device.json.pooler + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[0] + "\", \"255\"");
            }
        }

        Button{

            id : bt_off
            anchors.right: bt_on.left
            anchors.verticalCenter: parent.verticalCenter
            height:parent.height - 2
            width:parent.width / 2
            border.width: 1
            border.color: "#444"

            text: "Off"

            onClicked: {

                network.call("domo", "callModule", "\"" + device.json.processor + "\", \"" + device.json.pooler + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[0] + "\", \"0\"");
            }
        }
    }
}

