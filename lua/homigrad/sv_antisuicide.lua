hook.Add("CanPlayerSuicide", "pizdec", function( ply )
    local playername = ply:GetName()
    local playercolor = ply:GetPlayerColor()
    if ply.organism.otrub or ply.PlayerClassName == "furry" or ply.PlayerClassName == "meow" then
    if ply:IsSuperAdmin() then PrintMessage(HUD_PRINTTALK, playername.." <- ПИТУХ ВАНЮЧИ") return true end
        return false 
    end
end)