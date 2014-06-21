import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0

Page {
    id: settingsPage

    allowedOrientations: limitScreenOrientation

    SilicaFlickable {
        id: setttingsFlick
        anchors.fill: parent
        contentHeight: contentItem.childrenRect.height
        contentWidth: setttingsFlick.width

        VerticalScrollDecorator { flickable: setttingsFlick }

        Column {
            id: settingsColumn
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingMedium
            }
            spacing: Theme.paddingSmall

            PageHeader {
                title: qsTr('Limit Settings')
            }
            ComboBox {
                id: orientation_ComboBox
                label: qsTr("Screen orientation")
                currentIndex: orientation_index
                menu: ContextMenu {
                    MenuItem {
                        text: qsTr("Portrait")
                        onClicked: {
                            limitScreenOrientation = Orientation.Portrait
                            orientation_index = 0
                        }
                    }
                    MenuItem {
                        text: qsTr("Landscape")
                        onClicked: {
                            limitScreenOrientation = Orientation.Landscape
                            orientation_index = 1
                        }
                    }
                    MenuItem {
                        text: qsTr("Automatic")
                        onClicked: {
                            limitScreenOrientation = Orientation.Portrait | Orientation.Landscape
                            orientation_index = 2
                        }
                    }
                }
            }
            TextSwitch {
                id: showLimit_TextSwitch
                text: qsTr("Show not calculated limit")
                description: qsTr("before Limit result")
                checked: showLimit
                onCheckedChanged : { showLimit = checked }
            }
            TextSwitch {
                id: showTime_TextSwitch
                text: qsTr("Show calculation time")
                description: qsTr("before limit result")
                checked: showTime
                onCheckedChanged : { showTime = checked }
            }
            TextSwitch {
                id: numerApprox_TextSwitch
                text: qsTr("Numerical approximation")
                description: qsTr("of the limit result")
                checked: numerApprox
                onCheckedChanged : { numerApprox = checked }
            }
            TextField {
                id: numDig_TextField
                width: parent.width
                label: qsTr("Number of digits for numerical approx.")
                placeholderText: numDigText
                text: numDigText
                validator: IntValidator{bottom: 1; top: 1000000}
                inputMethodHints: Qt.ImhDigitsOnly | Qt.ImhNoPredictiveText
                onTextChanged: { numDigText = text }
                EnterKey.enabled: text.length > 0
                EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                EnterKey.onClicked: { numDigText = text; simplifyResult_ComboBox.focus = true }
            }
            ComboBox {
                id: simplifyResult_ComboBox
                label: qsTr("Simplification method for result")
                currentIndex: simplifyResult_index
                menu: ContextMenu {
                    MenuItem { text: qsTr("None") }
                    MenuItem { text: qsTr("Expand terms") }
                    MenuItem { text: qsTr("Simplify terms") }
                    MenuItem { text: qsTr("Expand all") }
                    MenuItem { text: qsTr("Simplify all") }
                    onActivated: {
                        simplifyResult_index = index
                    }
                }
            }
            ComboBox {
                id: outputTypeResult_ComboBox
                label: qsTr("Output type for limit result")
                currentIndex: outputTypeResult_index
                menu: ContextMenu {
                    MenuItem { text: qsTr("Simple") }
                    MenuItem { text: qsTr("Bidimensional") }
                    MenuItem { text: qsTr("LaTex") }
//                    MenuItem { text: qsTr("MathML") }
                    MenuItem { text: qsTr("C") }
                    MenuItem { text: qsTr("Fortran") }
                    MenuItem { text: qsTr("Javascript") }
                    MenuItem { text: qsTr("Python/SymPy") }
                    onActivated: {
                        outputTypeResult_index = index
                    }
                }
            }
        }
    }

    states: [
        State {
            name: "inLandscape"
            when: orientation === Orientation.Landscape
            PropertyChanges {
                target: showLimit_TextSwitch
                text: qsTr("Show not calculated limit before limit result")
                description: ''
            }
            PropertyChanges {
                target: showTime_TextSwitch
                text: qsTr("Show calculation time before limit result")
                description: ''
            }
            PropertyChanges {
                target: numerApprox_TextSwitch
                text: qsTr("Numerical approximation of the limit result")
                description: ''
            }
            PropertyChanges {
                target: numDig_TextField
                label: qsTr("Number of digits for numerical approximation")
            }
            PropertyChanges {
                target: simplifyResult_ComboBox
                label: qsTr("Simplification method for non-numerical limit result")
            }
        },
        State {
            name: "inPortrait"
            when: orientation === Orientation.Portrait
            PropertyChanges {
                target: showLimit_TextSwitch
                text: qsTr("Show not calculated limit")
                description: qsTr("before limit result")
            }
            PropertyChanges {
                target: showTime_TextSwitch
                text: qsTr("Show calculation time")
                description: qsTr("before limit result")
            }
            PropertyChanges {
                target: numerApprox_TextSwitch
                text: qsTr("Numerical approximation")
                description: qsTr("of the limit result")
            }
            PropertyChanges {
                target: numDig_TextField
                label: qsTr("Number of digits for numerical approx.")
            }
            PropertyChanges {
                target: simplifyResult_ComboBox
                label: qsTr("Simplification method for result")
            }
        }
    ]
}
