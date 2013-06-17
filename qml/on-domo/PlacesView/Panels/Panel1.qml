import QtQuick 2.0
import "../../Json"

Item {

    id:panel1

    property string tab : ""
    property string model : ""
    property bool active : false;

    signal showPanel2(string item);

    JSONListModel {

        id: jsonModel

        json: panel1.model
        query: "$.[?(@.place=='" + panel1.tab + "')]"

    }

    ListView {

        id: list

        anchors.fill: parent
        spacing: 5

        model: jsonModel.model

        delegate: Loader{

            source : "Panel1Items/" + model.module.split("-")[1] + ".qml"
            onLoaded:  {
                panel1.active = true;
            }
        }
    }
}
