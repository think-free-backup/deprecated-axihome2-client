import QtQuick 2.0
import "../../../Components"
import "../../../GenericComponants"
import "../../../Components/Device"

Device{

    id : device

    property int percent : device.json.values[0].level //Math.floor((device.json.values[0].level / 255) * 100) ;

    DeviceState{

        Text{

            id:percentText

            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height / 10
            anchors.right: parent.right
            anchors.rightMargin: parent.width / 20;
            font.pixelSize: parent.height / 5
            color:"#09c"

            text : device.percent;

            visible : device.percent !== 100 && device.percent !== 0
        }


        Image{

            id : bulbOff

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

            opacity : percent / 100
        }



    }

    DeviceControl{

        AndroidButton{

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

                network.call("domo", "callDevice", "\"" + device.json.backend + "\", \"" + device.json.instance + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[0] + "\", \"255\"");
            }
        }

        AndroidButton{

            id : bt_off
            anchors.right: bt_on.left
            anchors.verticalCenter: parent.verticalCenter
            height:parent.height - 2
            width:parent.width / 2

            border.width: 1
            border.color: "#444"

            text: "Off"

            onClicked: {

                network.call("domo", "callDevice", "\"" + device.json.backend + "\", \"" + device.json.instance + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[0] + "\", \"0\"");
            }
        }

//        AndroidButton{
//            id : bt_level
//            anchors.right: bt_off.left
//            anchors.verticalCenter: parent.verticalCenter
//            height:parent.height - 2
//            width:parent.width / 3

//            border.width: 1
//            border.color: "#444"

//            text: "Level"

//            visible:false
//        }
    }
}
