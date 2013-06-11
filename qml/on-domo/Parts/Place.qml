import QtQuick 2.0
import QtMultimedia 5.0

import "../Json"

Item {

    id : place
    property string text : ""
    property string moduleAssociation : ""

    Rectangle{

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        color: "#222"

        ListView {

            id: list3

            anchors.fill: parent

            JSONListModel {
                id: jsonModel
                json: place.moduleAssociation

                query: "$.[?(@.place=='" + place.text + "')]"
            }

            model: jsonModel.model

            delegate: Component {

                Text {
                    width: parent.width
                    horizontalAlignment: Text.AlignLeft
                    font.pixelSize: 14
                    color: "white"
                    text: model.name + " (" + model.module + ")"
                }
            }
        }

//        Video {
//                id: video
//                anchors.fill: parent
//                source: "rtsp://media-us-2.soundreach.net/slcn_lifestyle.sdp"

//                Component.onCompleted: play();
//        }
    }
}
