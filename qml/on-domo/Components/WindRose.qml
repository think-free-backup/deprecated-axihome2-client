import QtQuick 2.0

Item{

    property string text : "0"
    property int  rotation: 0

    property string dir : ""
    onDirChanged: {
        switch (dir){
            case "N":
                rotation = 0
                break;
            case "NNE":
                rotation = 22.5
                break;
            case "NE":
                rotation = 45
                break;
            case "ENE":
                rotation = 67.5
                break;
            case "E":
                rotation = 90
                break;
            case "ESE":
                rotation = 112.5
                break;
            case "SE":
                rotation = 135
                break;
            case "SSE":
                rotation = 157.5
                break;
            case "S":
                rotation = 180
                break;
            case "SSW":
                rotation = 205.5
                break;
            case "SW":
                rotation = 225
                break;
            case "WSW":
                rotation = 247.5
                break;
            case "W":
                rotation = 270
                break;
            case "WNW":
                rotation = 292.5
                break;
            case "NW":
                rotation = 315
                break;
            case "NNW":
                rotation = 337.5
                break;
        }
    }

    property color circle : "#444"
    property color internal : "#222"
    property color direction : "#09c"
    property color speed : "white"

    width: 200
    height:width

    Rectangle {

        id : mainCircle

        width: parent.width
        height: parent.width
        color: parent.circle
        radius: width*0.5
        smooth:true
        rotation: parent.rotation

        Rectangle{

            width: 8* (parent.width / 10)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            height: width
            color: parent.parent.internal
            radius: width*0.5
            smooth:true
        }

        Rectangle{

            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width / 10
            height:width
            radius: width*0.5
            smooth:true
            color: parent.parent.direction
        }
    }

    Text{
        anchors.bottom: speedText.top
        anchors.horizontalCenter: mainCircle.horizontalCenter
        font.pixelSize: mainCircle.width / 15
        color: parent.speed
        text: "Wind"
    }

    Text{

        id : speedText
        anchors.horizontalCenter: mainCircle.horizontalCenter
        anchors.verticalCenter: mainCircle.verticalCenter
        color: parent.speed
        font.pixelSize: mainCircle.width / 3
        font.bold: true
        text : parent.text
    }

    Text{
        anchors.top: speedText.bottom
        anchors.horizontalCenter: mainCircle.horizontalCenter
        font.pixelSize: mainCircle.width / 15
        color: parent.speed
        text: if (parent.dir === "") "km/h"; else parent.dir;
    }
}
