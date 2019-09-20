import QtQuick 2.12
import QtQuick.Controls 2.5
import ToDo 1.0

Frame {
    ListView {
        implicitWidth: 250
        implicitHeight: 250
        clip: true

       model: ToDoModel {
           list: ToDoList
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
