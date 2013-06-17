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

        onShowPanel2: {

            console.log("Show panel 2 requested")
        }
    }

    function showPanel(){

        if (layout.item.state === "2panels")
            layout.item.state = "3panels"
        else
            layout.item.state = "2panels"
    }

    function back(){

        console.log("Back pressed");
    }
}
