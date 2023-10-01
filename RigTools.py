from maya import cmds as mc
import re
from maya.api import OpenMaya as om
import imp
from Jrigs import Utility
import os
import pprint

userAppDir = mc.internalVar(userAppDir = 1)
directory = os.path.join(userAppDir , '2024' , 'scripts' , 'Jrigs' , 'Controller_Asset')
ut = Utility.Utility
print(directory)

class RiggingTools(object):

    def connectRT():
        mc.undoInfo(ock = 1)
        selectobject = ut.getselect()
        if len(selectobject)>2:
            print("Please Select 2 Object")
        else:
            mc.connectAttr(selectobject[0]+ ".rotateX" , selectobject[1] + ".rotateX")
            mc.connectAttr(selectobject[0]+ ".rotateY" , selectobject[1] + ".rotateY")
            mc.connectAttr(selectobject[0]+ ".rotateZ" , selectobject[1] + ".rotateZ")
        mc.undoInfo(cck = 1)
    
    def connectTR():
        mc.undoInfo(ock = 1)
        selectobject = ut.getselect()
        if len(selectobject)>2:
            print("Please Select 2 Object")
        else:
            mc.connectAttr(selectobject[0]+ ".translateX" , selectobject[1] + ".translateX")
            mc.connectAttr(selectobject[0]+ ".translateY" , selectobject[1] + ".translateY")
            mc.connectAttr(selectobject[0]+ ".translateZ" , selectobject[1] + ".translateZ")
        mc.undoInfo(cck = 1)

    def connectScale():
        mc.undoInfo(ock = 1)
        selectobject = ut.getselect()
        if len(selectobject)>2:
            print("Please Select 2 Object")
        else:
            mc.connectAttr(selectobject[0]+ ".scaleX" , selectobject[1] + ".scaleX")
            mc.connectAttr(selectobject[0]+ ".scaleY" , selectobject[1] + ".scaleY")
            mc.connectAttr(selectobject[0]+ ".scaleZ" , selectobject[1] + ".scaleZ")
        mc.undoInfo(cck = 1)
    
    def objectToJoint():
        mc.undoInfo(ock = 1)
        selectobject = ut.getselect()
        for i in selectobject:
            mc.select(cl = 1)
            joint = mc.joint(n = i + "_jnt")
            mc.matchTransform(joint , i)
            mc.delete(i)
        mc.undoInfo(cck = 1)

    def TransfromtoWorldMatrix():
         
         mc.undoInfo(ock = 1)
         selecobject = ut.getselect()
         for i in selecobject:
            type = mc.nodeType(i)
            if not type == "joint" : mc.makeIdentity(i , scale = 1 , a = 1)
            composeMatrix = mc.createNode("composeMatrix" , n = "composeM")
            mc.connectAttr(i + ".translate" ,composeMatrix + ".inputTranslate")
            if not type == "joint" : mc.connectAttr(i + ".rotate" ,composeMatrix + ".inputRotate")
            localmatrix = om.MMatrix(mc.getAttr(composeMatrix + ".outputMatrix"))
            objectMatrix = om.MMatrix(mc.getAttr(i + ".offsetParentMatrix"))
            bake = localmatrix*objectMatrix
            mc.setAttr(i + ".offsetParentMatrix" , bake , type = 'matrix')
            Utility.Utility.resetTransfrom(str(i))
            mc.delete(composeMatrix)
            mc.select(i)
            mc.undoInfo(cck = 1)

    def CreateIKFK_System():
        #mc.file("Switch.ma" , i = 1 , UsingNamespaces = True)
        selectjoint = Utility.Utility.getselect()
        switch = []
        elem = 0
        for i in selectjoint:
            if re.search("(Switch)" , i , re.IGNORECASE):
                selectjoint.pop(elem)
                switch.append(i)
            elem = elem + 1
        round = 0
        jointikgrp = []
        jointfkgrp = []
        for i in selectjoint:
            mc.select(cl = 1)
            jointfk = mc.joint(n = i + "_FK_jnt")
            mc.select(cl = 1)
            jointik = mc.joint(n = i + "_IK_jnt")
            mc.matchTransform(jointfk , i)
            mc.matchTransform(jointik , i)
            if(round > 0):
                mc.makeIdentity(mjointfk , a = 1)
                mc.parent(jointfk , mjointfk)
                mc.makeIdentity(jointfk , a = 1)
                mc.parent(jointik , mjointik)
                mc.makeIdentity(mjointik , a = 1)
                mc.makeIdentity(jointik , a = 1)

            mjointfk = jointfk
            jointfkgrp.append(jointfk)
            mjointik = jointik
            jointikgrp.append(jointik)
            round = round + 1
        lastikjoint = len(jointikgrp)-1
        ikhandle = mc.ikHandle(sj = jointikgrp[0] , ee = jointikgrp[lastikjoint])
        mc.hide(jointfkgrp[0])
        mc.hide(jointikgrp[0])
        mc.hide(ikhandle)
        switchserch = re.compile("(Switch)" , re.IGNORECASE)
        switchAttr = mc.listAttr(switch[0])
        switchAttr = list(filter(switchserch.search , switchAttr))
        reversegrp = []
        print(switch)
        for i in jointfkgrp:
            for j in selectjoint:
                reverseNode = mc.createNode('reverse' , n = "ReverseIKFK")
                reversegrp.append(reverseNode)
                namefk = i.split("_FK_jnt")[0]
                if (namefk == j):
                    print(namefk + "Parentwith" + j)
                    cons = mc.parentConstraint(i,j)
                    attrcons = mc.listAttr(cons)
                    findattr = re.compile("("+namefk+")")
                    attrcons = list(filter(findattr.search , attrcons))
                    mc.connectAttr(switch[0] + "." + switchAttr[0] , reverseNode + ".inputX")
                    mc.connectAttr(reverseNode + ".outputX", cons[0] + "." + attrcons[0])
        
        num = 0
        
        for i in jointikgrp:
            for j in selectjoint:
                nameik = i.split("_IK_jnt")[0]
                if(nameik == j):
                    print(nameik + "Parentwith" + j)
                    consik = mc.parentConstraint(i,j)
                    attrconsik = mc.listAttr(consik)
                    findattr = re.compile("(_IK_jnt)")
                    attrconsik = list(filter(findattr.search , attrconsik))
                    print(attrconsik)
                    mc.connectAttr(switch[0] + "." + switchAttr[0] , consik[0] + "." + attrconsik[0])
                
        


    