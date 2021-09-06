import QtQuick 2.0

Item {
    implicitWidth: 100 + 2*constants.arrowsWidth
    implicitHeight: 100

    property int levelNumber: 7
    property int level: levelNumber / 2
    property int margin: 5

    Item {
        id: constants
        readonly property string arrowsColor: "lightblue"
        readonly property int arrowsSize: 30
        readonly property int arrowsWidth: 50
        readonly property string barEnabledColor: "lightblue"
        readonly property string barDisabledColor: "white"
    }

    Item {
        id: leftArrow
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
        }
        width: constants.arrowsWidth

        MouseArea {
            anchors.fill: parent
            onClicked: (level > 0) ? level-- : level = 0
        }

        Text {
            anchors.centerIn: parent
            color: constants.arrowsColor
            text: "\u25c0"
            font.pointSize: constants.arrowsSize
        }
    }

    Row {
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: leftArrow.right
            right: rightArrow.left
            leftMargin: margin
            rightMargin: margin
        }
        spacing: margin

        Repeater {
            id: repeater
            model: levelNumber

            Item {
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: (parent.width - margin * (levelNumber - 1)) / levelNumber

                MouseArea {
                    anchors.fill: parent
                    onClicked: level = index
                }

                Rectangle {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    height: (index + 1) * (parent.height / levelNumber)
                    color: (level >= index) ? constants.barEnabledColor : constants.barDisabledColor
                }
            }
        }
    }

    Item {
        id: rightArrow
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }
        width: constants.arrowsWidth

        MouseArea {
            anchors.fill: parent
            onClicked: (level < (levelNumber - 1)) ? level++ : level = levelNumber - 1
        }

        Text {
            anchors.centerIn: parent
            color: constants.arrowsColor
            text: "\u25b6"
            font.pointSize: constants.arrowsSize
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

