import QtQuick 2.12
import QtQuick.Controls 2.5



Item {

    ListModel {
        id: peopleModel
        ListElement { name: "Alice"; age: 30; gender: "Female" }
        ListElement { name: "Sarah"; age: 22; gender: "Female" }
        ListElement { name: "Catelyn"; age: 41; gender: "Female" }
        ListElement { name: "Bob"; age: 50; gender: "Male" }
        ListElement { name: "John"; age: 62; gender: "Male" }
        ListElement { name: "Bill"; age: 41; gender: "Male" }
        ListElement { name: "Zach"; age: 12; gender: "Male" }
    }

    Component {
        id: peopleDelegate
        Rectangle {
            readonly property ListView __lv: ListView.view
            anchors.left: parent.left; anchors.right: parent.right
            height: nameLbl.implicitHeight + ageLbl.implicitHeight + 5
            color: "transparent"


            Text {
                id: nameLbl
                text: model.name
                font.pixelSize: 16
            }
            Text {
                id: ageLbl
                anchors.top: nameLbl.bottom
                text: model.age + " y.o."
                font.pixelSize: 12
                color: "darkgrey"

            }
            MouseArea {
                anchors.fill: parent
                onClicked: __lv.currentIndex = model.index
            }
        }
    }

    Component {
        id: buttonUp
        Rectangle {
            readonly property ListView __lv: ListView.view

            anchors.left: parent.left; anchors.right: parent.right
            height: txt.implicitHeight
            color: "lightgrey"

            Text {
                id: txt
                anchors.centerIn: parent
                text: "\u25b2"
                font.pointSize: 24
                color: "grey"

            }

            MouseArea {
                anchors.fill: parent
                onClicked: (__lv.currentIndex <= 0) ? __lv.currentIndex : __lv.currentIndex--
            }
        }
    }

    Component {
        id: buttonDown
        Rectangle {
            readonly property ListView __lv: ListView.view

            anchors.left: parent.left; anchors.right: parent.right
            height: txt.implicitHeight
            color: "lightgrey"

            Text {
                id: txt
                anchors.centerIn: parent
                text: "\u25bc"
                font.pointSize: 24
                color: "grey"

            }

            MouseArea {
                anchors.fill: parent
                onClicked: (__lv.currentIndex >= __lv.count-1) ? __lv.currentIndex : __lv.currentIndex++
            }
        }
    }

    Component {
        id: sectionDelegate
        Rectangle {
            readonly property ListView __lv: ListView.view

            anchors.left: parent.left; anchors.right: parent.right
            height: txt.implicitHeight
            color: "lightgreen"
            Text {
                id: txt
                anchors.centerIn: parent
                text: section
                font.pointSize: 16
                font.italic: true
                font.bold: true
                color: "#444444"
            }
        }
    }

    Component {
        id: highlightDelegate
        Rectangle {
            anchors.left: parent.left; anchors.right: parent.right
            color: "lightgrey"
        }
    }

    ListView {
        anchors.fill: parent
        model: peopleModel
        delegate: peopleDelegate
        clip: true
        focus: true
        header: buttonUp
        footer: buttonDown
        highlight: highlightDelegate
        keyNavigationWraps: true

        section {
            property: "gender"
            criteria: ViewSection.FullString
            delegate: sectionDelegate
        }
    }


}