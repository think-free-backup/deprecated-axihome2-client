import QtQuick 2.0

import "../Json"

Item {

    id : view
    width: 100
    height: 62

    property string current : "" //list.currentItem.text;

    property string places : "";
    property string moduleAssociation : ""


    ListView {

        id: list

        anchors.fill: parent
        orientation : ListView.Horizontal
        snapMode: ListView.SnapOneItem
        spacing: 5
        highlightRangeMode: ListView.StrictlyEnforceRange

        JSONListModel {

            id: jsonModel

            json: view.places
            query: "$[*]"

        }

        model: jsonModel.model

        delegate: Place{

            text : model.name
            width: view.width
            height: view.height

            moduleAssociation: view.moduleAssociation
        }
    }
}
