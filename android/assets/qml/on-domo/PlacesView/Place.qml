import QtQuick 2.0

import "../Json"
import "Panels"

Item {

    id : place

    property string text : ""
    property string moduleAssociation : ""

    Item{

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        Loader{

            id:layout
            source: if (osInfo.orientationPortrait)
                        layout.source = "Layout/PlacePortrait.qml";
                    else
                        layout.source = "Layout/PlaceLandscape.qml";

            anchors.fill: parent

            onLoaded: {

                layout.item.p1.model = place.moduleAssociation;
                layout.item.p2.model = place.moduleAssociation;
                layout.item.p3.model = place.moduleAssociation;
                layout.item.p1.tab = place.text;
                layout.item.p2.tab = place.text;
                layout.item.p3.tab = place.text;
                connection.target = layout.item.p1;
            }
        }
    }

    Connections {

        id:connection

        onShowDetail: {

            layout.item.p2.itemName = name;
            layout.item.p2.source = source;
            layout.item.state = "detail"
        }
    }

    Connections {

        id:connection2
        target: layout.item.p2

        onHide:{

            layout.item.state = "master"
        }
    }

    function back(){

        layout.item.state = "master"
    }
}
