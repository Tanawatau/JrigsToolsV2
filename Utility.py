from maya import cmds as mc
import re

class Utility(object):

    def getselect():

        selectionlist = mc.ls(sl = 1 , ap = 1)

        return selectionlist
    
    def getShapeNode(obj):

        shapenode = mc.listRelatives(obj , f = 1)

        shapename = re.compile("shape",re.IGNORECASE)

        try:
            shapenode = list(filter(shapename.search , shapenode))
        except:
            shapenode = ""

        return shapenode
    
    def getall():
        alllist = mc.ls(tr = 1)
        return alllist
    
    def Onground(self):
        mc.undoInfo(ock = 1)
        selected = Utility.getselect()
        for i in selected:
    
            mc.makeIdentity(i , a = 1)
            pivpos = mc.xform(i , q = 1 , piv = 1)
            print(pivpos)
            oripivpos = pivpos[1]
            pivpos[1] = mc.getAttr(i + ".boundingBoxMinY")
            botpoint = mc.getAttr(i + ".boundingBoxMinY")
            cenpointX = mc.getAttr(i + ".boundingBoxCenterX")
            cenpointZ = mc.getAttr(i + ".boundingBoxCenterZ")
            mc.move(0 - botpoint , i , y = 1)
            mc.move(cenpointX, 0 , cenpointZ , i + ".rotatePivot" , i + ".scalePivot")
        mc.undoInfo(cck = 1)
    
    def ObjectToCenter(self):
        mc.undoInfo(ock = 1)
        selectedobject = Utility.getselect()

        for i in selectedobject:
    
            mc.makeIdentity(i , a = 1)
            pivpos = mc.xform(i , q = 1 , piv = 1)
            print(pivpos)
            oripivpos = pivpos[1]
            pivpos[1] = mc.getAttr(i + ".boundingBoxMinY")
            botpoint = mc.getAttr(i + ".boundingBoxMinY")
            cenpointX = mc.getAttr(i + ".boundingBoxCenterX")
            cenpointZ = mc.getAttr(i + ".boundingBoxCenterZ")
            mc.move(0 - botpoint , i , y = 1)
            mc.move(cenpointX, 0 , cenpointZ , i + ".rotatePivot" , i + ".scalePivot")
            mpos = mc.xform(i , q = 1 , piv = 1)
            print(mpos)
            mc.move(0-mpos[0] , 0-mpos[1] ,0-mpos[2] ,i)
            mc.makeIdentity(i , a =1)
        mc.undoInfo(cck = 1)

    def resetTransfrom(obj):

            for j in "XYZ":
                mc.setAttr(obj +  ".scale" + j , 1)
                for k in [".translate" , ".rotate"]:
                    mc.setAttr(obj + k + j , 0)

    def renamer(namedat , Check):

        mc.undoInfo(ock = 1)
        selection = mc.ls(sl = 1)
        num = 0
        num2 = len(selection)
        newname = namedat
        for i in selection[::-1]:
            newname = namedat
            if newname == "" : newname = i
            else : newname = namedat
            posfix = ""
            hasparent = mc.listRelatives(i , parent = 1)
            if(Check == 2): 
                posfix = Utility.getType(i)
                posfix = "_" + posfix
            if hasparent : newname = newname + "_" + str(num2)
            mc.rename(i , newname + posfix)
            num = num + 1
            num2 = num2 - 1
        mc.undoInfo(cck = 1)
    
    def getType(obj):
        
        try:
            type = mc.objectType(Utility.getShapeNode(obj)[0])
        except:
            type = mc.objectType(obj)
    
        if(type == 'mesh'): return "mesh"
    
        elif(type == 'nurbsCurve'): return "Ctrl"
    
        elif(type == "locator"): return "loc"
        
        elif(type == "joint"): return "jnt"

        elif(type == "clusterHandle"): return "cluster"

        else: return "grp"

