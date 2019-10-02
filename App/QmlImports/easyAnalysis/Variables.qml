pragma Singleton
import QtQuick 2.12
import QtQuick.Window 2.12
//import Qt.labs.settings 1.1

import easyAnalysis.App.ContentArea.Buttons 1.0 as GenericAppContentAreaButtons

QtObject {

    // Main
    property int showIntro: 1 // bool doesn't work on windows
    property int showGuide: 0 // bool doesn't work on windows
    property int appMinWindowWidth: 1280
    property int appMinWindowHeight: 760
    property int appWindowWidth: appMinWindowWidth
    property int appWindowHeight: appMinWindowHeight
    property int appWindowX: 0
    property int appWindowY: 0
    property int mainAreaWidth: appWindowWidth

    // Intro page
    property int introAnimationDuration: 1000

    // Paths
    property string resourcesPath: ""
    property string originalIconsPath: ""
    property string thirdPartyIconsPath: ""
    property string qmlElementsPath: ""

    // Content area
    property int toolbarCurrentIndex: -1
    enum ToolbarIndexEnum {
        HomeIndex = 0,
        ExperimentalDataIndex = 1,
        //InstrumentModelIndex = 2,
        SampleModelIndex = 2,
        //LinkingIndex = 4,
        AnalysisIndex = 3,
        SummaryIndex = 4
    }

    // States
    property bool isDebug: true
    property bool homePageFinished: isDebug ? true : false
    property bool dataPageFinished: isDebug ? true : false
    property bool samplePageFinished: isDebug ? true : false
    //property bool instrumentPageFinished: false
    //property bool linkingPageFinished: false
    property bool analysisPageFinished: isDebug ? true : false
    property bool summaryPageFinished: isDebug ? true : false

    property bool projectOpened: false
    //property bool modelLoaded: false

    // Data arrays
    property var xPeaks: []
    property var xObs: []
    property var yObs: []
    property var syObs: []
    property var yCalc: []
    property var yPreCalc: []

}