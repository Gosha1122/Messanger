import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window{
    id: register_window
    signal signalExit
    color: "#aaaaaa"

    property int left_right_margin: 40

    Rectangle {
        id: root_window
        width: 400
        height: 550
        color: "#ffffff"
        radius: 15
        anchors.centerIn: parent
        clip:true

        StackView{
            id: stack
            initialItem: sign_up
            anchors.centerIn: parent
            width: 400
            height: root_window.height
        }
    }
    Component{
        id: sign_up

            Column{

                width: parent ? parent.width : 400
                spacing: 60
                topPadding: 60

                Column{

                    width: parent.width
                    spacing: 8
                    //anchors.topMargin: 100

                    Text{

                        text: "Sign Up"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#5566bb"
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                    }
                }



                Column{
                    width: parent.width
                    spacing: 15

                    TextField{
                        id: user_email
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: left_right_margin
                        anchors.rightMargin: left_right_margin
                        placeholderText: "e-mail"
                        leftPadding: 10
                        rightPadding: 10
                        font.pixelSize: 15
                        selectByMouse: true
                        color: "#2233bb"


                        background: Rectangle{
                            implicitHeight: 45
                            radius: 8
                            border.color: (user_email.activeFocus ? "#4f46e5" : "#ffffff")
                            border.width: (user_email.activeFocus ? 2 : 1)
                            color: "#fafafa"
                            Behavior on border.color {
                                ColorAnimation {
                                    duration: 100
                                }
                            }
                        }
                    }

                    TextField{
                        id: user_password
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: left_right_margin
                        anchors.rightMargin: left_right_margin
                        placeholderText: "password"
                        echoMode: TextInput.Password
                        leftPadding: 10
                        rightPadding: 10
                        font.pixelSize: 15
                        selectByMouse: true
                        color: "#2233bb"

                        background: Rectangle{
                            implicitHeight: 45
                            radius: 8
                            border.color: (user_password.activeFocus ? "#4f46e5" : "#ffffff")
                            border.width: (user_password.activeFocus ? 2 : 1)
                            color: "#fafafa"
                            Behavior on border.color {
                                ColorAnimation {
                                    duration: 100
                                }
                            }
                        }
                    }

                    TextField{
                        id: user_repassword
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: left_right_margin
                        anchors.rightMargin: left_right_margin
                        placeholderText: "repeat password"
                        echoMode: TextInput.Password
                        leftPadding: 10
                        rightPadding: 10
                        font.pixelSize: 15
                        selectByMouse: true
                        color: "#2233bb"

                        background: Rectangle{
                            implicitHeight: 45
                            radius: 8
                            border.color: (user_repassword.activeFocus ? "#4f46e5" : "#ffffff")
                            border.width: (user_repassword.activeFocus ? 2 : 1)
                            color: "#fafafa"
                            Behavior on border.color {
                                ColorAnimation {
                                    duration: 100
                                }
                            }
                        }
                    }

                    Switch{
                        id: control
                        text: "Remember me"

                        anchors.left: parent.left
                        anchors.leftMargin: left_right_margin

                        indicator: Rectangle {
                            implicitWidth: 40
                            implicitHeight: 20
                            x: control.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: control.checked ? "#5f57f6" : "#ffffff"
                            border.color: control.checked ? "#5f57f6" : "#cccccc"

                            Behavior on color{
                                ColorAnimation{
                                    duration: 100
                                }
                            }

                            Rectangle {
                                x: control.checked ? parent.width - width : 0
                                width: 20
                                height: 20
                                radius: 10

                                Behavior on x{
                                    NumberAnimation{
                                        duration: 100
                                    }
                                }

                                color: control.down ? "#cccccc" : "#ffffff"
                                border.color: control.checked ? (control.down ? "#5f57f6" : "#4f46e5") : "#999999"


                            }
                        }



                        contentItem: Text {
                            text: control.text
                            font: control.font
                            opacity: enabled ? 1.0 : 0.3
                            color: control.down ? "#5f57f6" : "#4f46e5"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: control.indicator.width + control.spacing
                        }
                    }
                }

                Column{
                    width: parent.width
                    spacing: 8
                    Button{
                        id: submit_button
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 2 * left_right_margin
                        anchors.rightMargin: 2 * left_right_margin
                        text: "Sign Up"

                        contentItem: Text{
                            text: submit_button.text
                            font.pixelSize: 15
                            font.bold: true
                            color: "#ffffff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle{
                            implicitHeight: 50
                            radius: 8
                            color: (submit_button.down ? "#3730a3" : (submit_button.hovered ? "#5f57f6" : "#4f46e5"))

                        }
                        onClicked: {
                            stack.push(sign_in)
                            console.log("Button Sign Up clicked: ", user_email.text, user_password.text)
                        }
                    }

                    Button{
                        id: go_to_login_button
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 2 * left_right_margin
                        anchors.rightMargin: 2 * left_right_margin
                        text: "Sign In"

                        contentItem: Text{
                            text: go_to_login_button.text
                            font.pixelSize: 15
                            font.bold: true
                            color: (go_to_login_button.down ? "#3730a3" : (go_to_login_button.hovered ? "#5f57f6" : "#4f46e5"))
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle{
                            implicitHeight: 50
                            radius: 8
                            color: root_window.color
                        }

                        onClicked: {
                            stack.push(sign_in)
                            //register_window.signalExit()
                            //console.log("Button Sign In clicked: ", user_email.text, user_password.text)
                        }
                    }
                }
            }
    }
    Component{
        id: sign_in
            Column{
                //anchors.fill: parent
                anchors.margins: 40
                spacing: 60

                Column{
                    width: parent.width
                    spacing: 8


                    Text{
                        text: "Sign In"
                        font.pixelSize: 40
                        font.bold: true
                        color: "#5566bb"
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                    }
                }

                Column{
                    width: parent.width
                    spacing: 15

                    TextField{
                        id: sign_in_user_email
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: left_right_margin
                        anchors.rightMargin: left_right_margin
                        placeholderText: "e-mail"
                        leftPadding: 10
                        rightPadding: 10
                        font.pixelSize: 15
                        selectByMouse: true
                        color: "#2233bb"

                        background: Rectangle{
                            implicitHeight: 45
                            radius: 8
                            border.color: (sign_in_user_email.activeFocus ? "#4f46e5" : "#ffffff")
                            border.width: (sign_in_user_email.activeFocus ? 2 : 1)
                            color: "#fafafa"
                            Behavior on border.color {
                                ColorAnimation {
                                    duration: 100
                                }
                            }
                        }
                    }

                    TextField{
                        id: sign_in_user_password
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: left_right_margin
                        anchors.rightMargin: left_right_margin
                        placeholderText: "password"
                        echoMode: TextInput.Password
                        leftPadding: 10
                        rightPadding: 10
                        font.pixelSize: 15
                        selectByMouse: true
                        color: "#2233bb"

                        background: Rectangle{
                            implicitHeight: 45
                            radius: 8
                            border.color: (sign_in_user_password.activeFocus ? "#4f46e5" : "#ffffff")
                            border.width: (sign_in_user_password.activeFocus ? 2 : 1)
                            color: "#fafafa"
                            Behavior on border.color {
                                ColorAnimation {
                                    duration: 100
                                }
                            }
                        }
                    }

                    Switch{
                        id: sign_in_control
                        text: "Remember me"

                        anchors.left: parent.left
                        anchors.leftMargin: left_right_margin

                        indicator: Rectangle {
                            implicitWidth: 40
                            implicitHeight: 20
                            x: sign_in_control.leftPadding
                            y: parent.height / 2 - height / 2
                            radius: 13
                            color: sign_in_control.checked ? "#5f57f6" : "#ffffff"
                            border.color: sign_in_control.checked ? "#5f57f6" : "#cccccc"

                            Behavior on color{
                                ColorAnimation{
                                    duration: 100
                                }
                            }

                            Rectangle {
                                x: sign_in_control.checked ? parent.width - width : 0
                                width: 20
                                height: 20
                                radius: 10

                                Behavior on x{
                                    NumberAnimation{
                                        duration: 100
                                    }
                                }

                                color: sign_in_control.down ? "#cccccc" : "#ffffff"
                                border.color: sign_in_control.checked ? (sign_in_control.down ? "#5f57f6" : "#4f46e5") : "#999999"


                            }
                        }



                        contentItem: Text {
                            text: sign_in_control.text
                            font: sign_in_control.font
                            opacity: enabled ? 1.0 : 0.3
                            color: sign_in_control.down ? "#5f57f6" : "#4f46e5"
                            verticalAlignment: Text.AlignVCenter
                            leftPadding: sign_in_control.indicator.width + sign_in_control.spacing
                        }
                    }
                }

                Column{
                    width: parent.width
                    spacing: 8
                    Button{
                        id: sign_in_submit_button
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 2 * left_right_margin
                        anchors.rightMargin: 2 * left_right_margin
                        text: "Sign In"

                        contentItem: Text{
                            text: sign_in_submit_button.text
                            font.pixelSize: 15
                            font.bold: true
                            color: "#ffffff"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle{
                            implicitHeight: 50
                            radius: 8
                            color: (sign_in_submit_button.down ? "#3730a3" : (sign_in_submit_button.hovered ? "#5f57f6" : "#4f46e5"))

                        }
                        onClicked: {
                            register_window.signalExit()
                            //console.log("Button Sign Up clicked: ", user_email.text, user_password.text)
                        }
                    }

                    Button{
                        id: sign_in_go_to_login_button
                        //width: parent.width
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin: 2 * left_right_margin
                        anchors.rightMargin: 2 * left_right_margin
                        text: "Sign Up"

                        contentItem: Text{
                            text: sign_in_go_to_login_button.text
                            font.pixelSize: 15
                            font.bold: true
                            color: (sign_in_go_to_login_button.down ? "#3730a3" : (sign_in_go_to_login_button.hovered ? "#5f57f6" : "#4f46e5"))
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                        }

                        background: Rectangle{
                            implicitHeight: 50
                            radius: 8
                            color: root_window.color
                        }

                        onClicked: {
                            stack.pop()
                            //register_window.signalExit()
                            //console.log("Button Sign In clicked: ", user_email.text, user_password.text)
                        }
                    }
                }
            }
    }

}