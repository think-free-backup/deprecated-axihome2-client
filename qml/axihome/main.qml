import QtQuick 2.0
import "Json"
import "Parts"
import "Components"
import "GenericComponants"
import "PlacesView"

Rectangle {

    id : main

    color: "#111"

    property string places : variablesModel.systemVariable("places", "").variable;
    property string deviceAssociation : variablesModel.systemVariable("devicesAssociation", "").variable;

    property bool portrait : osInfo.orientationPortrait


    onPlacesChanged: console.log(places)

    PlacesView {

        id : placeView

        anchors.top: topBar.bottom
        anchors.bottom: parent.bottom
        anchors.left: placeList.right
        width: parent.width

        places : main.places
        deviceAssociation : main.deviceAssociation
    }

    SwipeArea {

        anchors.left:parent.left
        anchors.top:parent.top
        height:parent.height
        width:20
        activationAreaX: 10
        activationAreaY: 10
        mouseAreaActivated: placeList.state === "desactivated"

        onRight:{

            if (border){

                (placeList.state === "desactivated") ? placeList.state = "activated" : placeList.state === "desactivated"
            }
        }
    }

    PlaceList {

        id:placeList
        places:main.places

        onSelected: {
            placeView.index = index
            placeList.state = "desactivated"
        }
    }

    TopBar{

        id : topBar

        anchors.top:parent.top
        anchors.left: parent.left
        width:parent.width
        height: 50

        onShowMenu: {

            (placeList.state === "activated") ? placeList.state = "desactivated" : placeList.state = "activated"
        }

        onBack: {

            placeView.back();
        }
    }

    LockScreen {

        id: lock
        anchors.fill: parent
        message : "NOT CONNECTED TO SERVER"
    }


    /* Screen orientation */

    onWidthChanged: {

        orientationCalc();
    }

    onHeightChanged: {

        orientationCalc();
    }

    function orientationCalc(){

        if (width > height)
            osInfo.setOrientationPortrait(false);
        else
            osInfo.setOrientationPortrait(true);
    }


    /* Server connection */

    Connections {

        target: network

        onConnectedChanged: { // Login

            if (network.connected){

                network.serverRequest("{ \"type\" : \"session\", \"body\" : {\"function\" : \"tryLogin\", \"param\" : [\"1\", \"1\", \"" + osInfo.platform + "\" ] } }")
                lock.visible = false;
            }
            else{

                lock.visible = true;
            }
        }

        onLoggedChanged: { // Requesting global variables

            if (network.logged){

                network.call("domo","getPlaces", "");
                network.call("domo","getDevicesAssociation", "");
            }
        }
    }
}
