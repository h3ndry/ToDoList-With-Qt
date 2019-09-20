import QtQuick 2.12
import QtQuick.Controls 2.5

Frame {
    ListView {
        implicitWidth: 250
        implicitHeight: 250
        clip: true

        model: ListModel {
            ListElement {
                done: true
                description: "Wash the car"
            }
            ListElement {
                done: false
                description: "Fix the sink"
            }

            ListElement {
                done: false
                description: "Organis bootsrap totorails"
            }
        }

        delegate: Row {
            width: parent.width
            CheckBox {
                checked: model.done
            }
            TextField {
                text: model.description
                implicitWidth: parent.width
            }

        }
    }
}
