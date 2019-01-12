key_to_teleport = 38
text_to_teleport = "Press E to teleport!"

pos1= {
    x=1878.99,
    y=3676.00,
    z=33.58
}

pos2= {
    x=1825.86,
    y=3646.08,
    z=34.33
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while both==true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        DrawMarker(1, pos1.x, pos1.y, pos1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
        DrawMarker(1, pos2.x, pos2.y, pos2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
        if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, pos1.x, pos1.y, pos1.z, 2) then
            alert(text_to_teleport)
            if IsControlJustReleased(1, key_to_teleport) then
                SetEntityCoords(player, pos2.x, pos2.y, pos2.z)
            end
        elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, pos2.x, pos2.y, pos2.z, 1) then
            alert(text_to_teleport)
            if IsControlJustReleased(1, key_to_teleport) then
                SetEntityCoords(player, pos1.x, pos1.y, pos1.z)
            end
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end