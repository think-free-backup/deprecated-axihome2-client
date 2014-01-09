import QtQuick 2.0

Rectangle{

    id : device

    property string source : ""
    property var json : JSON.parse(variablesModel.requestSystemVariable(source, "").variable)

    property string name : ""

    property int listHeight : 0
    property int listWidth : 0

    signal showDetail();

    height: listHeight / 10
    width : listWidth

    color:"#444"

    Text {

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: parent.width / 30
        text : parent.name
        color:"white"
    }

    MouseArea{

        anchors.fill: parent
        onClicked: {

            showDetail();
        }
    }
}
