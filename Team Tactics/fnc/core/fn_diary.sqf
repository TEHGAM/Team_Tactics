player createDiarySubject ["PO3WB","Patrol Ops Вики"];
player createDiaryRecord ["PO3WB",["Силы противника",format ["%1%2",
	if( PO3_param_ambientpatrolair ) then { "На территории операции присутствуют воздушные силы противника.<br/>Нужно найти и уничтожить вражескую JTAC, чтобы деорганизовать воздушные силы противника.<br/><br/>" }else{""},
	if( PO3_param_ambientpatrolgnd ) then { "На территории операции присутствуют вражеские патрули.<br/>Найдите и уничтожьте вражеского командира(COMMANDER), чтобы внести разлад в действия наземных сил противника.<br/><br/>" }else{""}
	]
]];

player createDiaryRecord ["diary", ["Ограничения","Воздушная техника<br/><br/>
1. Пилоты боевых вертолетов могут управлять обоими типами вертолетов(транспортными и боевыми).<br/>
2. Пилоты транспортных вертолетов могут управлять только транспортными вертолетами.<br/>
3. Пилоты самолетов могут управлять только боевыми самолетами.<br/><br/>
Наземная техника<br/><br/>
Ограничения введены только на некоторые виды техники, такие как М4, М2А4, РСЗО М5, IFV-6A.<br/>
На места механика, командира, стрелка могут садиться только солдаты таких классов как:<br/>
1. Командир<br/>
2. Член экипажа<br/>
3. Механик<br/>
Для того, чтобы иметь возможность пользоваться специальной техникой, вы должны занять соответствующий слот.
Остальная техника находится в свободном доступе."]];
player createDiaryRecord ["diary", ["Поддержка","Ремонт, дозаправка техники<br/><br/>
Отремонтировать технику, пополнить ее БК и заправиться можно на базе. У ангара стоит специализированный грузовик HEMTT. Чтобы отремонтировать/заправить технику,
подъедьте к нему на близкое расстояние и активируйте появившуюся опцию из контекстного меню -Resupply-. Через некоторое время ваша техника
полностью отремонтируется, дозаправится и восполнит БК.<br/>
Для ремонта авиации удобнее использовать точно такой же грузовик, который находится возле ВПП.<br/><br/>

В полевых условиях можно пользоваться тремя стандартными грузовиками, которые изначально находятся на базе возле ангаров. Они предоставляют точно такие же возможности по
ремонту и заправке техники, как и стационарный грузовик на базе, но по отдельности.<br/><br/>
Пехота<br/><br/>
Для пополнения БК пехоты в бою можно использовать специальные ящики с боеприпасами. Их можно получить на базе у специального грузовика HEMTT, что у ангаров или на ВПП.
Для этого нужно использовать опцию -Unload Ammobox- из контекстного меню грузовика. Выгруженный ящик можно перевозить с помощью других грузовиков
или с помощью вертолетов.


"]];

player createDiarySubject ["PO3WK","Info"];
player createDiarySubject ["PO3CR","О миссии"];
player createDiaryRecord ["PO3CR",["Благодарности","Framework Written/Compiled by Eightysix for Online Combat Battalion Tactical Missions<br/><br/>Online Combat Battalion Australia (www.ocb.net.au), their support and testing has been vital to the success.<br/>- [OCB]Dash for Code, Inpiration and Effort in helping development<br/><br/>
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

player createDiaryRecord ["PO3CR",["Версия",format["MultiPlayer Scripting Framework<br/>Version %1",localize "STR_PO3_VERSION"]]];

player createDiaryRecord ["PO3WK",["Миссии","
Taskmaster System<br/>
Нажмите ""J"" чтобы открыть список задач.<br/
Здесь показаны все задачи для вашей команды, а также их статус.<br/>
<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa' width='25px'/> Статус: активно - цвет: белый<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIconCanceled_ca.paa' width='25px'/> Статус: отменено  - цвет: серый<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa' width='25px'/> Статус: провалено - цвет: красный<br/>
<img image='\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa' width='25px'/> Статус: выполнено - цвет: зеленый<br/>"]];

//player createDiaryRecord ["PO3WK",["Support","Support Requests are Work in Progress"]];

player createDiaryRecord ["PO3WK",["Отрядные маркеры",format["Squad Marker System<br/><br/>Любой дружественный отряд отмечен на карте соответствующей
иконкой.<br/><br/>Иконка также показывает, что ваш командир занял технику.<br/>
<img image='%1' width='25px'/> - Infantry<br/><img image='%2' width='25px'/> - Бронированный<br/>
<img image='%3' width='25px'/> - Helicopter<br/>
<img image='%4' width='25px'/> - Mechanised: <br/><img image='%5' width='25px'/> - Моторизованный<br/>
<img image='%6' width='25px'/> - Plane<br/>
<img image='%7' width='25px'/> - Static Weapon<br/><img image='%8' width='25px'/> - UAV<br/>",["n_inf"] call PO3_fnc_getCfgIcon,
["n_armor"] call PO3_fnc_getCfgIcon,["n_air"] call PO3_fnc_getCfgIcon,["n_mech_inf"] call PO3_fnc_getCfgIcon,
["n_motor_inf"] call PO3_fnc_getCfgIcon,["n_plane"] call PO3_fnc_getCfgIcon,["n_art"] call PO3_fnc_getCfgIcon,
["n_uav"] call PO3_fnc_getCfgIcon] ] ];

player createDiaryRecord ["PO3WK",["Спектатор","
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

/*player createDiaryRecord ["PO3WK",["Redeployment","
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
To HALO, select HALO from the left menu and double click on a location on the map to begin the jump."]];*/
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
player createDiaryRecord ["PO3WK",["Логистика","
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

/*player createDiaryRecord ["PO3WK",["IEDs","
IED System<br/>
<br/>
In the latest version, IEDs are dangerous to both Infantry and Vehicles.<br/>
They can be disguised as almost anything, from a rubbish pile, a can or even a whole vehicle.<br/>
<br/>
If you suspect an object is an IED, dismount from the vehicle and approach the object by crawling towards it. This will often prevent any trigger of the IED.<br/>
To disarm the IED, aim at the IED and select ""Disarm IED"" from your action menu.<br/>
If you are not an engineer, you have a risk of failure. This will result in the IED detonating.<br/>
Alternately you can just set a C4 explosive next to it and detonate it once clear.
"]];*/

//player createDiaryRecord ["PO3WK",["HUD","The Player Hud<br/><br/>The hud allows you to set your view distance options, terrain detail and density and toggle the 3D names that appear above each of nearby players.<br/>These options can be disabled by the mission admin."]];