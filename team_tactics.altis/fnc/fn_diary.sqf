player createDiarySubject ["PO3WB","Patrol Ops WIKI"];
player createDiaryRecord ["PO3WB",["Ambient Patrols",format ["%1%2",
	if( PO3_param_ambientpatrolair ) then { "The enemy have deployed Air Patrols over the area of operations.<br/>Seek out and destroy the enemy JTAC to prevent them from orgainising their AIR FORCES<br/><br/>" }else{""},
	if( PO3_param_ambientpatrolgnd ) then { "The enemy have deployed Ground Patrols over the area.<br/>Seek out and destroy the enemy COMMANDER to prevent them from orgainising further PATROLS<br/><br/>" }else{""}
	]
]];

player createDiarySubject ["PO3WK","Information"];
player createDiarySubject ["PO3CR","About PO3"];
player createDiaryRecord ["PO3CR",["Credits","Framework Written/Compiled by Eightysix for Online Combat Battalion Tactical Missions<br/><br/>Online Combat Battalion Australia (www.ocb.net.au), their support and testing has been vital to the success.<br/>- [OCB]Dash for Code, Inpiration and Effort in helping development<br/><br/>
Language Translations By:<br/>
- Czech: -<br/>
- French: GranolaBar<br/>
- German: Senshi<br/>
- Polish: Rydygier<br/>
- Portuguese: Caico1983<br/>
- Spanish: BIG (Armaholic)<br/>
<br/>Special thanks to:<br/>
- Bohemia Interactive Stuidos for the Arma Series, code and functions<br/>
- BON_Inf for Code and Inspiration from his missions and scripts<br/>
- Shuko for Code and Inspiration from his awesome Task System and Position Scripts<br/>
- KillZoneKid for Code and Inspiration from his tutorials<br/>
- Kegety for his spectator scripting<br/>
- XENO for Code and Inspiration from Domination and setting such a high standard<br/>
- R3F for Inspiration from their Arma 2 Logistics Scripts<br/>
- Tonic for the Virtual Ammobox System<br/>
- Tajin for the Helmet Camera Scripting<br/>
- aeroson for his detailed loadout scripts<br/>
- cobra4v320 for his HALO scripting<br/>
- Kronzky for his string function library<br/>
- SaMatra for help with UI Resources and Russian Translation<br/>
- Dslyecxi for his Paper doll giving insight on how to detect item types.<br/>
- Any and All ArmA community members for support, inspiration and solutions that have helped build this framework"]];

player createDiaryRecord ["PO3CR",["Version",format["MultiPlayer Scripting Framework<br/>Version %1",localize "STR_PO3_VERSION"]]];

player createDiaryRecord ["PO3WK",["Tasks","
Taskmaster System<br/>
Access by pressing ""J"" or in the tasks menu from the map screen.<br/
This shows all the tasks assigned to you and your team with the status of those tasks.<br/>
<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa' width='25px'/> Status: Active - Colour: White<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIconCanceled_ca.paa' width='25px'/> Status: Canceled - Colour: Grey<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa' width='25px'/> Status: Failed - Colour: Red<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa' width='25px'/> Status: Succeeded - Colour: Green<br/>"]];

//player createDiaryRecord ["PO3WK",["Support","Support Requests are Work in Progress"]];

player createDiaryRecord ["PO3WK",["Squad Markers",format["Squad Marker System<br/><br/>Any Squad friendly to your side is marked on the map via their respective icon.<br/><br/>The icon shows you what vehicle their team leader has occupied.<br/><img image='%1' width='25px'/> - Infantry<br/><img image='%2' width='25px'/> - Armour<br/><img image='%3' width='25px'/> - Helicopter<br/><img image='%4' width='25px'/> - Mechanised: <br/><img image='%5' width='25px'/> - Motorised<br/><img image='%6' width='25px'/> - Plane<br/><img image='%7' width='25px'/> - Static Weapon<br/><img image='%8' width='25px'/> - UAV<br/>",["n_inf"] call PO3_fnc_getCfgIcon,["n_armor"] call PO3_fnc_getCfgIcon,["n_air"] call PO3_fnc_getCfgIcon,["n_mech_inf"] call PO3_fnc_getCfgIcon,["n_motor_inf"] call PO3_fnc_getCfgIcon,["n_plane"] call PO3_fnc_getCfgIcon,["n_art"] call PO3_fnc_getCfgIcon,["n_uav"] call PO3_fnc_getCfgIcon] ] ];

player createDiaryRecord ["PO3WK",["Spectator","
Spectator System<br/>
<br/>
The spectator system is a version of Kegetys Spectator Script and is only accessible upon death.<br/>
Click at the camera/target text at the top to open camera/target menus.<br/>
Units on the map can be clicked to target them<br/>
<br/>
Keyboard controls:<br/>
A/D - Previous/Next target<br/>
W/S - Previous/Next camera<br/>
1-5 - Direct camera change<br/>
N - 3D view: Toggle night vision on/off<br/>
N - Full map: Toggle marker text off/names/types<br/>
T - Toggle unit tags on/off<br/>
F - Toggle AI filter on/off<br/>
G - Toggle Group/Formation Leader filter on/off<br/>
H - Toggle Map Markers Updates on/off<br/>
Tab - Toggle UI on/off<br/>
M - Toggle map on/full/off<br/>
Numpad plus/minus - Increase/decrease full map marker size<br/>
Space - Drop camera (W,S,A,D keys = movement)<br/>
Space - Toggle gunsight (1st person view)<br/>
Esc - Butterfly mode<br/>
<br/>
Mouse controls:<br/>
Right button - Rotate camera (free camera mode only)<br/>
Left button - Move camera<br/>
Left and right button - Zoom"]];

player createDiaryRecord ["PO3WK",["Redeployment","
Redeployment System<br/>
<br/>
A player can redeploy at any redeployment point or if killed and they have enough lives left to continue.<br/>
Players may also have the option to deploy a rally point that will enable them to redeploy to that specific location if the rallypoint remains.<br/>
Players may also have the option to redploy by HALO jump. Instructions are below.<br/>
<br/>
The avaiable positions are listed on the left side of the tablet.<br/>
Double click or select & accept a specfic position to redeploy to that location.<br/>
<br/>
Aircraft Vehicles can only be redeployed to if:<br/>
 - The aircraft has enough cargo capacity<br/>
 - The aircraft is greater than 50 metres ABOVE the terrain.<br/>
Sea Vehicles can only be redeployed to if:<br/>
 - The Vehicle has enough cargo capacity<br/>
  - The vehicle is stationary<br/>
Land Vehicles can only be redeployed to if:<br/>
 - The Vehicle has enough cargo capacity<br/>
 - The vehicle is stationary<br/>
<br/>
Players can also redploy by HALO if the mission allows this and they are over the minimum amount of time between jumps.<br/>
To HALO, select HALO from the left menu and double click on a location on the map to begin the jump."]];
/*
player createDiaryRecord ["PO3WK",["NCWS","
Info about the Network Centric Warefare System
"]];
player createDiaryRecord ["PO3WK",["Medical","
Medical System<br/>
<br/>
If a player has recieved too much damage, they will go into an unconcious state.<br/>
They can be brought to concious again by team mates through the First Aid Interaction,<br/>
however require medical attention before being fully operational again.<br/>
"]];
*/
player createDiaryRecord ["PO3WK",["Logistics","
Vehicle Logistics System<br/>
<br/>
Resupply of a vehicle will repair, refuel and rearm the vehicle back to its full state. This can be done near any object designated as a resupply point.<br/>
</br>
Loading and Transportation.<br/>
Objects can be loaded into containers and vehicles and will remain there until it is unloaded or the vehicle is destroyed. This includes ammoboxes.<br/>
Players can drag lighter objects around allowing them to create bases and move ammo crates to better positions.<br/>
</br>
Air Drops<br/>
Cargo Helicopters and Planes can be loaded with ammoboxes or other vehicles and these can be air dropped over an area at heights greater than 100 metres.<br/>
Cargo Helicopter: Hover over the object and select the action to lift. If there is no action, the object is too heavy.<br/>
Cargo Planes: Move the object to the rear of the plane and load the object inside. The pilot will then have the action to air drop the object when they are above 150m over the terrain or water.<br/>"]];

player createDiaryRecord ["PO3WK",["IEDs","
IED System<br/>
<br/>
In the latest version, IEDs are dangerous to both Infantry and Vehicles.<br/>
They can be disguised as almost anything, from a rubbish pile, a can or even a whole vehicle.<br/>
<br/>
If you suspect an object is an IED, dismount from the vehicle and approach the object by crawling towards it. This will often prevent any trigger of the IED.<br/>
To disarm the IED, aim at the IED and select ""Disarm IED"" from your action menu.<br/>
If you are not an engineer, you have a risk of failure. This will result in the IED detonating.<br/>
Alternately you can just set a C4 explosive next to it and detonate it once clear.
"]];

player createDiaryRecord ["PO3WK",["HUD","The Player Hud<br/><br/>The hud allows you to set your view distance options, terrain detail and density and toggle the 3D names that appear above each of nearby players.<br/>These options can be disabled by the mission admin."]];