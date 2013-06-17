import QtQuick 2.0
import "../../Components"

Item {

    id: panel3

    property string tab : ""
    property string model : "";
    property bool active : false;

    /* Items definition */

    // Temperature

        property string temperatureItem : ""

    Text {
        id:temperature
        color:"white"
        font.pixelSize: parent.width/8
        font.bold: true
        anchors.right: parent.right
        anchors.rightMargin: 5
        text : JSON.parse(variablesModel.requestSystemVariable(parent.temperatureItem, "").variable).values[0].value + " ºC"
        visible : temperatureItem !== ""
    }

    // humidity

        property string humidityItem : ""

    Text {
        id:humidity
        color:"#09c"
        font.pixelSize: parent.width/20
        font.bold: true
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top:temperature.bottom
        anchors.bottomMargin: 5
        text :  "Humidity : " + JSON.parse(variablesModel.requestSystemVariable(parent.humidityItem, "").variable).values[0].value + " %"
        visible : humidityItem !== ""
    }

    // Wind

    property string windSpeedItem;
    property string windDirItem;

    WindRose{

        radius:parent.width / 3
        anchors.top : parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20

        text : JSON.parse(variablesModel.requestSystemVariable(parent.windSpeedItem, "").variable).values[0].value
        dir : JSON.parse(variablesModel.requestSystemVariable(parent.windDirItem, "").variable).values[0].value

        visible : parent.windSpeedItem !== "" || parent.windDirItem !== ""
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

        var jsonStr = (JSON.parse(panel3.model)).modulesAssociation;

        for (var k in jsonStr){

            var jsPlace = jsonStr[k].place;
            var jsName = jsonStr[k].name;
            var jsModule = jsonStr[k].module;

            if (jsPlace === panel3.tab){

                switch(jsModule.split("-")[1]){

                    case "temperature" :
                        temperatureItem = jsModule;
                        panel3.active = true
                        break;

                    case "humidity":
                        humidityItem = jsModule;
                        panel3.active = true
                        break;

                    case "wind_dir":
                        windDirItem = jsModule;
                        panel3.active = true
                        break;

                    case "wind_speed":
                        windSpeedItem = jsModule;
                        panel3.active = true
                        break;

                }
            }
        }
    }
}
