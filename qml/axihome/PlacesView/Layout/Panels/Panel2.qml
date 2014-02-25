import QtQuick 2.0
import "../../../Components"
import "../../../GenericComponants"

/* Panel 2 is the detailled list of items */

Item {

    id: panel2

    property string tab : "";
    property string model;

    property string itemName;
    property var source;

    property var json : JSON.parse(variablesModel.requestSystemVariable(source, "").variable)

    signal hide();

    MouseArea{
        anchors.fill: panel2
        onPressed: {}
        enabled : panel2.visible
    }

    Text{

        anchors.left: parent.left
        anchors.leftMargin: parent.width / 20
        anchors.verticalCenter: backBt.verticalCenter
        width:parent.width / 3

        color: "white"
        text : panel2.itemName
    }

    AndroidButton{

        id : backBt

        anchors.right: parent.right
        anchors.top: parent.top
        height: parent.height / 20
        width:height

        border.width: 1
        border.color: "#222"

        text: "X"

        onClicked: panel2.hide()
    }

    Rectangle{

        id: separation

        anchors.left: parent.left
        anchors.top:backBt.bottom
        height:2
        width:parent.width
        color: "#444"
    }

    Loader{

        source : "Panel2Items/" + panel2.json.type + ".qml"

        anchors.top: separation.bottom
        anchors.left: parent.left
        width:parent.width
        height: parent.height - (backBt.height + 2)

        onLoaded:  {

            item.source = panel2.source
            item.name = panel2.itemName
        }
    }
}
