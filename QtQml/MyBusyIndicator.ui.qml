import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.11

BusyIndicator {
    id: mybusyindicator
    // Properties to export for widget behabior customisation
    //-------------------------------------------------------
    property string spotColor: "steelblue"
    property int size: 100
    property int spotSize: 20
    property int spotCount: 6
    property alias duration: animator.duration

    // BusyIndicator contains 2 parts that can be customized: contentItem and Background
    // Here we customize contentItem.
    contentItem: Item {
        id: frame
        implicitWidth: size
        implicitHeight: implicitWidth

        // Animator that rotate the entire object
        RotationAnimator {
            id: animator
            target: frame
            from: 0
            to: 360
            duration: 5000
            running: mybusyindicator.running
            loops: Animation.Infinite
        }

        // Repeater to create widget several times
        Repeater {
            id: repeat
            model: spotCount

            // Spot widget that will be repeated
            Rectangle {
                width: spotSize
                height: width
                radius: width / 2
                color: spotColor
                opacity: index / repeat.count

                // Transmation applied to spot to move it at proper place
                // - translation to be right above rotation horizontalCenter:
                // - rotation of angle depending of total number of spots
                transform: [
                    Translate {
                        x: (frame.width - width) / 2
                    },
                    Rotation {
                        angle: -index * 360 / repeat.count
                        origin.x: frame.width / 2
                        origin.y: frame.height / 2
                    }
                ]
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:100;width:100}
}
##^##*/

