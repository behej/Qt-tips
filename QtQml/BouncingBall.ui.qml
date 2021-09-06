import QtQuick 2.0

Item {
    implicitWidth: 600; implicitHeight: 400
    property int ballDiameter: 50

    Rectangle {
        id: sky
        anchors {
            top: parent.top
            left: parent.left; right: parent.right
        }
        height: parent.height * 0.8
        color: "lightblue"
    }

    Rectangle {
        id: ground
        anchors {
            top: sky.bottom; bottom: parent.bottom
            left: parent.left; right: parent.right
        }
        color: "green"
    }

    Rectangle {
        id: ball
        x: ground.x + ballDiameter; y: ground.y + 20 - ballDiameter
        width: ballDiameter; height: ballDiameter; radius: ballDiameter/2
        color: "orange"
    }

    ParallelAnimation {
        id: animation

        PropertyAnimation {
            target: ball
            property: "x"
            from: ground.x + ballDiameter
            to: ground.width - ballDiameter * 2
            easing.type: Easing.OutQuad
            duration: 1000
        }

        SequentialAnimation {
            PropertyAnimation {
                target: ball
                property: "y"
                from: ground.y + 20 - ballDiameter
                to: sky.x + 10
                easing.type: Easing.OutQuad
                duration: 200
            }

            PropertyAnimation {
                target: ball
                property: "y"
                from: sky.x + 10
                to: ground.y + 20 - ballDiameter
                easing.type: Easing.OutBounce
                duration: 800
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: animation.running = true
    }

}
