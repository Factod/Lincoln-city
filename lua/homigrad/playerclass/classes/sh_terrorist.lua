local CLASS = player.RegClass("terrorist")

function CLASS.Off(self)
    if CLIENT then return end
end

local models = {
    "models/player/Custom_terrorists/t_arctic.mdl",
    "models/player/Custom_terrorists/t_guerilla.mdl",
    "models/player/Custom_terrorists/t_leet.mdl",
    "models/player/Custom_terrorists/t_phoenix.mdl"
}

function CLASS.On(self)
    if CLIENT then return end
    ApplyAppearance(self,nil,nil,nil,true)
    timer.Simple(.1,function()
        local Appearance = self.CurAppearance or hg.Appearance.GetRandomAppearance()

        Appearance.AAttachments = {
            "terrorist_band"
        }
        Appearance.AColthes = ""
        self:SetNWString("PlayerName","Terrorist ".. Appearance.AName)
        self:SetPlayerColor(Color(165,0,0):ToVector())
        self:SetModel(models[math.random(#models)])
        self:SetSubMaterial()
        self.CurAppearance = Appearance
        self:SetNetVar("Accessories", "")
    end)
end

function CLASS.Guilt(self, victim)
    if CLIENT then return end

    if victim:GetPlayerClass() == self:GetPlayerClass() then
        return 1
    end
    
    if victim == zb.hostage then
        return 1
    end
end
