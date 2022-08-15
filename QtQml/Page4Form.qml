import QtQuick 2.12
import QtQuick.Controls 2.5


Page {
    id: page
    width: 600
    height: 400
    focus: true


    header: Label {
        text: qsTr("ListView")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    MyListView {
        anchors.fill: parent
    }
}
