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
            // readonly property ListModel __model: ListView.model
            property bool expanded: __lv.isSectionExpanded(model.gender)
            anchors.left: parent.left; anchors.right: parent.right
            height: expanded ? nameLbl.implicitHeight + ageLbl.implicitHeight + 5 : 0
            clip: true
            color: "transparent"

            Behavior on height {
                NumberAnimation { duration: 200 }
            }


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
                onClicked: {
                    __lv.currentIndex = model.index;
                    peopleModel.insert(0, {name: "Item #"+peopleModel.count , age: 0, gender:"Undefined"})
                }
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

            MouseArea {
                anchors.fill: parent
                onClicked: __lv.toggleSection(section)
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
        property var collapsed: ({})

        anchors.fill: parent
        clip: true
        focus: true
        keyNavigationWraps: true
        snapMode: ListView.SnapOneItem  // Snap item. Si en plus le delegate fait exactement la taille de la listView, ca fait un effet swipeView

        populate: Transition {      // Animation for 1st fill of ListView. Does not render very well with sections
            NumberAnimation { properties: "x, y"; duration:  300}
        }

        add: Transition {   // Animation when a item is added in the list
            PropertyAction { property: "transformOrigin"; value: Item.TopLeft }
            NumberAnimation { properties: "opacity,scale"; from: 0.0; to: 1.0; duration: 500 }
        }

        displaced: Transition { // Animation when an element is moved
            PropertyAction { properties: "opacity,scale"; value: 1.0 }  // Opacity and scale are forced to 1.0 in case animation on Add didn't complete (ex: has been interupt by a even newer item insertion)
            NumberAnimation { properties: "x,y"; duration: 500 }    // Item is smoothly shifted to let space for the newly inserted item
        }

        model: peopleModel
        delegate: peopleDelegate
        header: buttonUp
        footer: buttonDown
        highlight: highlightDelegate

        section {
            property: "gender"
            criteria: ViewSection.FullString
            delegate: sectionDelegate
        }


        function isSectionExpanded(section) {
            return !(section in collapsed);
        }

        function showSection(section) {
            delete collapsed[section];
            /* emit */ collapsedChanged();
        }

        function hideSection(section) {
            collapsed[section] = true;
            /* emit */ collapsedChanged();
        }

        function toggleSection(section) {
            if (isSectionExpanded(section)) {
                hideSection(section)
            } else {
                showSection(section)
            }
        }
    }




}
