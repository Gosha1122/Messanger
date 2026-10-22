import QtQuick
import QtQuick.Window
import QtQuick.Controls


Window{
    id: register_window
    signal signalExit
    color: "#aaaaaa"

    Rectangle {
            id: sign_up_window
            width: 400
            height: 550
            color: "#ffffff"
            radius: 15
            anchors.centerIn: parent
            clip: true

            StackView {
                id: stack
                initialItem: regPage
                anchors.fill: parent
            }

            Component {
                id: regPage
                Rectangle {
                    // 2. Меняем привязку на parent, чтобы StackView корректно управлял страницей
                    anchors.fill: parent
                    color: "red"

                    Button {
                        text: "Next"
                        anchors.centerIn: parent // Отцентрируем кнопку для красоты
                        onClicked: {
                            stack.push(loginPage)
                        }
                    }
                }
            }

            Component {
                id: loginPage
                Rectangle {
                    // 2. Здесь также меняем на parent
                    anchors.fill: parent
                    color: "green"

                    Button {
                        text: "Back"
                        anchors.centerIn: parent
                        onClicked: {
                            stack.pop() // Добавим возможность вернуться назад
                        }
                    }
                }
            }
        }
    }