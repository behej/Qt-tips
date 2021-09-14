import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    id: page
    width: 600
    height: 400


    header: Label {
        text: qsTr("ListView")
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

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
                text: model.age
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
        id: topButton
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
        id: bottomButton
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

    ListView {
        anchors.fill: parent
        model: peopleModel
        delegate: peopleDelegate
        clip: true
        focus: true
        header: topButton
        footer: bottomButton

        highlight: Rectangle {
            anchors.left: parent.left; anchors.right: parent.right
            height: 20
            color: "lightgrey"
        }

        section.property: "gender"
        section.criteria: ViewSection.FullString
        section.delegate: Rectangle {
            anchors.left: parent.left; anchors.right: parent.right
            height: txt.implicitHeight
            color: "lightgreen"
            Text {
                id: txt
                anchors.fill: parent
                text: section
                font.pointSize: 18
            }
        }

    }


}
