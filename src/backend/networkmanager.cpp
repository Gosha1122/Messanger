#include "networkmanager.h"

NetworkManager::NetworkManager(QObject *parent) : QObject(parent)
{
    m_networkManager = new QNetworkAccessManager(this);
}

void NetworkManager::fetchChatsFromServer()
{
    QUrl url("http://ya.self-promo.ru/api/goshachat.php");
    qDebug() << "[network] request";
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");

    QNetworkReply *reply = m_networkManager->get(request);
    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
        onReplyFinished(reply);
    });
}

void NetworkManager::send(const QJsonObject &json)
{
    QUrl url("http://ya.self-promo.ru/api/goshachat.php");
    qDebug() << "[network] request";
    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    QJsonDocument doc(json);

    QNetworkReply *reply = m_networkManager->post(request, doc.toJson());
    connect(reply, &QNetworkReply::finished, this, [this, reply]() {
        onReplyFinished(reply);
    });
}

void NetworkManager::onReplyFinished(QNetworkReply *reply)
{
    qDebug() << "[network] Reply finished";
    reply->deleteLater();

    if (reply->error() != QNetworkReply::NoError) {
        emit errorOccurred(reply->errorString());
        qDebug() << "[network] Reply error.";
        return;
    }

    QByteArray responseData = reply->readAll();
    QJsonDocument jsonDoc = QJsonDocument::fromJson(responseData);

    qDebug() << "[network] Parse json.";
    if (!jsonDoc.isEmpty()) {
        qDebug() << "[network] emit chatsLoaded.";
        emit chatsLoaded(jsonDoc);

    } else {
        emit errorOccurred("Неверный формат ответа от сервера");
    }
}
