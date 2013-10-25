import QtQuick 2.0
import "../../Json"

/* Panel 1 is the main list of items */

Item {

    id:panel1

    property string tab : ""
    property string model : ""
    property bool active : false;

    signal showDetail(string name, string source);

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

                item.source = model.module
                item.name = model.name

                item.listHeight = list.height
                item.listWidth = list.width
            }


            Connections {
                target: item
                onShowDetail: panel1.showDetail(model.name, item.source)
            }
        }
    }
}
