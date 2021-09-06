import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("Page 1")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Label {
        id: label
        text: qsTr("Custom BusyIndicator.\nCustom geometry + using custom animation")
        anchors {
            top: parent.top; topMargin: 20
            left: parent.left; right: parent.right
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        padding: 10
    }

    MyBusyIndicator {
        id: myBusyIndicator
        anchors.top: label.bottom
        size: 100
        running: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
//        anchors.left: parent.left
//        anchors.right: parent.right
        spotColor: "steelblue"
        spotSize: 15
        spotCount: 10
    }
}
