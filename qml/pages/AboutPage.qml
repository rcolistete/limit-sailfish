import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0


Page {
    id: page

    allowedOrientations: limitScreenOrientation

     Item {
        id: aboutInfos
        property string version:'0.8'
        property string text: if(orientation === Orientation.Portrait) {
                                  '<style>a:link { color: ' + Theme.primaryColor  + '; }</style>' +
                                  'Limit calculates mathematical limits<br>symbolically and numerically.' +
                                  '<br><br>This version of Limit is written using<br>Python 3, SymPy, PyOtherSide, Qt5,<br>Qt Quick 2 (Silica Components).' +
                                  '<br><br>© 2011-2014 by Roberto Colistete Jr.' +
                                  '<br>Free & Open Source :' +
                                  '<br><a href="http://www.gnu.org/licenses/lgpl-3.0.html"><b>License LGPLv3</b></a>' +
                                  '<br><br>For more information, see the web site :' +
                                  '<br><a href="http://www.RobertoColistete.net/Limit"><b>www.RobertoColistete.net/Limit</b></a>' +
                                  '<br><br><FONT COLOR="violet">In l&hearts;ving memory of my wife Lorena</FONT>'
                               } else {
                                  '<style>a:link { color: ' + Theme.primaryColor  + '; }</style>' +
                                  'Limit calculates mathematical limits symbolically<br>and numerically.' +
                                  '<br><br>This version of Limit is written using Python 3, SymPy, <br>PyOtherSide, Qt5, Qt Quick 2 (Silica Components).' +
                                  '<br><br>© 2011-2014 by Roberto Colistete Jr.' +
                                  '<br>Free & Open Source :' +
                                  '<br><a href="http://www.gnu.org/licenses/lgpl-3.0.html"><b>License LGPLv3</b></a>' +
                                  '<br><br>For more information, see the web site :' +
                                  '<br><a href="http://www.RobertoColistete.net/Limit"><b>www.RobertoColistete.net/Limit</b></a>' +
                                  '<br><br><FONT COLOR="violet">In l&hearts;ving memory of my wife Lorena</FONT>'
                              }
    }

    SilicaFlickable {
        id: aboutFlick
        anchors.fill: parent
        contentHeight: contentItem.childrenRect.height
        contentWidth: aboutFlick.width

        VerticalScrollDecorator { flickable: aboutFlick }

        Column {
            id: aboutColumn
            anchors {
                left: parent.left
                right: parent.right
                margins: Theme.paddingMedium
            }
            spacing: Theme.paddingMedium

            PageHeader {
                title: 'About Limit'
            }
            Label {
                id:title
                text: 'Limit  v' + aboutInfos.version
                font.pixelSize: Theme.fontSizeLarge
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label {
                id: slogan
                text: 'for Sailfish OS'
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Item {
                width: 1
                height: Theme.paddingMedium
            }
            Label {
                id: content
                text: aboutInfos.text
                width: aboutFlick.width
                // wrapMode: TextEdit.WordWrap
                horizontalAlignment: Text.AlignHCenter;
                font.pixelSize: Theme.fontSizeSmall
                textFormat: Text.RichText
                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingMedium
                }
                onLinkActivated: {
                    Qt.openUrlExternally(link)
                }
            }
        }
    }
}
