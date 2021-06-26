class CfgRoles
{
	class Crew // Class name used in CfgRespawnInventory
	{
		displayName = "Crew"; // Name of the role, displayed in the respawn menu
		icon = "\a3\weapons_f\data\ui\icon_scuba_ca.paa"; // Icon shown next to the role name in the respawn screen
	};
};

class CfgRespawnInventory 
{
	class I_Rifleman
	{
		displayName = "Rifleman";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
		role = "Default";
		show = "true";
		uniformClass = "U_I_CombatUniform";
		backpack = "B_AssaultPack_dgtl";
		weapons[] = {"arifle_Mk20_plain_F","hgun_ACPC2_F","Binocular","Throw","Put"};
		magazines[] = {"9Rnd_45ACP_Mag","Chemlight_blue","ACE_Chemlight_HiBlue","Chemlight_green","ACE_Chemlight_HiYellow","I_IR_Grenade","ACE_HandFlare_Green","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiYellow","ACE_Chemlight_HiWhite","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","I_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow","SmokeShell","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade","HandGrenade","HandGrenade","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"};
		items[] = {"ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_XL50","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_Banana","ACE_EarPlugs","ACE_DAGR","ACE_MapTools","ACE_fieldDressing","ACE_SpraypaintGreen","ACE_CableTie"};
		linkedItems[] = {"V_PlateCarrierIA1_dgtl","H_HelmetIA","","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_INDEP","","acc_pointer_IR","optic_MRCO","","","","",""};
	};

	class I_SquadLeader
	{
		displayName = "Squad Leader";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
		role = "Default";
		show = "true";
		uniformClass = "U_I_CombatUniform_shortsleeve";
		backpack = "B_AssaultPack_dgtl";
		weapons[] = {"arifle_Mk20_F","hgun_ACPC2_F","Laserdesignator_01_khk_F","Throw","Put"};
		magazines[] = {"9Rnd_45ACP_Mag","Chemlight_blue","ACE_Chemlight_HiBlue","Chemlight_green","ACE_Chemlight_HiYellow","I_IR_Grenade","ACE_HandFlare_Green","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiYellow","ACE_Chemlight_HiWhite","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","I_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow","SmokeShell","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow","HandGrenade","HandGrenade","HandGrenade","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Tracer_Yellow"};
		items[] = {"ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_XL50","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_Banana","ACE_EarPlugs","ACE_DAGR","ACE_fieldDressing","ACE_fieldDressing","ACE_MapTools","ACE_SpraypaintGreen","ACE_CableTie"};
		linkedItems[] = {"V_PlateCarrierIA2_dgtl","H_HelmetIA","G_Tactical_Clear","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_INDEP","","acc_pointer_IR","optic_MRCO","","","","",""};
	};

	class I_Grenadier
	{
		displayName = "Grenadier";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
		role = "Default";
		show = "true";
		uniformClass = "U_I_CombatUniform_shortsleeve";
		backpack = "B_FieldPack_oli";
		weapons[] = {"arifle_Mk20_GL_plain_F","hgun_ACPC2_F","ACE_VectorDay","Throw","Put"};
		magazines[] = {"9Rnd_45ACP_Mag","Chemlight_blue","ACE_Chemlight_HiBlue","Chemlight_green","ACE_Chemlight_HiYellow","I_IR_Grenade","ACE_HandFlare_Green","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiYellow","ACE_Chemlight_HiWhite","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","I_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow","SmokeShell","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand","HandGrenade","HandGrenade","HandGrenade","DemoCharge_Remote_Mag","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","UGL_FlareGreen_F","UGL_FlareRed_F","UGL_FlareWhite_F","UGL_FlareYellow_F","UGL_FlareYellow_F","ACE_HuntIR_M203","ACE_HuntIR_M203","ACE_HuntIR_M203","ACE_40mm_Flare_white","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Sand"};
		items[] = {"ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_XL50","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_Banana","ACE_EarPlugs","ACE_DAGR","ACE_fieldDressing","ACE_fieldDressing","ACE_MapTools","ACE_microDAGR","ACE_SpraypaintGreen","ACE_CableTie","ACE_Chemlight_Shield","ACE_HuntIR_monitor","ACE_Clacker"};
		linkedItems[] = {"V_PlateCarrierIAGL_dgtl","H_HelmetIA","G_Combat","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_INDEP","","acc_pointer_IR","optic_Arco","","","","",""};
	};

	class I_Medic
	{
 		displayName = "Combat Medic";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
		role = "Default";
		show = "true";
		uniformClass = "U_I_CombatUniform_shortsleeve";
		backpack = "B_Kitbag_sgg";
		weapons[] = {"arifle_Mk20_F","hgun_ACPC2_F","ACE_Yardage450","Throw","Put"};
		magazines[] = {"9Rnd_45ACP_Mag","ACE_Chemlight_HiBlue","Chemlight_green","ACE_Chemlight_HiYellow","I_IR_Grenade","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_Orange","ACE_Chemlight_White","I_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Yellow","SmokeShellPurple","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","ACE_HandFlare_Red","SmokeShellBlue","SmokeShellGreen","SmokeShellYellow","MiniGrenade","30Rnd_556x45_Stanag"};
		items[] = {"ACE_Flashlight_XL50","ACE_morphine","ACE_epinephrine","ACE_epinephrine","ACE_EarPlugs","ACE_MapTools","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_CableTie","ACE_Chemlight_Shield","ACE_IR_Strobe_Item","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_DAGR","ACE_IR_Strobe_Item","ACE_tourniquet","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_SpraypaintGreen","ACE_CableTie","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_morphine","ACE_elasticBandage","ACE_elasticBandage","ACE_elasticBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_bloodIV_250","ACE_bloodIV_250","ACE_bloodIV_250","ACE_bloodIV_250","ACE_bodyBag","ACE_bodyBag","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","ACE_epinephrine","Medikit","ACE_personalAidKit","ACE_personalAidKit","ACE_plasmaIV_250","ACE_salineIV_250","ACE_splint","ACE_splint","ACE_splint","ACE_splint","ACE_splint","ACE_surgicalKit","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet","ACE_tourniquet"};
		linkedItems[] = {"V_PlateCarrierIAGL_dgtl","H_HelmetIA","","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_INDEP","","acc_pointer_IR","optic_ACO_grn","","","","",""};
	};

	class I_LAT
	{
		displayName = "LAT Rifleman";
		icon = "\A3\Ui_f\data\GUI\Cfg\Ranks\private_gs.paa";
		role = "Default";
		show = "true";
		uniformClass = "U_I_CombatUniform";
		backpack = "B_Kitbag_sgg";
		weapons[] = {"arifle_Mk20_plain_F","launch_MRAWS_olive_rail_F","hgun_ACPC2_F","ACE_Yardage450","Throw","Put"};
		magazines[] = {"9Rnd_45ACP_Mag","Chemlight_blue","ACE_Chemlight_HiBlue","Chemlight_green","ACE_Chemlight_HiYellow","I_IR_Grenade","ACE_HandFlare_Green","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiYellow","ACE_Chemlight_HiWhite","ACE_Chemlight_Orange","Chemlight_red","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","Chemlight_yellow","I_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow","SmokeShell","9Rnd_45ACP_Mag","9Rnd_45ACP_Mag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade","HandGrenade","HandGrenade","MRAWS_HEAT_F","MRAWS_HEAT_F","MRAWS_HE_F","MRAWS_HE_F","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"};
		items[] = {"ACE_tourniquet","ACE_tourniquet","ACE_Flashlight_XL50","ACE_fieldDressing","ACE_fieldDressing","ACE_fieldDressing","ACE_morphine","ACE_epinephrine","ACE_Banana","ACE_EarPlugs","ACE_DAGR","ACE_MapTools","ACE_fieldDressing"};
		linkedItems[] = {"V_PlateCarrierIA1_dgtl","H_Cap_blk_Raven","","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_INDEP","","acc_pointer_IR","optic_MRCO","","","ACE_acc_pointer_green","",""};
	};


	class I_Tanker
	{
		displayName = "Tanker";
		icon = "\a3\weapons_f\data\ui\icon_scuba_ca.paa";
		role = "Crew";
		show = "true";
		uniformClass = "U_Tank_green_F";
		backpack = "";
		weapons[] = {"SMG_02_F","hgun_ACPC2_F","ACE_Yardage450","Throw","Put"};
		magazines[] = {"9Rnd_45ACP_Mag","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiGreen","ACE_Chemlight_Orange","ACE_Chemlight_Orange","Chemlight_red","Chemlight_red","I_IR_Grenade","I_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_White","SmokeShellBlue","SmokeShellGreen","SmokeShellPurple","SmokeShellYellow","SmokeShell","MiniGrenade"};
		items[] = {"ACE_morphine","ACE_fieldDressing","ACE_fieldDressing","ACE_Chemlight_Shield","ACE_DAGR","ACE_EarPlugs","ACE_epinephrine","ACE_Flashlight_MX991","ACE_MapTools","ACE_splint","ACE_tourniquet"};
		linkedItems[] = {"V_TacChestrig_oli_F","H_HelmetCrew_I","","ItemMap","ItemCompass","ItemWatch","ItemRadio","NVGoggles_INDEP","","acc_pointer_IR","optic_Holosight_smg_blk_F","","","","",""};
	};

	class I_HeliPilot
	{
		displayName = "Heli Pilot";
		icon = "\a3\weapons_f\data\ui\icon_scuba_ca.paa";
		role = "Crew";
		show = "true";
		uniformClass = "U_I_HeliPilotCoveralls";
		backpack = "";
		weapons[] = {"hgun_PDW2000_F","hgun_ACPC2_F","ACE_Yardage450","Throw","Put"};
		magazines[] = {"9Rnd_45ACP_Mag","Chemlight_blue","Chemlight_green","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiGreen","ACE_Chemlight_Orange","ACE_Chemlight_Orange","Chemlight_red","Chemlight_red","I_IR_Grenade","I_IR_Grenade","ACE_HandFlare_Green","ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_Red","16Rnd_9x21_Mag","16Rnd_9x21_Mag","16Rnd_9x21_Mag","9Rnd_45ACP_Mag"};
		items[] = {"ACE_morphine","ACE_fieldDressing","ACE_fieldDressing","ACE_Chemlight_Shield","ACE_DAGR","ACE_EarPlugs","ACE_epinephrine","ACE_Flashlight_MX991","ACE_MapTools","ACE_splint","ACE_tourniquet"};
		linkedItems[] = {"V_BandollierB_oli","H_PilotHelmetHeli_I","","ItemMap","ItemCompass","ItemWatch","ItemRadio","ACE_NVG_Wide","","","optic_Holosight_smg_blk_F","","","","",""};
	};

};