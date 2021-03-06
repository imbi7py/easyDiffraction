import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls 1.4 as Controls1
import QtQuick.Layouts 1.12

import easyAnalysis 1.0 as Generic
import easyAnalysis.Controls 1.0 as GenericControls
import easyAnalysis.App.Elements 1.0 as GenericAppElements
import easyAnalysis.App.ContentArea 1.0 as GenericAppContentArea
import easyAnalysis.App.ContentArea.Buttons 1.0 as GenericAppContentAreaButtons
import easyDiffraction 1.0 as Specific

ColumnLayout {
    property bool isFitting: true

    spacing: 0

    // Groupbox

    GenericAppElements.GroupBox {
        title: "Parameters"
        id: dataExplorerTable
        collapsible: false
        content: GenericAppElements.ColumnLayout {
            // Fitables table
            GenericAppElements.FitablesView {
                Layout.fillWidth: true
                model: Specific.Variables.fitables
                GenericAppElements.GuideWindow {
                    message: "Here you can see all the refinable parameters.\n\nYou can change their starting values manually\nor using the slider below."
                    position: "left"
                    guideCurrentIndex: 0
                    toolbarCurrentIndex: Generic.Variables.AnalysisIndex
                    guidesCount: Generic.Variables.AnalysisGuidesCount
                }
            }

            // Buttons
            GenericAppElements.RowLayout {
                //columns: 2

                GenericAppContentAreaButtons.PausePlay {
                    id: pausePlayButton
                    onClicked: {
                        Generic.Constants.proxy.refine()
                        Generic.Variables.analysisPageFinished = true
                    }
                    GenericAppElements.GuideWindow {
                        message: "Click here to start fitting." //"Click here to start or stop fitting."
                        position: "left"
                        guideCurrentIndex: 3
                        toolbarCurrentIndex: Generic.Variables.AnalysisIndex
                        guidesCount: Generic.Variables.AnalysisGuidesCount
                    }
                }

                /*
                CheckBox { enabled: false; checked: false; text: "Auto-update" }
                GenericAppContentAreaButtons.Accept {
                    enabled: false
                    text: "Accept refined parameters"
                }
                CheckBox { enabled: false; checked: true; text: "Auto-accept" }
                */
            }
        }
    }

    // Spacer

    Item { Layout.fillHeight: true }

    // Groupbox

    GenericAppElements.FlowButtons {
        documentationUrl: "https://easydiffraction.org/umanual_use.html#3.2.5.-analysis"
        goPreviousButton: GenericAppContentAreaButtons.GoPrevious {
            text: "Experiment"
            ToolTip.text: qsTr("Go to the previous step: Experiment")
            onClicked: {
                Generic.Variables.toolbarCurrentIndex = Generic.Variables.ExperimentIndex
            }
            GenericAppElements.GuideWindow {
                message: "Click here to go to the previous step: Experiment.\n\nAlternatively, you can click on the 'Experiment' button in toolbar."
                position: "top"
                guideCurrentIndex: 5
                toolbarCurrentIndex: Generic.Variables.AnalysisIndex
                guidesCount: Generic.Variables.AnalysisGuidesCount
            }
        }
        goNextButton: GenericAppContentAreaButtons.GoNext {
            text: "Summary"
            enabled: Specific.Variables.projectOpened && Generic.Variables.analysisPageFinished && Specific.Variables.refinementDone
            highlighted: Specific.Variables.refinementDone
            ToolTip.text: qsTr("Go to the next step: Summary")
            onClicked: {
                Generic.Variables.toolbarCurrentIndex = Generic.Variables.SummaryIndex
            }
            GenericAppElements.GuideWindow {
                message: "Click here to go to the next step: Summary.\n\nThis button will be enabled after fitting is done."
                position: "top"
                guideCurrentIndex: 6
                toolbarCurrentIndex: Generic.Variables.AnalysisIndex
                guidesCount: Generic.Variables.AnalysisGuidesCount
            }
        }
    }

    // Info dialog (after refinement)

    GenericControls.Dialog {
        visible: Specific.Variables.refinementDone && Boolean(Specific.Variables.refinementResult)
        title: "Refinement Results"

        Column {
            padding: 20
            spacing: 10

            Text { text: `${Generic.Variables.refinementMessage}`; font.family: Generic.Style.fontFamily; font.pixelSize: Generic.Style.fontPixelSize }
            Text { visible: Generic.Variables.chiSquared; text: `Goodness-of-fit (\u03c7\u00b2): ${Generic.Variables.chiSquared}`; font.family: Generic.Style.fontFamily; font.pixelSize: Generic.Style.fontPixelSize }
            Text { visible: Generic.Variables.numRefinedPars; text: `Num. refined parameters: ${Generic.Variables.numRefinedPars}`; font.family: Generic.Style.fontFamily; font.pixelSize: Generic.Style.fontPixelSize }
        }
    }
}

