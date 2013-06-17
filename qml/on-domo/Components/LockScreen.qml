import QtQuick 2.0

Rectangle{

    id: lock

    opacity:0.8
    color:"black"

    property string message : ""

    Text {

        anchors.centerIn: parent
        text : parent.message
        font.bold: true
        color:"white"
    }
}
