private["_return"];

_return = if(serverCommandAvailable "#kick" || !isMultiplayer) then { true }else{ false };

_return;