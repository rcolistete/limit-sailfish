import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Silica.theme 1.0


Page {
    id: page

    allowedOrientations: limitScreenOrientation

    Item {
        id: helpInfos
        property string text: if(orientation === Orientation.Portrait) {
                                  '<style>a:link { color: ' + Theme.primaryColor  + '; }</style>' +
                                  '<i>Mathematical operators :</i>' +
                                  '<br>+ - * / ** (power)' +
                                  '<br><br><i>Examples of functions :</i>' +
                                  '<br>sqrt, exp, log, sin, acos' +
                                  '<br><br><i>Examples of expressions :</i>' +
                                  '<br>1/x, sin(x)/x, exp(-x),' + '<br>(7*x**2-4*x+2)/(5*x**2+9)' +
                                  '<br><br><i>Examples of variables (beta and<br>gamma can\'t be variables because<br>they are already used as functions) :</i>' +
                                  '<br>x, t, delta, epsilon, Omega' +
                                  '<br><br><i>Examples of points :</i>' +
                                  '<br>0, a, -oo, pi/2' +
                                  '<br><br>Look at the SymPy site :</FONT>' +
                                  '<br><a href="http://sympy.org"><b>http://sympy.org</b></a>'
                             } else {
                                  '<style>a:link { color: ' + Theme.primaryColor  + '; }</style>' +
                                  '<i>Mathematical operators :</i>' +
                                  '<br>+ - * / ** (power)' +
                                  '<br><br><i>Examples of functions :</i>' +
                                  '<br>sqrt, exp, log, sin, acos' +
                                  '<br><br><i>Examples of expressions :</i>' +
                                  '<br>1/x, sin(x)/x, exp(-x), (7*x**2-4*x+2)/(5*x**2+9)' +
                                  '<br><br><i>Examples of variables (beta and gamma can\'t be variables <br>because they are already used as functions) :</i>' +
                                  '<br>x, t, delta, epsilon, Omega' +
                                  '<br><br><i>Examples of points :</i>' +
                                  '<br>0, a, -oo, pi/2' +
                                  '<br><br>Look at the SymPy site :</FONT>' +
                                  '<br><a href="http://sympy.org"><b>http://sympy.org</b></a>'
                             }
    }

    SilicaFlickable {
         id: helpFlick
         anchors.fill: parent
         contentHeight: contentItem.childrenRect.height
         contentWidth: helpFlick.width

         VerticalScrollDecorator { flickable: helpFlick }

         Column {
             id: helpColumn
             anchors {
                 left: parent.left
                 right: parent.right
                 margins: Theme.paddingLarge
             }
             spacing: Theme.paddingLarge

             PageHeader {
                 title: qsTr('Help on Limit')
             }
             Label {
                 id: content
                 text: helpInfos.text
                 textFormat: Text.RichText
                 width: helpFlick.width
                 horizontalAlignment: Text.AlignHCenter;
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
