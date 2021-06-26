playMusic ( 
	switch ( round ( random 31) ) do {
		case 0 : {"OM_Music01"};
		case 1 : {"OM_Music02"};
		case 2 : {"LeadTrack04_F"};
		case 3 : {"LeadTrack02_F_EXP"};
		case 4 : {"LeadTrack06_F"};
		case 5 : {"LeadTrack02_F_Bootcamp"};
		case 6 : {"LeadTrack01_F_Malden"};
		case 7 : {"LeadTrack02_F_Malden"};
		case 8 : {"LeadTrack02_F_Mark"};
		case 9 : {"OM_Music01"};
		case 10 : {"OM_Intro"};
		case 11 : {"LeadTrack02_F"};
		case 12 : {"AmbientTrack03_F"};
		case 13 : {"LeadTrack02_F_EPA"};
		case 14 : {"LeadTrack01_F_Tank"};
		case 15 : {"LeadTrack05_F_Tank"};
		case 16 : {"LeadTrack01_F"};
		case 17 : {"LeadTrack01_F_6th_Anniversary_Remix"};
		case 18 : {"LeadTrack04_F_EXP"};
		case 19 : {"LeadTrack01_F_EXP"};
		case 20 : {"LeadTrack01_F_Heli"};
		case 21 : {"LeadTrack01a_F_EXP"};
		case 22 : {"LeadTrack01b_F_EXP"};
		case 23 : {"LeadTrack01c_F_EXP"};
		case 24 : {"LeadTrack01_F_Orange"};
		case 25 : {"LeadTrack01_F_Mark"};
		case 26 : {"LeadTrack01_F_Bootcamp"};
		case 27 : {"LeadTrack01a_F"};
		case 28 : {"LeadTrack01b_F"};
		case 29 : {"LeadTrack01_F_Curator"};
		case 30 : {"Track10_StageB_action"};
		case 31 : {"Track02_SolarPower"};
	}
);
addMusicEventHandler["MusicStop",{
	playMusic (
		switch(round(random 31)) do {
			case 0 : {"OM_Music01"};
			case 1 : {"OM_Music02"};
			case 2 : {"LeadTrack04_F"};
			case 3 : {"LeadTrack02_F_EXP"};
			case 4 : {"LeadTrack06_F"};
			case 5 : {"LeadTrack02_F_Bootcamp"};
			case 6 : {"LeadTrack01_F_Malden"};
			case 7 : {"LeadTrack02_F_Malden"};
			case 8 : {"LeadTrack02_F_Mark"};
			case 9 : {"OM_Music01"};
			case 10 : {"OM_Intro"};
			case 11 : {"LeadTrack02_F"};
			case 12 : {"AmbientTrack03_F"};
			case 13 : {"LeadTrack02_F_EPA"};
			case 14 : {"LeadTrack01_F_Tank"};
			case 15 : {"LeadTrack05_F_Tank"};
			case 16 : {"LeadTrack01_F"};
			case 17 : {"LeadTrack01_F_6th_Anniversary_Remix"};
			case 18 : {"LeadTrack04_F_EXP"};
			case 19 : {"LeadTrack01_F_EXP"};
			case 20 : {"LeadTrack01_F_Heli"};
			case 21 : {"LeadTrack01a_F_EXP"};
			case 22 : {"LeadTrack01b_F_EXP"};
			case 23 : {"LeadTrack01c_F_EXP"};
			case 24 : {"LeadTrack01_F_Orange"};
			case 25 : {"LeadTrack01_F_Mark"};
			case 26 : {"LeadTrack01_F_Bootcamp"};
			case 27 : {"LeadTrack01a_F"};
			case 28 : {"LeadTrack01b_F"};
			case 29 : {"LeadTrack01_F_Curator"};
			case 30 : {"Track10_StageB_action"};
			case 31 : {"Track02_SolarPower"};
		}
	);
	}
];

[
	player,
	"GlobalStore",
	baseBuypoint,
	baseBuyPoint,
	"Global Requisition",
	"Global Requisition Menu",
	{(side player == independent)},
	[0,0,0],["_distance",3],
	["ACE_SelfActions"],
	independent
] call grad_lbm_fnc_addInteraction;