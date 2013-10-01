import QtQuick 2.0

Item {

    property string iconPath : ""
    property string icon : ""

    property int textFontSize : 10
    property color valueTextColor : "#09c"
    property string value : ""

    property int unitFontSize : 10
    property color unitTextColor : "#09c"
    property string unit : ""

    height: image.height
    width: image.width + valueText.width + valueUnit.width

    Image{

        id : image

        anchors.verticalCenter: valueText.verticalCenter
        anchors.left: parent.left
        source : if (height >= 30) parent.iconPath + parent.icon + ".png"; else parent.iconPath + parent.icon + "-small.png";
        height: valueText.height
        width: valueText.height
        smooth:true
        onSourceChanged: console.log(source)
    }

    Text {
        id:valueText
        color: parent.valueTextColor
        font.pixelSize: parent.textFontSize
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: image.width + image.width / 3
        anchors.top: parent.top
        text :  parent.value
    }

    Text {
        id:valueUnit
        color: parent.unitTextColor
        font.pixelSize: parent.unitFontSize
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: image.width + 2 * (image.width / 3) + valueText.width
        anchors.verticalCenter: valueText.verticalCenter
        text :  parent.unit
    }

}
