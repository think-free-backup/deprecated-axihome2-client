import QtQuick 2.0
import "../Components"

Rectangle {

    id : topBar

    color:"black"

    signal showMenu;
    signal back;

    SwipeArea {

        anchors.fill:parent
        activationAreaX: parent.height/2
        activationAreaY: parent.height/2
        mouseAreaActivated: true

        onRight:{

            topBar.back();
        }
    }

    Image {

        source : "../Images/list.png"
        height: 2* (parent.height/3)
        anchors.verticalCenter: parent.verticalCenter

        MouseArea{
            anchors.fill: parent
            onClicked: topBar.showMenu()
        }
    }

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
