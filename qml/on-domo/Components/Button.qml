import QtQuick 2.0

Rectangle{

    id: button

    property string text : ""
    signal clicked;

    width: parent.width
    height:45
    color:"#222"

    Text {
        anchors.centerIn: parent
        font.pixelSize: 25
        color: "white"
        text: parent.text
    }

    MouseArea{
        anchors.fill: parent
        onPressed: {

            button.state = "pressed"
        }
        onReleased:  {

            button.state = "released"
        }
        onClicked: {
            button.clicked();
        }
    }

    states: [
        State {

             name: "released"
             PropertyChanges { target: button; color : "#222"}
        },
        State {

             name: "pressed"
             PropertyChanges { target: button; color: "#09c"}
        }
    ]

    transitions: Transition {

        ColorAnimation { duration: 100 }
    }
}
