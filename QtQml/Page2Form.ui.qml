import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400

    header: Label {
        text: qsTr("Bouncing Ball")
        font.pixelSize: Qt.application.font.pixelSize * 2
        horizontalAlignment: Text.AlignHCenter
        padding: 10
    }

    Label {
        id: description
        text: qsTr("Playing with easing curves")
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        horizontalAlignment: Text.AlignHCenter
        padding: 10
    }

    BouncingBall {
        anchors {
            top: description.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }
    }
}
