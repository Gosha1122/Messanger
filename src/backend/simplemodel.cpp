#include "simplemodel.h"

SimpleModel::SimpleModel(QObject* parent): QAbstractListModel(parent) {
    m_chat = {
        {"chat_1", "frient_1", "Hello"},
        {"chat_2", "friend_2", "Bye"}
    };
}

int SimpleModel::rowCount(const QModelIndex &parent) const
{
    if(parent.isValid()) return 0;
    return m_chat.size();
}

QVariant SimpleModel::data(const QModelIndex &index, int role) const
{
    if(!index.isValid()|| index.row() >= m_chat.size()){
        return QVariant();
    }

    const ChatData& chat = m_chat[index.row()];
    if(role == IdRole) return chat.id;
    if(role == NameRole) return chat.name;
    if(role == MessageRole) return chat.lastMessage;
    return QVariant();
}

QHash<int, QByteArray> SimpleModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[IdRole] = "chatId";
    roles[NameRole] = "chatName";
    roles[MessageRole] = "lastMessage";
    return roles;
}

void SimpleModel::addChat(const QString &id, const QString &name, const QString &message)
{
    beginInsertRows(QModelIndex(), m_chat.size(), m_chat.size());
    m_chat.append({id, name, message});
    endInsertRows();
}

void SimpleModel::removeChat(int index)
{
    if(index < 0 || index > m_chat.size()) return;

    beginRemoveRows(QModelIndex(), index, index);
    m_chat.removeAt(index);
    endRemoveRows();
}

void SimpleModel::updateLastMessage(const QString &chat_id, const QString &new_message)
{
    for(int i = 0; i < m_chat.size(); i++){
        if(m_chat[i].id == chat_id){
            m_chat[i].lastMessage = new_message;

            QModelIndex modelIndex = index(i, 0);
            emit dataChanged(modelIndex, modelIndex, {MessageRole});
            break;
        }
    }
}
void SimpleModel::parseNetworkChats(const QJsonDocument &chatsDocument)
{

    qDebug() << "[model] Update chat list.";
    beginResetModel();
    m_chat.clear();
    endResetModel();
    QJsonObject obj = chatsDocument.object();
    qDebug() << obj.value("action");
    qDebug() << chatsDocument.toJson();
    if(obj.value("list").isArray()){
        QJsonArray chatsArray = obj.value("list").toArray();

        for (const QJsonValue &value : chatsArray) {
            QJsonObject obj = value.toObject();
            QString id = obj["id"].toString();
            QString name = obj["name"].toString();
            QString lastMessage = obj["lastMessage"].toString();
            addChat(id, name, lastMessage);
        }
    }
}
