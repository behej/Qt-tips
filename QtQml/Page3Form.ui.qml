import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 600
    height: 400

    header: Label {
        text: qsTr("Bargraph to set level")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    LevelPicker {
        anchors.fill: parent
        anchors.topMargin: 50; anchors.bottomMargin: 50
        margin: 5
        levelNumber: 7
    }
}
