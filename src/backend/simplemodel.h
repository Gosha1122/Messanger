#ifndef SIMPLEMODEL_H
#define SIMPLEMODEL_H

#include <QObject>
#include <QAbstractListModel>
#include <QtQml/qqml.h>
#include <QJsonObject>
#include <QJsonDocument>
#include <QJsonValue>
#include <QJsonArray>

struct ChatData{
    QString id;
    QString name;
    QString lastMessage;
};

class SimpleModel : public QAbstractListModel
{
    Q_OBJECT
    //QML_ELEMENT
public:
    enum CahtRoles{
        IdRole = Qt::UserRole + 1,
        NameRole,
        MessageRole
    };

    explicit SimpleModel(QObject* parent = nullptr);

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;

    QVariant data(const QModelIndex& index, int role = Qt::DisplayRole) const override;

    QHash<int, QByteArray> roleNames() const override;

    Q_INVOKABLE void addChat(const QString& id, const QString& name, const QString& message);

    Q_INVOKABLE void removeChat(int index);

    Q_INVOKABLE void updateLastMessage(const QString& chat_id, const QString& new_message);
public slots:
    void parseNetworkChats(const QJsonDocument &chatsDocument);
private:
    QVector<ChatData> m_chat;
};

#endif // SIMPLEMODEL_H
