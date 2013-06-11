import QtQuick 2.0
import "Json"
import "Parts"

Rectangle {

    id : main

    width:640
    height:480
    color: "#111"

    property string places : variablesModel.systemVariable("places", "").variable;
    property string moduleAssociation : variablesModel.systemVariable("modulesAssociation", "").variable;

    Rectangle {

        id : topBar

        anchors.top:parent.top
        anchors.left: parent.left
        width:parent.width
        height: 50

        color:"black"

        Text {
            text : placeView.current
            color: "white"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
            font.pixelSize: parent.height / 2
        }

        Text{

            id : clock

            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 15
            font.pixelSize: parent.height / 2
            text : Qt.formatDateTime(new Date(), "hh:mm")
            color: "white"
            font.bold: true
        }

        Timer {

            interval: 1000;
            running: true;
            repeat: true;
            triggeredOnStart: true

            onTriggered: {
                clock.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
            }
        }
    }

    PlacesView {

        id : placeView

        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width

        places : main.places
        moduleAssociation : main.moduleAssociation

        onCurrentChanged: console.log (current)
    }


    /* Server connection */

    Connections {

        target: network

        onConnectedChanged: { // Login

            if (network.connected)
                network.serverRequest("{ \"type\" : \"session\", \"body\" : {\"function\" : \"tryLogin\", \"param\" : [\"1\", \"1\", \"" + osInfo.platform + "\" ] } }")
        }

        onLoggedChanged: { // Requesting global variables

            if (network.logged){

                network.call("domo","getPlaces", "");
                network.call("domo","getModulesAssociation", "");
            }
        }
    }
}
