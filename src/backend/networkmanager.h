#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonArray>
#include <QJsonObject>

class NetworkManager : public QObject
{
    Q_OBJECT
public:
    explicit NetworkManager(QObject *parent = nullptr);

    void fetchChatsFromServer();

    void send(const QJsonObject& json);

signals:

    void chatsLoaded(const QJsonDocument &chatsDocument);
    void errorOccurred(const QString &errorStr);

private slots:
    void onReplyFinished(QNetworkReply *reply);

private:
    QNetworkAccessManager *m_networkManager;

};

#endif // NETWORKMANAGER_H
