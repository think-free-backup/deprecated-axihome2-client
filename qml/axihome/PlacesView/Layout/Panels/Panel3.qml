import QtQuick 2.0
import "../../../Components"

/* Panel 3 is the weather and scenaries panel */

Item {

    id: panel3

    property string tab : ""
    property string model : "";
    property bool active : false;

    /* Items definition */

    // Wind

    property string windSpeedItem;
    property string windDirItem;

    WindRose{

        id:wind
        width:parent.width / 2 - 40
        anchors.top : parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20

        text : JSON.parse(variablesModel.requestSystemVariable(parent.windSpeedItem, "").variable).values[0]
        dir : JSON.parse(variablesModel.requestSystemVariable(parent.windDirItem, "").variable).values[0]

        visible : parent.windSpeedItem !== "" || parent.windDirItem !== ""
    }

    // Temperature

        property string temperatureItem : ""

    Text {
        id:temperature
        color:"white"
        font.pixelSize: parent.width/8
        font.bold: true
        anchors.left: parent.left
        anchors.leftMargin: if (wind.visible) parent.width / 2 + width / 10; else parent.width / 2;
        anchors.top: parent.top
        anchors.topMargin: 20
        text : JSON.parse(variablesModel.requestSystemVariable(parent.temperatureItem, "").variable).values[0] + " ºC"
        visible : temperatureItem !== ""
    }

    // humidity

        property string humidityItem : ""

    IconTextUnit{

        id:humidity
        anchors.left: temperature.left
        anchors.leftMargin: temperature.width / 4
        anchors.top: temperature.bottom
        anchors.topMargin: 10

        iconPath: "../Images/"
        icon:"humidity"

        textFontSize: parent.width/20
        value: JSON.parse(variablesModel.requestSystemVariable(parent.humidityItem, "").variable).values[0]

        unitFontSize: if (parent.width/40 > 15) parent.width/40; else textFontSize;
        unit : "%"

        visible: humidityItem !== ""
    }

    // Pressure

    property string pressureItem;

    IconTextUnit{

        id:pressure
        anchors.left: temperature.left
        anchors.leftMargin: temperature.width / 4
        anchors.top: humidity.bottom
        anchors.topMargin: 10

        iconPath: "../Images/"
        icon:"pressure"

        textFontSize: parent.width/20
        value: JSON.parse(variablesModel.requestSystemVariable(parent.pressureItem, "").variable).values[0]

        unitFontSize: if (parent.width/40 > 15) parent.width/40; else textFontSize;
        unit : "hpa"

        visible: rainDayItem !== ""
    }

    // Rain

    property string rainDayItem;

    IconTextUnit{

        id:rainDay
        anchors.left: temperature.left
        anchors.leftMargin: temperature.width / 4
        anchors.top: pressure.bottom
        anchors.topMargin: 10

        iconPath: "../Images/"
        icon:"rain"

        textFontSize: parent.width/20
        value: JSON.parse(variablesModel.requestSystemVariable(parent.rainDayItem, "").variable).values[0]

        unitFontSize: if (parent.width/40 > 15) parent.width/40; else textFontSize;
        unit : "mm"

        visible: rainDayItem !== ""
    }

    // Day

    property string dayItem;

    IconTextUnit{

        id:day
        anchors.left: wind.right
        anchors.bottom: wind.bottom

        iconPath: "../Images/"
        icon:"day"

        textFontSize: parent.width/30
        value: JSON.parse(variablesModel.requestSystemVariable(parent.dayItem, "").variable).values[0]

        unitFontSize: 0
        unit : ""

        visible: dayItem !== ""
    }

    // Night

    property string nightItem;

    IconTextUnit{

        id:night
        anchors.left: wind.right
        anchors.leftMargin: day.width + day.width / 2
        anchors.bottom: wind.bottom

        iconPath: "../Images/"
        icon:"night"

        textFontSize: parent.width/30
        value: JSON.parse(variablesModel.requestSystemVariable(parent.nightItem, "").variable).values[0]

        unitFontSize: 0
        unit : ""

        visible: nightItem !== ""
    }


    /* Parsing model */

    onModelChanged: {

        if (tab !== ""){
            parse();
        }
    }

    onTabChanged: {

        if (model !== ""){
            parse();
        }
    }

    function parse(){

        var jsonStr = (JSON.parse(panel3.model)).devicesAssociation;

        for (var k in jsonStr){

            var jsPlace = jsonStr[k].place;
            var jsName = jsonStr[k].name;
            var jsDevice = jsonStr[k].device;

            if (jsPlace === panel3.tab){

                switch(jsDevice.split("-")[1]){

                    case "temperature" :
                        temperatureItem = jsDevice;
                        panel3.active = true;
                        break;

                    case "humidity":
                        humidityItem = jsDevice;
                        panel3.active = true;
                        break;

                    case "wind_dir":
                        windDirItem = jsDevice;
                        panel3.active = true;
                        break;

                    case "wind_speed":
                        windSpeedItem = jsDevice;
                        panel3.active = true;
                        break;

                    case "rain_day":
                        rainDayItem = jsDevice;
                        panel3.active = true;
                        break;

                    case "pressure":
                        pressureItem = jsDevice;
                        panel3.active = true;
                        break;

                    case "sunrise":
                        dayItem = jsDevice;
                        panel3.active = true;
                        break;

                    case "sunset" :
                        nightItem = jsDevice;
                        panel3.active = true;
                        break;
                }
            }
        }
    }
}
