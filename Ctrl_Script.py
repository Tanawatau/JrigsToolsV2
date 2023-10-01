from maya import cmds as mc
import re
from Jrigs import Utility
import imp
import logging
import os
import pprint
from Jrigs import UI

userAppDir = mc.internalVar(userAppDir = 1)
directory = os.path.join(userAppDir , '2024' , 'scripts' , 'Jrigs' , 'Controller_Asset')
ut = Utility.Utility
print(directory)

imp.reload(Utility)

ut = Utility.Utility

class Ctrl(object):

    def mergeCurve():
        mc.undoInfo(ock = 1)
        listcurve = ut.getselect()
        print (listcurve)
        grp = mc.group(em = 1 , n = "New_Ctrl")

        for i in listcurve:
            mc.makeIdentity(i , a = 1)
            listshape = ut.getShapeNode(i)

            for j in listshape:
                newname = mc.rename(j , "Controller_Shape_#")
                if (mc.nodeType(newname) == "nurbsCurve"):
                    mc.parent(newname ,grp , r = 1 , s = 1)
            mc.delete(i)
        mc.undoInfo(cck = 1)

    def ChangeLineWidth(point):
        px = int(point)
        print(px)
        listcurve = ut.getselect()
        for i in listcurve:
            listshape = ut.getShapeNode(i)
            for j in listshape:
                mc.setAttr(j + ".lineWidth" , px)

    def ChangeColor(RGB):
        mc.undoInfo(ock = 1)
        listcurve = ut.getselect()
        for i in listcurve:
            listshape = ut.getShapeNode(i)
            for j in listshape:
                mc.setAttr(j + ".overrideEnabled" , 1)
                mc.setAttr(j + ".overrideRGBColors" , 1)
                mc.setAttr(j + ".overrideColorRGB" , float(RGB[0]) , float(RGB[1]) , float(RGB[2]))
        mc.undoInfo(cck = 1)

    def MatchCtrl(SearchData , Orient):
        mc.undoInfo(ock = 1)
        if SearchData:
            listcurve = ut.getselect()
            print("Match Activate")
            dat = re.compile("("+ SearchData +")" , re.IGNORECASE)
            all = mc.ls(type = 'joint')
            matchlist = list(filter(dat.search , all))
            
            for i in matchlist:
                dup = mc.duplicate(listcurve[0])
                dup = mc.rename(dup , i + "_Ctrl")
                if (Orient == "X"): 
                    mc.setAttr(dup + ".rotateZ" , 90)
                elif (Orient == "Y"):
                    mc.setAttr(dup + ".rotateZ" , 0)
                elif(Orient == "Z"):
                    mc.setAttr(dup + ".rotateX" , -90)
                mc.makeIdentity(dup , a = 1)
                mc.matchTransform(dup , i)
        else :
            logging.warning("Please input Search Data")
        mc.undoInfo(cck = 1)
            
            

    
    def ResetLWLC():
        mc.undoInfo(ock = 1)
        listcurve = ut.getselect()
        for i in listcurve:
            listshape = ut.getShapeNode(i)
            for j in listshape:
                mc.setAttr(j + ".overrideRGBColors" ,0)
                mc.setAttr(j + ".lineWidth" , 1)
        mc.undoInfo(cck = 1)

    def importCtrl(importObj, matchwithsearchcb , orient ,Dir = directory):
        print(directory)

        if importObj == "Switch_Ctrl": mc.file(Dir + "\Switch.ma" , i = 1 , usingNamespaces = 1)
        
        elif importObj == "FK_Ctrl": mc.file(Dir +"\FK_Ctrl.ma" , i = 1 , usingNamespaces = 1)

        elif importObj == "IK_Ctrl" : mc.file(Dir +"\IK_Ctrl.ma" , i = 1 , usingNamespaces = 1)

        if matchwithsearchcb == 2 :
            
            mc.select(importObj)
            Ctrl.MatchCtrl(SearchData = importObj.split("_Ctrl")[0] , Orient = orient)
