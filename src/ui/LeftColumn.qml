import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    id: root
    color: "#ffffff"

    border.color: "#999999"
    border.width: 1

    Rectangle{
        id: rect_chat_text
        color: parent.color
        height: 30

        anchors.left: root.left
        anchors.top: root.top
        anchors.margins: 15

        Text{
            anchors.fill: parent
            //anchors.margins: 10
            text: "Chats"
            font.pixelSize: 20
            font.bold: true
            color: "black"
        }

    }

    Button{
        id: settings_button

        height: 30
        width: 30
        anchors.right: root.right
        anchors.top: root.top
        anchors.margins: 15
        // text: "S"
        // font.pixelSize: 20


        icon.source: "qrc:/resources/icons/settings_icon.png"
        icon.width: 15
        icon.height: 15

        background: Rectangle{
            anchors.fill: parent
            color: root.color
        }
    }

    TextField{
        id: search_lines

        height: 45

        anchors.left: root.left
        anchors.right: root.right
        anchors.top: rect_chat_text.bottom
        //anchors.bottom: chat_list_view.top
        anchors.margins: 20

        placeholderText: "Search Messenger..."
        leftPadding: 10
        rightPadding: 10
        font.pixelSize: 12
        selectByMouse: true
        color: "#cccccc"

        background: Rectangle{
            implicitHeight: 45
            radius: 8
            //border.color: (search_lines.activeFocus ? "#bbbbbb" : "#aaaaaa")
            //border.width: (search_lines.activeFocus ? 2 : 1)
            color: "#fafafa"
            Behavior on border.color {
                ColorAnimation {
                    duration: 100
                }
            }
        }
    }

    ListView{
        id: chat_list_view
        anchors.left: root.left
        anchors.right: root.right
        anchors.top: search_lines.bottom
        anchors.bottom: root.bottom
        //anchors.fill: parent
        anchors.margins: 10
        spacing: 8
        clip: true

        model: myChatModel

        delegate: ItemDelegate{
            width: chat_list_view.width
            height: 60
            onClicked: {
                console.log("Clicked chat, id:", model.chatId);
            }

            contentItem: RowLayout{
                anchors.fill: parent
                spacing: 10

                ColumnLayout{
                    Layout.fillWidth: true
                    spacing:4

                    Text{
                        text: model.chatName
                        font.bold: true
                        font.pixelSize: 14
                        Layout.fillWidth: true
                    }

                    Text{
                        text: model.lastMessage
                        color: "blue"
                        font.pixelSize: 12
                        Layout.fillWidth: true
                    }
                }

                Button{
                    text: "X"
                    flat: true
                    Layout.alignment: Qt.AlignVCenter

                    onClicked: {
                        chat_list_view.model.removeChat(index)
                    }
                }
            }
        }



    }
    Button{
        id: add_button
        text: "Add Chat"
        anchors.bottom: parent.bottom
        onClicked: {
            chat_list_view.model.addChat("chat_3", "friend_3", "Hell");
        }
    }

    Button{
        text: "Update Chat"
        anchors.bottom: parent.bottom
        anchors.left: add_button.right
        onClicked: {
            chat_list_view.model.updateLastMessage("chat_3", "Hello, World!");
        }
    }
}
