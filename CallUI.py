from PySide2.QtCore import *
from PySide2.QtGui import *
from PySide2.QtWidgets import *
from Jrigs import Ctrl_Script
from Jrigs import UI
import imp
from Jrigs import Utility
from maya import cmds as mc
from Jrigs import RigTools
from maya import OpenMayaUI as omui
from shiboken2 import wrapInstance
import pymel.core as pm

imp.reload(RigTools)
imp.reload(Utility)
imp.reload(Ctrl_Script)
imp.reload(UI)

def getmayaMainwindow():
    win = omui.MQtUtil.mainWindow()
    ptr = wrapInstance(int(win), QMainWindow)
    return ptr


class Ui_Dialogs(QDialog):

    def __init__(self):
        
        parent = getmayaMainwindow()
        super(Ui_Dialogs,self).__init__(parent = parent)

        
        parent = QDialog(parent = getmayaMainwindow())
        parent.setObjectName("JRigsToolsV2")
        parent.setWindowTitle("JRigsToolsV2")
        layout = QVBoxLayout(parent)

        self.setupUi(self)
        self.connectSignal()

    def setupUi(self, Dialog):
        UI.Ui_Dialog.setupUi(self,Dialog)

    def retranslateUi(self,Dialog):
        UI.Ui_Dialog.retranslateUi(self,Dialog)
    
    def connectSignal(self):
        self.MergeCurve_Bt.clicked.connect(Ctrl_Script.Ctrl.mergeCurve)
        self.LinewidthLE.setText("1")
        self.ChangeLW_Bt.clicked.connect(lambda: Ctrl_Script.Ctrl.ChangeLineWidth(self.LinewidthLE.text()))
        listcurev = Utility.Utility.getselect()
        if listcurev: self.currentColor()
        else : self.ColorPattlet_Bt.setStyleSheet("QPushButton""{""background : rgb(  0, 4 , 96 )""}")
        self.ColorPattlet_Bt.clicked.connect(self.colorpicker)
        self.ResetLWC_Bt.clicked.connect(self.resetColor)
        self.Match_Ctrl_BT.clicked.connect(lambda : Ctrl_Script.Ctrl.MatchCtrl(self.Search_MatchCtrl_LE.text() , self.MatchCtrlJointOrient_CB.currentText()))
        self.ObjToJnt_Bt.clicked.connect(RigTools.RiggingTools.objectToJoint)
        self.ConnectTF_Bt.clicked.connect(RigTools.RiggingTools.connectTR)
        self.Connect_ScaleBt.clicked.connect(RigTools.RiggingTools.connectScale)
        self.ConnectRT_Bt.clicked.connect(RigTools.RiggingTools.connectRT)
        self.ObjectToCenterScene_Bt.clicked.connect(Utility.Utility.ObjectToCenter)
        self.TfToWM_Bt.clicked.connect(RigTools.RiggingTools.TransfromtoWorldMatrix)
        self.Renamer_Button.clicked.connect(lambda :Utility.Utility.renamer(self.Name_LE.text(),self.AutoPosfix_CB.checkState()))
        self.ConnectIKFKSwitchBT.clicked.connect(RigTools.RiggingTools.CreateIKFK_System)
        self.ImportSwitchCtrl_BT.clicked.connect(lambda :Ctrl_Script.Ctrl.importCtrl("Switch_Ctrl",self.MatchWithSearch_CB.checkState(),self.MatchCtrlJointOrient_CB.currentText()))
        self.ImportFKCtrl_BT.clicked.connect(lambda :Ctrl_Script.Ctrl.importCtrl("FK_Ctrl",self.MatchWithSearch_CB.checkState(),self.MatchCtrlJointOrient_CB.currentText()))
        self.ImportIK_BT.clicked.connect(lambda :Ctrl_Script.Ctrl.importCtrl("IK_Ctrl",self.MatchWithSearch_CB.checkState(),self.MatchCtrlJointOrient_CB.currentText()))
        self.ObjectOnground.clicked.connect(Utility.Utility.Onground)

    
    def colorpicker(self):
        
        rgbV = mc.colorEditor()
        rgbV = mc.colorEditor(q= 1 , rgb = 1)
        print(rgbV)
        R = int(rgbV[0]*255)
        G = int(rgbV[1]*255)
        B = int(rgbV[2]*255)
        Ctrl_Script.Ctrl.ChangeColor(rgbV)
        self.ColorPattlet_Bt.setStyleSheet(
            "QPushButton"
                "{"
                    
                    "background : rgb("+str(R) + "," + str(G) + "," + str(B) +")"
                
                "}")
    
    def currentColor(self):
        overrideenabled = 0
        listcurve = Utility.Utility.getselect()
        for i in listcurve:
            listshape = Utility.Utility.getShapeNode(i)
            for j in listshape:
                currentcolorR = mc.getAttr(j + ".overrideColorR")
                currentcolorG = mc.getAttr(j + ".overrideColorG")
                currentcolorB = mc.getAttr(j + ".overrideColorB")
                overrideenabled = mc.getAttr(j + ".overrideEnabled")

        if(overrideenabled == 0):
            self.ColorPattlet_Bt.setStyleSheet("QPushButton""{""background : rgb(  0, 4 , 96 )""}")
        else:
            self.ColorPattlet_Bt.setStyleSheet("QPushButton""{""background : rgb( "+str(int(currentcolorR*255))+" , "+str(int(currentcolorG*255))+" , "+str(int(currentcolorB*255))+")""}")

    def resetColor(self):
        Ctrl_Script.Ctrl.ResetLWLC()
        self.ColorPattlet_Bt.setStyleSheet("QPushButton""{""background : rgb(  0, 4 , 96 )""}")

def showui():
    ui = Ui_Dialogs()
    ui.show()
    return ui

