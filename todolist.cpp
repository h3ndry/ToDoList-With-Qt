#include "todolist.h"

ToDoList::ToDoList(QObject *parent) : QObject(parent) {
    mItems.append({true, QStringLiteral("Wash a car")});
    mItems.append({false, QStringLiteral("Fix the sink")});
    mItems.append({true, QStringLiteral("Give Lelo Her earphone")});

}

QVector<ToDoItem> ToDoList::items() const {

    return mItems;
}

bool ToDoList::setItemAt(int index, const ToDoItem &item) {
    if (index < 0 || index >= mItems.size()) return  false;

    const ToDoItem &oldItem = mItems.at(index);

    if (item.done == oldItem.done && item.description == oldItem.description)
        return false;

    mItems[index] = item;
    return true;


}

void ToDoList::appendItme() {

    emit preItemAppended();

    ToDoItem item;
    item.done = false;
    mItems.append(item);

    emit postItemAppended();

}

void ToDoList::removeCompleteItmes() {

    for (int i = 0; i < mItems.size();) {
        if (mItems.at(i).done) {
            emit preItemRemove(i);

             mItems.removeAt(i);

            emit postItemRemove();
        } else {
            ++i;
        }
    }
}
