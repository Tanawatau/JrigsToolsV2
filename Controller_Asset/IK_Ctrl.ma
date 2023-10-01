//Maya ASCII 2024 scene
//Name: IK_Ctrl.ma
//Last modified: Mon, Oct 02, 2023 03:54:14 AM
//Codeset: 1252
requires maya "2024";
requires "stereoCamera" "10.0";
requires "mtoa" "5.3.1.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2024";
fileInfo "version" "2024";
fileInfo "cutIdentifier" "202304191415-7fa20164c6";
fileInfo "osv" "Windows 11 Pro v2009 (Build: 22621)";
fileInfo "UUID" "97C485A3-4D1D-9F5F-527C-6396576F6F4A";
createNode transform -n "IK_Ctrl";
	rename -uid "149442EE-4CA6-D549-7D31-E1A1BD11D606";
createNode nurbsCurve -n "Controller_Shape_1" -p "IK_Ctrl";
	rename -uid "6D0F1EA2-418D-A05B-A6DF-3083D88FACD0";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode nurbsCurve -n "Controller_Shape_2" -p "IK_Ctrl";
	rename -uid "71A201ED-4263-B653-5A5A-CAB85E7F8EAB";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode nurbsCurve -n "Controller_Shape_3" -p "IK_Ctrl";
	rename -uid "5636E65A-4705-F04E-96D2-439227426A72";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode nurbsCurve -n "Controller_Shape_4" -p "IK_Ctrl";
	rename -uid "7FF5A38D-4015-29B6-394E-93911C185300";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.50000000000000022 1.1102230246251565e-16 0.5
		-0.16666666666666691 0 0.5
		0.16666666666666641 -2.2204460492503131e-16 0.5
		0.49999999999999972 -3.3306690738754696e-16 0.5
		;
createNode nurbsCurve -n "Controller_Shape_5" -p "IK_Ctrl";
	rename -uid "E4DBAC2B-42B2-F4C8-DF31-65BDD5364BC1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.50000000000000022 0.99999999999999967 -0.5
		0.16666666666666691 0.99999999999999978 -0.5
		-0.16666666666666641 1 -0.5
		-0.49999999999999972 1 -0.5
		;
createNode nurbsCurve -n "Controller_Shape_6" -p "IK_Ctrl";
	rename -uid "B0344E79-4061-C0AB-FD8D-2D890BA9F47A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.49999999999999978 1 -0.5
		-0.49999999999999994 0.66666666666666674 -0.5
		-0.50000000000000011 0.33333333333333348 -0.5
		-0.50000000000000022 2.2204460492503131e-16 -0.5
		;
createNode nurbsCurve -n "Controller_Shape_7" -p "IK_Ctrl";
	rename -uid "A8C1D6F7-4CE4-BB98-84E3-66B923171E9A";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.49999999999999978 -1.1102230246251565e-16 0.5
		0.49999999999999994 0.3333333333333332 0.5
		0.50000000000000011 0.66666666666666652 0.5
		0.50000000000000022 0.99999999999999978 0.5
		;
createNode nurbsCurve -n "Controller_Shape_8" -p "IK_Ctrl";
	rename -uid "841F5C67-4BA9-DF5F-10AC-179C63142071";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.50000000000000022 1.1102230246251565e-16 -0.5
		-0.16666666666666691 0 -0.5
		0.16666666666666641 -2.2204460492503131e-16 -0.5
		0.49999999999999972 -3.3306690738754696e-16 -0.5
		;
createNode nurbsCurve -n "Controller_Shape_9" -p "IK_Ctrl";
	rename -uid "C1C39A10-4977-CF20-88B4-97B7D166A2E8";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.49999999999999978 -1.1102230246251565e-16 -0.5
		0.49999999999999978 -1.1102230246251565e-16 -0.16666666666666669
		0.49999999999999978 -1.1102230246251565e-16 0.16666666666666663
		0.49999999999999978 -1.1102230246251565e-16 0.49999999999999994
		;
createNode nurbsCurve -n "Controller_Shape_10" -p "IK_Ctrl";
	rename -uid "3542A17C-440D-1E81-75D8-F59DC4D5BED7";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.50000000000000022 -1.1102230246251565e-16 0.5
		-0.50000000000000011 0.3333333333333332 0.5
		-0.49999999999999994 0.66666666666666652 0.5
		-0.49999999999999978 0.99999999999999978 0.5
		;
createNode nurbsCurve -n "Controller_Shape_11" -p "IK_Ctrl";
	rename -uid "41839A40-43BD-C88C-DAF5-93980054D0AE";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.50000000000000022 0.99999999999999989 0.5
		0.50000000000000022 0.99999999999999989 0.16666666666666669
		0.50000000000000022 0.99999999999999989 -0.16666666666666663
		0.50000000000000022 0.99999999999999989 -0.49999999999999994
		;
createNode nurbsCurve -n "Controller_Shape_12" -p "IK_Ctrl";
	rename -uid "E204BDB4-49C8-30E8-9A08-FCBC37BD64E6";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.49999999999999978 0.99999999999999989 -0.5
		-0.49999999999999994 0.66666666666666652 -0.5
		-0.50000000000000011 0.33333333333333326 -0.5
		-0.50000000000000022 0 -0.5
		;
createNode nurbsCurve -n "Controller_Shape_13" -p "IK_Ctrl";
	rename -uid "4799F840-4846-6589-4B1E-2AA335A9D146";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.49999999999999978 -3.3306690738754696e-16 -0.5
		0.49999999999999994 0.33333333333333298 -0.5
		0.50000000000000011 0.6666666666666663 -0.5
		0.50000000000000022 0.99999999999999956 -0.5
		;
createNode nurbsCurve -n "Controller_Shape_14" -p "IK_Ctrl";
	rename -uid "8D04A525-4C08-078D-D89C-748A7FB6364E";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.49999999999999978 1 0.5
		-0.49999999999999994 0.66666666666666674 0.5
		-0.50000000000000011 0.33333333333333348 0.5
		-0.50000000000000022 2.2204460492503131e-16 0.5
		;
createNode nurbsCurve -n "Controller_Shape_15" -p "IK_Ctrl";
	rename -uid "03C12953-4C0D-969F-4FFE-82B4FCDDE453";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.50000000000000022 -1.1102230246251565e-16 -0.5
		-0.50000000000000022 -1.1102230246251565e-16 -0.16666666666666669
		-0.50000000000000022 -1.1102230246251565e-16 0.16666666666666663
		-0.50000000000000022 -1.1102230246251565e-16 0.49999999999999994
		;
createNode nurbsCurve -n "Controller_Shape_16" -p "IK_Ctrl";
	rename -uid "D37050A4-43A1-63A6-A499-FAAF66C6DFE5";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.50000000000000022 0.99999999999999967 0.5
		0.16666666666666691 0.99999999999999978 0.5
		-0.16666666666666641 1 0.5
		-0.49999999999999972 1 0.5
		;
createNode nurbsCurve -n "Controller_Shape_17" -p "IK_Ctrl";
	rename -uid "58CF69CC-4851-FA52-F920-02937A5A6639";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		-0.49999999999999978 0.99999999999999989 0.5
		-0.49999999999999978 0.99999999999999989 0.16666666666666669
		-0.49999999999999978 0.99999999999999989 -0.16666666666666663
		-0.49999999999999978 0.99999999999999989 -0.49999999999999994
		;
createNode nurbsCurve -n "Controller_Shape_18" -p "IK_Ctrl";
	rename -uid "761458EC-41D8-5D07-1707-75BA96997C02";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.49999999999999978 -3.3306690738754696e-16 0.5
		0.49999999999999994 0.33333333333333298 0.5
		0.50000000000000011 0.6666666666666663 0.5
		0.50000000000000022 0.99999999999999956 0.5
		;
createNode nurbsCurve -n "Controller_Shape_19" -p "IK_Ctrl";
	rename -uid "6EAAB7C9-4247-7E4F-78BA-6D84BCBE4CC1";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode nurbsCurve -n "Controller_Shape_20" -p "IK_Ctrl";
	rename -uid "D24A6E2D-4FEB-DD61-E0F2-318662FF5033";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 1 0 no 3
		6 0 0 0 1 1 1
		4
		0.50000000000000022 0.99999999999999989 -0.5
		0.50000000000000011 0.66666666666666652 -0.5
		0.49999999999999994 0.33333333333333326 -0.5
		0.49999999999999978 0 -0.5
		;
createNode makeNurbsSquare -n "makeNurbsSquare1";
	rename -uid "58CEE11B-484D-E07F-5281-9BA4F6269DB4";
	setAttr ".nr" -type "double3" 0 1 0 ;
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
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 5 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
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
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "makeNurbsSquare1.oc4" "Controller_Shape_1.cr";
connectAttr "makeNurbsSquare1.oc2" "Controller_Shape_2.cr";
connectAttr "makeNurbsSquare1.oc1" "Controller_Shape_3.cr";
connectAttr "makeNurbsSquare1.oc3" "Controller_Shape_19.cr";
// End of IK_Ctrl.ma
