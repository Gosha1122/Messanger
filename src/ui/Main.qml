import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Basic
import QtQuick.Controls

QtObject{
    id: root

    property Window registerForm: RegisterForm2{
        width: 600
        height: 700
        title: "Register"
        visible: true

        onSignalExit: {
            registerForm.close();
            mainWindow.show();
        }
    }

    property Window mainWindow: Window{
        id: main_window
        width: 600
        height: 700
        visible: false
        title: "Chat"

        LeftColumn{
            id: left_column
            width: 250
            anchors.left: parent.left
            anchors.top:  parent.top
            anchors.bottom: parent.bottom
        }

        RightColumn{
            id: right_column
            width: 250
            anchors.right: parent.right
            anchors.top:  parent.top
            anchors.bottom: parent.bottom
        }


        PropertyAnimation{
            id: animater_right_hide
            target: right_column
            properties: "width"
            to: 0
            duration: 100
        }

        PropertyAnimation{
            id: animater_right_show
            target: right_column
            properties: "width"
            to: 250
            duration: 100
        }

        CenterColumn{
            id: center_column
            anchors.right: right_column.left
            anchors.left: left_column.right
            anchors.top:  parent.top
            anchors.bottom: parent.bottom

            // Button{
            //     text: "Close Right"
            //     onClicked: {
            //         if(right_column.width > 0){
            //             animater_right_hide.start()
            //         }else{
            //             animater_right_show.start()
            //         }
            //     }
            // }

            // Button{
            //     text: "Open Settings"
            //     anchors.centerIn: parent

            //     onClicked: drawer.open()
            // }
        }

        Drawer{
            id: drawer
            width: parent.width * 0.6
            height: parent.height

            Column{
                anchors.fill: parent
                spacing: 10
                padding: 20

                Text{
                    text: "Settings"
                    font.pixelSize: 20
                }

                Button{
                    text: "Close"

                    onClicked: drawer.close()
                }
            }
        }

    }
}

