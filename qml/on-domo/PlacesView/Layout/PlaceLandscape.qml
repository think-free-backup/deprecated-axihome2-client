import QtQuick 2.0
import "../Panels"

Item{

    id:layout

    anchors.fill: parent

    state: "master"

    property Panel1 p1 : panel1;
    property Panel2 p2 : panel2;
    property Panel3 p3 : panel3;

    Rectangle {

        id: panel1Rec

        anchors.top:parent.top
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        height:parent.height - 20

        color:"#222"

        Panel1{

            id:panel1
            anchors.fill: parent
        }

        visible : panel1.active
    }

    Rectangle{

        id: panel2Rec

        anchors.top:parent.top
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.left: panel1Rec.right
        anchors.leftMargin: - panel1.width / 2
        height:parent.height
        width: 1.5*panel1Rec.width + 20
        border.color:"#111"
        border.width: 10

        color:"#222"

        Panel2{

            id:panel2
            anchors.fill: parent
            anchors.margins: 10
        }
    }

    Rectangle {

        id: panel3Rec

        anchors.top:parent.top
        anchors.topMargin: 10
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        height:parent.height - 20
        width: if (panel1.active){

                   (parent.width / 3) - 20
               }
               else{

                   parent.width - 20
               }

        color:"#222"

        Panel3{

            id:panel3
            anchors.fill: parent
        }

        visible : panel3.active
    }

    states: [
        State {

             name: "master"
             PropertyChanges{ target: panel1Rec; width: if (panel3.active){

                                                             2* (parent.width / 3) - 10
                                                        }
                                                        else{

                                                            parent.width - 20
                                                        }
             }
             PropertyChanges { target: panel2Rec; opacity: 0.0}
        },
        State {

             name: "detail"
             PropertyChanges { target: panel1Rec; width: if(panel3.active){

                                                             (parent.width / 3) - 10
                                                         }
                                                         else{

                                                             parent.width / 2 - 15
                                                         }

             }
             PropertyChanges { target: panel2Rec; opacity: 1.0}
        }
    ]

    transitions: Transition {

        NumberAnimation { target: panel1Rec; property: "width"; duration: 200; easing.type: Easing.InOutQuad }
        NumberAnimation { target: panel2Rec; property: "opacity"; duration: 200; easing.type: Easing.InOutQuad }
    }
}


