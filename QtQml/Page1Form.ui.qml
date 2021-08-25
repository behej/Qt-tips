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
        text: qsTr("You are on Page 1.")
        anchors.top: parent.top
        anchors.topMargin: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.left: parent.left
        anchors.right: parent.right
        padding: 10
    }

    MyBusyIndicator {
        id: myBusyIndicator
        anchors.top: label.bottom
        size: 100
        running: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        anchors.left: parent.left
        anchors.right: parent.right
        spotColor: "steelblue"
        spotSize: 15
        spotCount: 10
    }
}
