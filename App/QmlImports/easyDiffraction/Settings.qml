pragma Singleton
import QtQuick 2.12

QtObject {

    // Application
    readonly property string appLeftName: "easy"
    readonly property string appRightName: "Diffraction"
    readonly property string appName: appLeftName + appRightName
    readonly property string appVersion: "0.3.9"
    readonly property string appDate: "17 Dec 2019"
    readonly property string appUrl: "https://easydiffraction.org"
    readonly property string appIconPath: qmlImportsDir + "/easyDiffraction/Resources/Icons/App.svg"

}
