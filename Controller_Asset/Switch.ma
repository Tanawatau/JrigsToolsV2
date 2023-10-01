//Maya ASCII 2024 scene
//Name: Switch.ma
//Last modified: Sun, Oct 01, 2023 05:52:06 PM
//Codeset: 1252
requires maya "2024";
requires "mtoa" "5.3.1.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2024";
fileInfo "version" "2024";
fileInfo "cutIdentifier" "202304191415-7fa20164c6";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 22621)";
fileInfo "UUID" "ED965E53-43F8-97F7-4C85-219D02D6B7B4";
createNode transform -n "Switch_Ctrl";
	rename -uid "C30BF945-4AF7-80E4-0F37-3A8D13077035";
	addAttr -ci true -sn "Switch" -ln "Switch" -min 0 -max 1 -at "double";
	setAttr -k on ".Switch";
createNode nurbsCurve -n "Controller_Shape_1" -p "Switch_Ctrl";
	rename -uid "891F16E4-46B0-B197-2D68-3FA88EE17970";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 10 2 no 3
		11 0 1 2 3 4 5 6 7 8 9 10
		11
		-0.45304136276245127 2.3889259338378905 0
		-1.7879504203796388 2.3889259338378905 0
		-1.7879504203796388 0 0
		-1.4489751815795899 0 0
		-1.4489751815795899 1.0846941947937012 0
		-0.61284294128417982 1.0846941947937012 0
		-0.61284294128417982 1.3348760604858398 0
		-1.4489751815795899 1.3348760604858398 0
		-1.4489751815795899 2.1355043411254884 0
		-0.45304136276245127 2.1355043411254884 0
		-0.45304136276245127 2.3889259338378905 0
		;
createNode nurbsCurve -n "Controller_Shape_2" -p "Switch_Ctrl";
	rename -uid "18494397-4FFB-25C3-594D-DFB479CB3517";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 11 2 no 3
		12 0 1 2 3 4 5 6 7 8 9 10 11
		12
		-0.51128921508789071 2.3889259338378905 0
		-0.82927274703979492 2.3889259338378905 0
		-0.82927274703979492 0 0
		-0.51128921508789071 0 0
		-0.51128921508789071 1.210611629486084 0
		0.53307447433471677 0 0
		0.96150407791137704 0 0
		-0.1394545555114747 1.2490910530090333 0
		0.79628114700317376 2.3889259338378905 0
		0.45558671951293939 2.3889259338378905 0
		-0.51128921508789071 1.2138182640075685 0
		-0.51128921508789071 2.3889259338378905 0
		;
createNode nurbsCurve -n "Controller_Shape_3" -p "Switch_Ctrl";
	rename -uid "F4335598-434D-75E8-0DE7-0CA8D24EDF08";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 4 2 no 3
		5 0 1 2 3 4
		5
		-1.4505950450897218 2.3889259338378905 0
		-1.7895702600479126 2.3889259338378905 0
		-1.7895702600479126 0 0
		-1.4505950450897218 0 0
		-1.4505950450897218 2.3889259338378905 0
		;
createNode nurbsCurve -n "Controller_Shape_4" -p "Switch_Ctrl";
	rename -uid "ACA8A97F-4AFA-4969-811D-61AF0FECC30E";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		1 11 2 no 3
		12 0 1 2 3 4 5 6 7 8 9 10 11
		12
		0.31515703201293938 2.3889259338378905 0
		-0.0028264045715332923 2.3889259338378905 0
		-0.0028264045715332923 0 0
		0.31515703201293938 0 0
		0.31515703201293938 1.210611629486084 0
		1.3595206260681154 0 0
		1.7879504203796388 0 0
		0.68699178695678709 1.2490910530090333 0
		1.6227274894714356 2.3889259338378905 0
		1.2820330619812013 2.3889259338378905 0
		0.31515703201293938 1.2138182640075685 0
		0.31515703201293938 2.3889259338378905 0
		;
createNode reverse -n "Reverse_Switch_Value";
	rename -uid "E183160B-4767-9A1C-6AB5-0295D0450815";
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
	setAttr ".rtfm" 1;
select -ne :renderPartition;
	setAttr -s 3 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 6 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
select -ne :defaultRenderingList1;
select -ne :standardSurface1;
	setAttr ".bc" -type "float3" 0.40000001 0.40000001 0.40000001 ;
	setAttr ".sr" 0.5;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :defaultColorMgtGlobals;
	setAttr ".cfe" yes;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya2022-default/config.ocio";
	setAttr ".vtn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".vn" -type "string" "ACES 1.0 SDR-video";
	setAttr ".dn" -type "string" "sRGB";
	setAttr ".wsn" -type "string" "ACEScg";
	setAttr ".otn" -type "string" "ACES 1.0 SDR-video (sRGB)";
	setAttr ".potn" -type "string" "ACES 1.0 SDR-video (sRGB)";
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr "Reverse_Switch_Value.ox" "Controller_Shape_1.v";
connectAttr "Switch_Ctrl.Switch" "Controller_Shape_2.v";
connectAttr "Switch_Ctrl.Switch" "Controller_Shape_3.v";
connectAttr "Reverse_Switch_Value.ox" "Controller_Shape_4.v";
connectAttr "Switch_Ctrl.Switch" "Reverse_Switch_Value.ix";
connectAttr "Reverse_Switch_Value.msg" ":defaultRenderUtilityList1.u" -na;
// End of Switch.ma
