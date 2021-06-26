class CfgGradBuymenu {
    playersLoseMoneyOnDeath = 0;
    vehicleMarkers = 1;
    tracking = 0;
    trackingTag = "myMission";

    class HelipadStore {
		
        class airportchoppa {
            displayName = "Helicopters";
            kindOf = "Vehicles";

            // Apache
            class I_Heli_light_03_dynamicLoadout_F {
                description = "A multi-purpose utility helicopter. Has space for 6, excluding the two crew.";
                price = 280;
                stock = 5;
                code = "if (isServer) then { (_this select 2) setVehicleReceiveRemoteTargets true; (_this select 2) setVehicleReportRemoteTargets true; (_this select 2) setVehicleReportOwnPosition true; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
        };

        class airportcrew {
            displayname = "Crew";
            kindOf = "Units";

            class I_helicrew_F {
                description = "A crewmate.";
                price = 8;
                amount = 1;
                stock = 10;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this select 2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
        };

    };

    class BaseStore {
		
        class BaseStoreSoldiers {
            displayName = "Soldiers";
            kindOf = "Units";

            class I_soldier_F {
                description = "A rifleman.";
                price = 10;
                amount = 1;
                stock = 50;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_soldier_AR_F {
                description = "A rifleman with an LMG.";
                price = 11;
                amount = 1;
                stock = 40;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_Soldier_GL_F {
                description = "A rifleman with an underbarrel grenade launcher.";
                price = 11;
                amount = 1;
                stock = 30;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            // No heavy gunner for AAF
            //class B_HeavyGunner_F {
            //    description = "A soldier with a MG.";
            //    price = 13;
            //    amount = 1;
            //    stock = 30;
            //    code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            //};
            class I_soldier_M_F {
                description = "A soldier with a marksman rifle.";
                price = 15;
                amount = 1;
                stock = 20;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            // No sniper for AAF
            //class B_Sharpshooter_F {
            //    description = "A soldier with a sniper rifle.";
            //    price = 16;
            //    amount = 1;
            //    stock = 30;
            //    code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            //};
            class I_Soldier_TL_F {
                description = "A soldier with the tools to command a fireteam.";
                price = 13;
                amount = 1;
                stock = 15;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_medic_F {
                description = "A medic.";
                price = 12;
                amount = 1;
                stock = 20;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };

            class I_soldier_LAT2_F {
                description = "An anti-tank soldier carrying a light anti-tank recoilles rifle.";
                price = 13;
                amount = 1;
                stock = 30;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_soldier_LAT_F {
                description = "An anti-tank soldier carrying an anti-tank rocket launcher.";
                price = 14;
                amount = 1;
                stock = 20;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_soldier_AT_F {
                description = "An anti-tank soldier with a ATGM.";
                price = 16;
                amount = 1;
                stock = 10;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_soldier_AA_F {
                description = "An anti-tank soldier with a light SAM.";
                price = 13;
                amount = 1;
                stock = 15;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };

            class I_engineer_F {
                description = "A combat engineer.";
                price = 13;
                amount = 1;
                stock = 15;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_soldier_exp_F {
                description = "A explosive weapons specialist that can plant and disarm ordinance.";
                price = 13;
                amount = 1;
                stock = 12;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_Soldier_A_F {
                description = "An ammo bearer.";
                price = 11;
                amount = 1;
                stock = 25;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_spotter_F {
                description = "A spotter with a ghilli suit.";
                price = 15;
                amount = 1;
                stock = 10;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class B_ghillie_sard_F {
                description = "Sniper.";
                price = 20;
                amount = 1;
                stock = 5;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_soldier_UAV_F {
                description = "An UAV operator carrying a darter.";
                price = 90;
                amount = 1;
                stock = 2;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_crew_F {
                description = "A crewman.";
                price = 8;
                amount = 1;
                stock = 40;
                code = "if (isServer) then { {[_x] join _this #0; [_x, 0, ['ACE_MainActions'], as_acea_dismissUnit] call ace_interact_menu_fnc_addActionToObject;} forEach units (_this #2); [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
        };

        class BaseStoreCars {
            displayName = "Vehicles";
            kindOf = "Vehicles";

            class I_Quadbike_01_F {
                description = "A very small ATV for two.";
                price = 15;
                stock = 20;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_Truck_02_covered_F {
                description = "A tactical truck. Has space for 16 passengers, excluding the driver.";
                price = 50;
                stock = 20;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class B_LSV_01_unarmed_F {
                description = "A light strike vehicle. Has space for 7 people, including the driver.";
                price = 50;
                stock = 20;
                condition = "395180 in (getDLCs 1)";
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class B_LSV_01_armed_F {
                description = "An armed light strike vehicle. Has space for 5 people, include the driver and gunners.";
                price = 75;
                stock = 10;
                condition = "395180 in (getDLCs 1)";
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class B_LSV_01_AT_F {
                description = "An armed light strike vehicle, equipped with an ATGM. Has space for 5 people, include the driver and gunners.";
                price = 75;
                stock = 10;
                condition = "395180 in (getDLCs 1)";
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
                previewScale = 0.7;
            };
            class I_MRAP_03_F {
                description = "A lightly armored MRAP. Has space for 4 passengers, including the driver.";
                price = 65;
                stock = 20;
                previewScale = 0.8;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_MRAP_03_hmg_F {
                description = "A lightly armored MRAP, armed with a remote MG. Has space for 4 people, include the driver and gunner.";
                price = 80;
                stock = 8;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_MRAP_03_gmg_F {
                description = "A lightly armored MRAP, armed with a remote grenade launcher. Has space for 4 people, include the driver and gunner.";
                price = 100;
                stock = 8;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };

            class I_UGV_01_F {
                description = "An unmanned ground vehicle. Along with a full suite of sensors, it can transport 1 passenger.";
                price = 85;
                stock = 3;
                code = "if (isServer) then { createVehicleCrew (_this select 2); (_this select 2) setVehicleReceiveRemoteTargets true; (_this select 2) setVehicleReportRemoteTargets true;(_this select 2) setVehicleReportOwnPosition true; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"  //add AI crew, activate data links  
            };
            class I_UGV_01_rcws_F {
                description = "An unmanned ground combat vehicle. Armed with an HMG and a GMG, it can also carry 1 passenger.";
                price = 120;
                stock = 2;
                code = "if (isServer) then { createVehicleCrew (_this select 2); (_this select 2) setVehicleReceiveRemoteTargets true; (_this select 2) setVehicleReportRemoteTargets true;(_this select 2) setVehicleReportOwnPosition true; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"  //add AI crew, activate data links  
            };
            class I_UAV_01_F {
                description = "A small recon drone.";
                price = 80;
                stock = 4;
                code = "if (isServer) then { createVehicleCrew (_this select 2); (_this select 2) setVehicleReceiveRemoteTargets true; (_this select 2) setVehicleReportRemoteTargets true;(_this select 2) setVehicleReportOwnPosition true; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"  //add AI crew, activate data links  
                previewScale = 1.5;
            };
            class I_UAV_06_F {
                description = "A small utility drone, able to deliver small items.";
                price = 85;
                stock = 3;
                condition = "571710 in (getDLCs 1)";
                previewScale = 1.5;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
        };
        class BaseStoreArmored {
            displayName = "Armored Vehicles";
            kindOf = "Vehicles";

            class I_APC_Wheeled_03_cannon_F {
                description = "A wheeled Infantry Fighting Vehicle, armed with a 30mm autocannon and ATGMs. Has space for 8 passengers, excluding the driver, gunner and commander.";
                price = 140;
                stock = 6;
                vehicleInit = "[[],['showBags',1,'showBags2',1,'showTools',1]]";
                previewScale = 0.8;
                code = "if (isServer) then { [_this #2] spawn addAddComponentActions; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_APC_tracked_03_cannon_F {
                description = "A heavily armored tracked Armoured Personnel Carrier with a 30mm autocannon. Has space for 7 passengers, excluding the driver, gunner and commander.";
                price = 135;
                stock = 4;
                vehicleInit = "[[],['showBags',1 ,'showBags2',1 ,'showTools',1]]";
                previewScale = 0.8;
                code = "if (isServer) then { [_this #2] spawn addAddComponentActions; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };

            class I_MBT_03_cannon_F {
                description = "A heavily armored MBT upgraded for urban combat.";
                price = 270;
                stock = 3;
                previewScale = 0.8;
                code = "if (isServer) then { [_this #2] spawn addAddComponentActions; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };

            class I_LT_01_scout_F {
                description = "A multi-purpose Light Tank. This is the unarmed command variant, equipped with improved optics, radar and comms.";
                price = 90;
                stock = 2;
                vehicleInit = "[ [], ['showTools',1, 'showBags',1] ]";
                condition = "798390 in (getDLCs 1)";
                code = "if (isServer) then { [_this #2] spawn addAddComponentActions; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_LT_01_cannon_F {
                description = "A multi-purpose Light Tank. This is the canon variant, equipped with a 20 mm autocannon.";
                price = 140;
                stock = 3;
                vehicleInit = "[[], ['showTools',1, 'showBags',1]]";
                condition = "798390 in (getDLCs 1)";
                code = "if (isServer) then { [_this #2] spawn addAddComponentActions; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_LT_01_AT_F {
                description = "A multi-purpose Light Tank. This is the AT variant, equipped with a 12.7 mm heavy machine gun and ATGMs.";
                price = 160;
                stock = 3;
                vehicleInit = "[ [], ['showTools',1, 'showBags',1] ]";
                condition = "798390 in (getDLCs 1)";
                code = "if (isServer) then { [_this #2] spawn addAddComponentActions; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };
            class I_LT_01_AA_F {
                description = "A multi-purpose Light Tank. This is the AA variant, equipped with a 12.7 mm heavy machine gun and SAMs.";
                price = 150;
                stock = 2;
                vehicleInit = "[ [], ['showTools',1, 'showBags',1] ]";
                condition = "798390 in (getDLCs 1)";
                code = "if (isServer) then { [_this #2] spawn addAddComponentActions; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";
            };

        };

        class BaseStoreLogistics {
            displayName = "Logistics";
            kindOf = "Vehicles";

            class I_Truck_02_medical_F {
                description = "Medical support/transport variant of the heavy tactical truck. Allows better treatment of those transported. Has space for 13 passengers, excluding the driver.";
                price = 25;
                stock = 5;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_Truck_02_box_F {
                description = "A repair variant with spare parts, tools, and components of the heavy tactical truck. Allows much better repairs of other vehicles.";
                price = 25;
                stock = 5;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_Truck_02_fuel_F {
                description = "A large fuel tanker variant of the heavy tactical truck.";
                price = 25;
                stock = 5;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_Truck_02_ammo_F {
                description = "An ammunition supply variant of the heavy tactical truck, with a large semi-hexagon shaped, tarpaulin-covered container. Helps with the rearming of vehicles.";
                price = 30;
                stock = 5;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
        };

        class BaseStoreWeapons {
            displayName = "Special Weapons";
            kindOf = "Weapons";

            class srifle_EBR_SOS_F {
                description = "A marksman rifle.";
                amount = 1;
                price = 6;
                stock = 12;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage; hint format['%1',_this #1]"
            };
            class srifle_LRR_LRPS_F {
                description = "A high powered sniper rifle.";
                amount = 1;
                price = 9;
                stock = 5;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class srifle_GM6_LRPS_F {
                description = "A high powered anti-material sniper rifle.";
                amount = 1;
                price = 11;
                stock = 4;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class launch_I_Titan_short_F {
                description = "A guided anti-tank missile launcher.";
                amount = 1;
                price = 8;
                stock = 10;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };

        };
        class BaseStoreItems {
            displayName = "Special Items";
            kindOf = "Items";
            
            class optic_NVS {
                description = "A marksman scope with internal nightvision with 5x magnification.";
                amount = 1;
                price = 3;
                stock = 20;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class optic_tws {
                description = "A infrared scope with 4x-10x magnification.";
                amount = 1;
                price = 4;
                stock = 12;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class optic_nightstalker {
                description = "A high-tech multi-vision scope with 4x-10x magnification.";
                amount = 1;
                price = 6;
                stock = 9;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
        };
        class BaseStoreEquipment {
            displayName = "Special Equipment";
            kindOf = "Wearables";
            
            class U_I_GhillieSuit {
                description = "AAF Ghillie Suit.";
                amount = 1;
                price = 5;
                stock = 8;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class U_I_FullGhillie_sard {
                description = "A full AAF Semi-Arid Ghillie Suit.";
                amount = 1;
                price = 7;
                stock = 6;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class NVGogglesB_blk_F {
                description = "Advanced night-vision goggles, that include thermal vision.";
                amount = 1;
                price = 6;
                stock = 24;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class ACE_MX2A {
                description = "Thermal vision binoculars.";
                amount = 1;
                price = 2;
                stock = 24;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class I_UavTerminal {
                description = "A UAV Terminal.";
                amount = 1;
                price = 5;
                stock = 25;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class B_Respawn_TentDome_F {
                description = "Allows to set up a camp, which is can be used as a forward respawn point.";
                amount = 1;
                price = 200;
                stock = 2;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
            class H_HelmetO_ViperSP_hex_F {
                description = "Highly advanced helmet, with integrated multi-vision system.";
                amount = 1;
                price = 7;
                stock = 12;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgWeapons', 1] spawn fnc_purchaseMessage;"
            };
        };
        class BaseStatics {
            displayName = "Static Defenses";
            kindOf = "Vehicles";

            class I_HMG_01_high_F {
                description = "An HMG.";
                price = 10;
                stock = 6;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_HMG_02_high_F {
                description = "An old and trustworthy .50 cal HMG.";
                price = 7;
                stock = 12;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_static_AA_F {
                description = "A manpad SAM.";
                price = 10;
                stock = 8;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_static_AT_F {
                description = "A static ATGM.";
                price = 10;
                stock = 8;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_GMG_01_F {
                description = "A grenade machine gun.";
                amount = 1;
                price = 16;
                stock = 7;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_Mortar_01_F {
                description = "A mortar.";
                price = 100;
                stock = 2;
                code = "if (isServer) then { [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;"
            };
            class I_GMG_01_A_F {
                description = "An autonomous GMG.";
                price = 25;
                stock = 7;
                code = "if (isServer) then { createVehicleCrew (_this select 2); (_this select 2) setVehicleReceiveRemoteTargets true; (_this select 2) setVehicleReportRemoteTargets true;(_this select 2) setVehicleReportOwnPosition true; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";  //add AI crew, give UAV controls, activate data links  
            };
            class I_HMG_01_A_F {
                description = "An autonomous HMG.";
                price = 15;
                stock = 9;
                code = "if (isServer) then { createVehicleCrew (_this select 2); (_this select 2) setVehicleReceiveRemoteTargets true; (_this select 2) setVehicleReportRemoteTargets true;(_this select 2) setVehicleReportOwnPosition true; [_this #0, _this #1, 'CfgVehicles', 1] spawn fnc_purchaseMessage;};";  //add AI crew, give UAV controls, activate data links  
            };

        };

        class BaseStoreActions {
            displayName = "Base Actions";
            kindOf = "Other";

            class Land_ConnectorTent_01_AAF_closed_F {
                displayName = "Additional Tickets";
                description = "Requisiton 5 additional Respawn Tickets.";
                price = 100;
                stock = 15;
                code = "if (isServer) then { [independent, 5] call BIS_fnc_respawnTickets; [_this #0, 'Additional Tickets', '', 0] spawn fnc_purchaseMessage;};";
            };

            class I_E_Radar_System_01_F {
                displayName = "Install Radar";
                description = "Requisiton a radar.";
                price = 100;
                stock = 1;
                previewScale = 0.8;
                code = "if (isServer) then { [] spawn fnc_spawnRadar; [_this #0, 'Radar', '', 0] spawn fnc_purchaseMessage;};";
            };

        };

    };

    class GlobalStore {

        class GlobalStoreActions {
            displayName = "Actions";
            kindOf = "Other";

            class I_Mortar_01_F {
                displayName = "Mortar Strike";
                description = "Requisiton an additional mortar strike.";
                price = 80;
                stock = 10;
                previewScale = 0.8;
                code = "if (isServer) then { missionNameSpace setVariable ['MortarCharges',(missionNameSpace getVariable ['MortarCharges',0])+1]; [_this #0, 'Mortar Strike', '', 0] spawn fnc_purchaseMessage;};";
            };
            //class I_Truck_02_MRL_F {
            //    displayName = "MLR Strike";
            //    description = "Requisiton an additional MLR artillery strike.";
            //    price = 120;
            //    stock = 10;
            //    previewScale = 0.8;
            //    code = "if (isServer) then { missionNameSpace setVariable ['MlrsCharges',(missionNameSpace getVariable ['MlrsCharges',0])+1];};";
            //};
            class I_UAV_02_dynamicLoadout_F {
                displayName = "UACV Support";
                description = "Requisiton an additional UACV call-in. (Requires UAV Terminal to interface with)";
                price = 180;
                stock = 4;
                previewScale = 0.7;
                code = "if (isServer) then { missionNameSpace setVariable ['UacvCharges',(missionNameSpace getVariable ['UacvCharges',0])+1]; [_this #0, 'UACV Support', '', 0] spawn fnc_purchaseMessage;};";
            };
            class I_Plane_Fighter_03_dynamicLoadout_F {
                displayName = "CAS Support";
                description = "Requisiton an additional CAS strike.";
                price = 80;
                stock = 10;
                previewScale = 0.7;
                code = "if (isServer) then { missionNameSpace setVariable ['CasCharges',(missionNameSpace getVariable ['CasCharges',0])+1]; [_this #0, 'CAS Strike', '', 0] spawn fnc_purchaseMessage;};";
            };
        };

        class GlobalStoreReinforcements {
            displayName = "Reinforcements";
            kindOf = "Other";

            class I_soldier_F {
                displayName = "Send SAD Infantry Squad";
                description = "Have a autonomous footmobile squad advance into the area of operations and search for targets.";
                price = 70;
                stock = 12;
                code = "if (isServer) then { [indReinforcementSpawn_1, side (_this #0), getPos areaOfOperationsTrigger, triggerArea areaOfOperationsTrigger, []] call fnc_summonAoInfantrySAD; [_this #0, 'Infantry Squad Reinforcements', '', 0] spawn fnc_purchaseMessage;};";
            };
            // TODO
            //class I_Truck_02_covered_F {
            //    displayName = "Get Reinforcement";
            //    description = "A small group of soldiers will be driven to your position and join the squad.";
            //    price = 100;
            //    stock = 10;
            //    previewScale = 0.8;
            //    code = "if (isServer) then { [indReinforcementSpawn, (_this #0), ([side (_this #0),2] call fnc_defaultBoughtHelpVehicleArrays)] call fnc_boughtHelp; [_this #0, 'Motorized Squad Reinforcements', '', 0] spawn fnc_purchaseMessage;};";
            //    condition = "player inArea areaOfOperationsTrigger";
            //};
            class I_MRAP_03_hmg_F {
                displayName = "Call for Motorized Backup Team";
                description = "Call a small motorized team with an armed car to secure your current location.";
                price = 80;
                stock = 8;
                previewScale = 0.8;
                code = "if (isServer) then { [indReinforcementSpawn, (_this #0), ([side (_this #0),1] call fnc_defaultBoughtHelpVehicleArrays), 0] call fnc_boughtHelp; [_this #0, 'Motorized Backup Team', '', 0] spawn fnc_purchaseMessage;};";
                condition = "player inArea areaOfOperationsTrigger";
            };
            class I_Truck_02_transport_F {
                displayName = "Call for Motorized Backup Squad";
                description = "Call a motorized squad to secure your current location.";
                price = 80;
                stock = 8;
                previewScale = 0.8;
                code = "if (isServer) then { [indReinforcementSpawn, (_this #0), ([side (_this #0),2] call fnc_defaultBoughtHelpVehicleArrays)] call fnc_boughtHelp; [_this #0, 'Motorized Backup Squad', '', 0] spawn fnc_purchaseMessage;};";
                condition = "player inArea areaOfOperationsTrigger";
            };
            class I_APC_tracked_03_cannon_F {
                displayName = "Call for Mechanized Backup Squad";
                description = "Call a mechanized squad to secure your current location.";
                price = 170;
                stock = 6;
                previewScale = 0.8;
                code = "if (isServer) then { [indReinforcementSpawn, (_this #0), ([side (_this #0),3] call fnc_defaultBoughtHelpVehicleArrays)] call fnc_boughtHelp; [_this #0, 'Mechanized Backup Squad', '', 0] spawn fnc_purchaseMessage;};";
                condition = "player inArea areaOfOperationsTrigger";
            };
            class I_MBT_03_cannon_F {
                displayName = "Call for Armored Backup";
                description = "Call a tank to secure your current location.";
                price = 280;
                stock = 3;
                previewScale = 0.8;
                code = "if (isServer) then { [indReinforcementSpawn, (_this #0), ([side (_this #0),4] call fnc_defaultBoughtHelpVehicleArrays)] call fnc_boughtHelp; [_this #0, 'Armored Backup', '', 0] spawn fnc_purchaseMessage;};";
                condition = "player inArea areaOfOperationsTrigger";
            };

        };

    };

};