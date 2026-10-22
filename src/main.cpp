#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include "backend/simplemodel.h"
#include "backend/networkmanager.h"
#include <QJsonObject>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Basic");

    SimpleModel chatModel;
    NetworkManager networkManager;


    QObject::connect(&networkManager, &NetworkManager::chatsLoaded,
                     &chatModel, &SimpleModel::parseNetworkChats);


    //qmlRegisterType<SimpleModel>("Messanger", 1, 0, "SimpleModel");
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("myChatModel", &chatModel);

    QJsonObject json;
    json["action"] = "get_chat_list";
    json["id"] = "12345";
    networkManager.send(json);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("Messanger", "Main");

    return app.exec();
}
