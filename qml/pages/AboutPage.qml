import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0


Page {
    id: page

     Item {
        id: aboutInfos
        property string version:'0.7'
        property string text:'<style>a:link { color: ' + Theme.primaryColor  + '; }</style>' +
                             '<p align="justify">Limit calculates mathematical limits symbolically (in future versions, also numerically) with arbitrary number of digits.</p>' +
                             '<p align="justify">This version of Limit is written using Python, SymPy, PyOtherSide, Qt5, Qt Quick 2 (Silica Components).</p>' +
                             '<center><br>© 2011-2014 by Roberto Colistete Jr.</center>' +
                             '<center>Free & Open Source :</center>' +
                             '<center><a href="http://www.gnu.org/licenses/lgpl-3.0.html"><b>License LGPLv3</b></a></center>' +
                             '<center><br>For more information, see the web site :</center>' +
                             '<center><a href="http://www.RobertoColistete.net/Limit"><b>www.RobertoColistete.net/Limit</b></a></center>' +
                             '<center><br><FONT COLOR="violet">In l&hearts;ving memory of my wife Lorena</FONT></center>'
    }

    SilicaFlickable {
        id: aboutFlick
        anchors.fill: parent
        contentHeight: contentItem.childrenRect.height
        contentWidth: aboutFlick.width

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
                wrapMode: TextEdit.WordWrap
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
