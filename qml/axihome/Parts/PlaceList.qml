import QtQuick 2.0
import "../Json"
import "../Components"
import "../GenericComponants"

Rectangle {

    id: placeList
    anchors.top: topBar.bottom
    height:parent.height
    width: 400

    state : "desactivated"
    color:"black"

    property string places : ""
    signal selected(int index);

    ListView {

        id: list

        anchors.fill: parent
        anchors.margins: 10
        spacing: 5

        JSONListModel {

            id: jsonModel

            json: placeList.places
            query: "$[*]"
        }

        model: jsonModel.model

        delegate: AndroidButton{

            text: model.name

            onClicked : {
                placeList.selected(index);
            }
        }
    }

    MouseArea{

        id:mouseArea
        anchors.left:parent.right
        anchors.top:parent.top
        height:parent.height
        width:parent.parent.width
        z:parent.z - 1
        visible: false
        onClicked: {
            parent.state = "desactivated"
        }
    }

    states: [
        State {

             name: "activated"
             AnchorChanges { target: placeList; anchors.right: undefined; anchors.left: parent.left; }
             PropertyChanges { target: mouseArea; visible: true}
        },
        State {

             name: "desactivated"
             AnchorChanges { target: placeList; anchors.right: parent.left; anchors.left: undefined; }
             PropertyChanges { target: mouseArea; visible: false}
        }
    ]

    transitions: Transition {

             AnchorAnimation { duration: 250 }
    }
}
