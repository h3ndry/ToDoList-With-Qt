import QtQuick 2.12
import QtQuick.Controls 2.5

import ToDo 1.0

Column {
    Frame {
        //implicitWidth: parent.width
        ListView {
            implicitWidth: 250
            implicitHeight: 250
            clip: true

            model: ToDoModel {
                list: toDoList
            }

            delegate: Row {
                width: parent.width
                CheckBox {
                    checked: model.done
                    onClicked: model.done = checked
                }
                TextField {
                    text: model.description
                    implicitWidth: parent.width
                    onEditingFinished: model.description = text
                }

            }
        }
    }
    Row {
        Button {
            text: qsTr("Add new Item")
            onClicked: toDoList.appendItme()
            //implicitWidth: parent.width
        }
        Button {
            text: qsTr("Remove Completed")
            onClicked: toDoList.removeCompleteItmes()
                //implicitWidth: parent.width
        }
    }
}
