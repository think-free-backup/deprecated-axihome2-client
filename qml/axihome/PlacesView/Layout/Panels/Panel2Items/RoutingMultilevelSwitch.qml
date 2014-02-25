import QtQuick 2.0
import "../../../../Components"
import "../../../../GenericComponants"

DeviceDetail {

    id : device

    AndroidSlider{

        width:parent.height - parent.height / 20

        transform: Rotation { origin.x: 0; origin.y: 0; angle: 270}
        x: parent.width  - height * 10 - parent.width / 40
        y: parent.height - (parent.height / 40)

        minimum : 0
        maximum: 100

        //remoteValue: device.json.values[0].level

        onValueChanged: {

            console.log(value)
        }
        onValueSet: {
            console.log("Value changed : " + value)
            network.call("domo", "callDevice", "\"" + device.json.backend + "\", \"" + device.json.instance + "\", \"" + device.json.type + "\", \"" + device.json.deviceId + "\", \"" + device.json.actuators[0] + "\", \"" + value + "\"");
        }
    }
}
