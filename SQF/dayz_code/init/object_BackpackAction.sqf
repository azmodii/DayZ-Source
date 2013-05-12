
_holder = _this select 0;
_type = _this select 1;
_classname = _this select 2;
_distance = player distance _holder;

_claimed = _holder getVariable "claimed";
_name = getText (configFile >> _type >> _classname >> "displayName");

_PlayerNearBy =	{isPlayer _x} count (_holder nearEntities ["CAManBase", 5]) > 1;

if (_PlayerNearBy) exitWith {cutText [format["Another Player Near by, Only one player must be within 5 meters of a bag to pickup"] , "PLAIN DOWN"]};

if ((isnil "claimed") and (_distance < 3)) then { 
		_holder setVariable["claimed",_playerID,true];
		s_player_holderPickup = _holder addAction [format[(localize "str_init_take"),_name], "\z\addons\dayz_code\actions\object_pickup.sqf",[_type,_classname,_holder], 20, true, true];
};