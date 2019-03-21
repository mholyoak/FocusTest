import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    id: appWinId
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: rectListId
        color: "lightsteelblue"; width: 100; height: 50

        ListView {
            id: listId

            anchors.fill: parent
            focus: true

            model: ListModel {
                ListElement { name: "Bob" }
                ListElement { name: "John" }
                ListElement { name: "Michael" }
            }

            delegate: FocusScope {
                    width: childrenRect.width; height: childrenRect.height
                    x:childrenRect.x; y: childrenRect.y
                    TextInput {
                        focus: true
                        text: name
                        Keys.onReturnPressed: console.log(name)
                    }
            }
        }
        MouseArea { anchors.fill: rectListId; onClicked: { listId.focus = true } }
    }

    Rectangle {
        id: colWinId

        anchors.top: rectListId.bottom

        color: "white"; width: 240; height: 150

        Column {
            anchors.centerIn: parent; spacing: 15

            MyClickableWidget {
                focus: true             //set this MyWidget to receive the focus
                color: "lightblue"
            }
            MyClickableWidget {
                color: "palegreen"
            }
        }

    }

    Rectangle {
        id: rectId

        anchors.top: colWinId.bottom

        color: "lightsteelblue"; width: 240; height: 25
        Text { id: myText }

        Keys.onPressed: {
            if (event.key === Qt.Key_A)
                myText.text = 'Key A was pressed'
            else if (event.key === Qt.Key_B)
                myText.text = 'Key B was pressed'
            else if (event.key === Qt.Key_C)
                myText.text = 'Key C was pressed'
        }
        MouseArea { anchors.fill: rectId; onClicked: { rectId.focus = true } }
    }

    Text {
        id: focusTextId

        //focus: true

        anchors.top: rectId.bottom

        text: activeFocus ? "I have active focus!" : "I do not have active focus"
    }

    Text {
        id: anotherFocusTextId

        //focus: true

        anchors.top: focusTextId.bottom

        text: activeFocus ? "Another item has active focus!" : "Another item does not have active focus"
    }
}
