import QtQuick 2.0
import "../../../Components"

Item {

    Slider{

        width:parent.height - parent.height / 20

        transform: Rotation { origin.x: 0; origin.y: 0; angle: 270}
        x: parent.width  - height * 10 - parent.width / 40
        y: parent.height - (parent.height / 40)

        minimum : 0
        maximum: 255
        onValueChanged: {

            console.log(value)
        }
    }
}
