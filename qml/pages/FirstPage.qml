import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0
import io.thp.pyotherside 1.2

Page {
    id: page

    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        id: container
        anchors.fill: parent
        contentHeight: contentItem.childrenRect.height
        contentWidth: page.width

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
            MenuItem {
                text: "Help"
                onClicked: pageStack.push(Qt.resolvedUrl("HelpPage.qml"))
            }
/*            MenuItem {
                text: "Settings"
                onClicked: pageStack.push(Qt.resolvedUrl("SettingsPage.qml"))
            }
*/
        }

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id : limit_Column
            width: page.width
            spacing: Theme.paddingSmall

            function calculateResultLimit() {
                result_TextArea.text = '<FONT COLOR="LightGreen">Calculating limit...</FONT>'
                py.call('limit.calculate_Limit', [expression_TextField.text,variable_TextField.text,point_TextField.text,direction_ComboBox.value], function(result) {
                    result_TextArea.text = result;
                    result_TextArea.selectAll()
                    result_TextArea.copy()
                    result_TextArea.deselect()
                })
            }

            PageHeader {
                title: qsTr("Limit")
            }
            TextField {
                id: expression_TextField
                placeholderText: "sin(x)/x"
                label: qsTr("Limit expression")
                width: parent.width
                text : "sin(x)/x"
                focus: true
                EnterKey.enabled: text.length > 0
                EnterKey.iconSource: "image://theme/icon-m-enter-next"
                EnterKey.onClicked: variable_TextField.focus = true
            }
            Row {
                width: parent.width
                TextField {
                    id: variable_TextField
                    width: parent.width*0.5
                    placeholderText: "x"
                    label: qsTr("Variable")
                    text : "x"
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-enter-next"
                    EnterKey.onClicked: point_TextField.focus = true
                }
                TextField {
                    id: point_TextField
                    width: parent.width*0.5
                    placeholderText: "0"
                    label: qsTr("Point")
                    text : "0"
                    EnterKey.enabled: text.length > 0
                    EnterKey.iconSource: "image://theme/icon-m-enter-accept"
                    EnterKey.onClicked: limit_Column.calculateResultLimit()
                }
            }
            Row {
                width: parent.width
                ComboBox {
                    id: direction_ComboBox
                    width: page.width*0.55
                    label: qsTr("Direction ")
                    currentIndex: 0
                    menu: ContextMenu {
                        MenuItem { text: "Bilateral" }
                        MenuItem { text: "Left" }
                        MenuItem { text: "Right" }
                    }
                }
                Button {
                    id: calculate_Button
                    width: parent.width*0.35
                    text: qsTr("Calculate")
                    onClicked: limit_Column.calculateResultLimit()
                }
            }
            Separator {
                id : limit_Separator
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width*0.9
                color: Theme.primaryColor
            }
            FontLoader { id: dejavusansmono; source: "file:DejaVuSansMono.ttf" }
            TextArea {
                id: result_TextArea
                height: Math.max(page.width, 600, implicitHeight)
                width: parent.width
                readOnly: true
                font.family: dejavusansmono.name
                font.pixelSize: Theme.fontSizeExtraSmall
                placeholderText: "Limit calculation result"
                text : '<FONT COLOR="LightGreen">Loading Python and SymPy, it takes some seconds...</FONT>'
                Component.onCompleted: {
                    _editor.textFormat = Text.RichText;
                }
            }

            Python {
                id: py

                Component.onCompleted: {
                    // Add the Python library directory to the import path
                    var pythonpath = Qt.resolvedUrl('.').substr('file://'.length);
                    addImportPath(pythonpath);
                    console.log(pythonpath);

                    // Asynchronous module importing
                    importModule('limit', function() {
                        console.log('Python version: ' + evaluate('limit.versionPython'));
                        result_TextArea.text='<FONT COLOR="LightGreen">Using Python version ' + evaluate('limit.versionPython') + '.</FONT>'
                        console.log('SymPy version ' + evaluate('limit.versionSymPy') + evaluate('(" loaded in %f seconds." % limit.loadingtimeLimit)'));
                        result_TextArea.text+='<FONT COLOR="LightGreen">SymPy version ' + evaluate('limit.versionSymPy') + evaluate('(" loaded in %f seconds." % limit.loadingtimeLimit)') + '</FONT><br>'
                    });
                }

                onError: {
                    // when an exception is raised, this error handler will be called
                    console.log('python error: ' + traceback);
                }

                onReceived: {
                    // asychronous messages from Python arrive here
                    // in Python, this can be accomplished via pyotherside.send()
                    console.log('got message from python: ' + data);
                }
            }
        }
    }
}
