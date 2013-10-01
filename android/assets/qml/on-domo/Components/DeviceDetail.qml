import QtQuick 2.0

Item{

    id : device

    property string source : ""
    property var json : JSON.parse(variablesModel.requestSystemVariable(source, "").variable)

    property string name : ""

}
