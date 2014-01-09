import QtQuick 2.0

import "../Json"
import "Layout"

Item {

    id : view
    width: 100
    height: 62

    property string current : list.currentItem.text;

    property string places : "";
    property string deviceAssociation : ""
    property alias index : list.currentIndex;


    ListView {

        id: list

        anchors.fill: parent
        orientation : ListView.Horizontal
        snapMode: ListView.SnapOneItem
        boundsBehavior:Flickable.StopAtBounds
        spacing: 5
        highlightRangeMode: ListView.StrictlyEnforceRange
        highlightMoveDuration: 10

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

            deviceAssociation: view.deviceAssociation
        }
    }

    Connections { // Back / Home Android

        target: viewer

        onBackKeyPressed: {

            list.currentItem.back();
        }

        onMenuKeyPressed: {

        }
    }

    function back(){

        list.currentItem.back();
    }
}
