import QtQuick

Rectangle {
    id: root
    color: "#ffffff"

    border.color: "#999999"
    border.width: 1

    Rectangle{
        id: top_panel
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 80

        border.color: "#999999"
        border.width: 1
        Rectangle{
            id: image_rect
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.bottomMargin: 15
            //color: "#aaaaaa"
            radius: 20
            width: 40
            height: 40
            //clip: true

            Image{
                width: parent.width - 4
                height: parent.height - 4
                anchors.centerIn: parent
                id: image
                source: "qrc:/resources/icons/smile_icon_2.png"
            }
        }

        Rectangle{

            anchors.left: image_rect.right
            anchors.top: parent.top

            anchors.topMargin: 25
            anchors.leftMargin: 15
            anchors.rightMargin: 15
            anchors.bottomMargin: 15

            Text{
                id: name_text
                text: "Friend 1"
            }

            Text{
                id: status_text
                anchors.top: name_text.bottom
                text: "Online"
            }
        }

    }

}
