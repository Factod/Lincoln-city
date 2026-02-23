-- люблю милых котиков!!!!!!!!!! я тоже
local fur_pain = {
    "zbattle/furry/exp5.wav", "zbattle/furry/exp6.wav", "zbattle/furry/exp7.wav",
    "zbattle/furry/exp8.wav", "zbattle/furry/exp9.wav", "zbattle/furry/exp10.wav",
    "zbattle/furry/exp11.wav", "zbattle/furry/exp12.wav", "zbattle/furry/exp13.wav",
    "zbattle/furry/exp14.wav", "zbattle/furry/exp15.wav", "zbattle/furry/exp16.wav",
    "zbattle/furry/exp17.wav", "zbattle/furry/death1.wav", "zbattle/furry/death3.wav",
    "zbattle/furry/death4.wav", "zbattle/furry/death5.wav",
}

-- звуков протогенов ЛОГИЧНО нету, я же не тупой еблон <- запомните его слова -art
local uwuspeak_phrases = {
    "zbattle/furry/cat_mrrp1.ogg", "zbattle/furry/cat_mrrp1.ogg",
    "zbattle/furry/cat_purr1.ogg", "zbattle/furry/cat_purr2.ogg",
    "zbattle/furry/mewo.ogg", "zbattle/furry/mrrp.ogg",
}

local function IsHui(ply)
    if not IsValid(ply) then return false end
    -- лучше моделькой мб?
    return ply:GetModel() == "models/keith3201/ligeia/ligeia_pm.mdl" or ply.PlayerClassName == "meow"
end

local CLASS = player.RegClass("meow")

function CLASS.Off(self)
    if CLIENT then return end
end

function CLASS.On(self)
    if CLIENT then return end
    
    -- рот ипал суко, шляпы и боди группы не убераються :steamsad:
    ApplyAppearance(self, nil, nil, nil, true)

    --ну ты и еблан вот тебе
    local Appearance = self.CurAppearance or hg.Appearance.GetRandomAppearance()
    Appearance.AAttachments = ""
    Appearance.AColthes = ""
    self:SetNetVar("Accessories", "")

	self.CurAppearance = Appearance
    
    self:SetModel("models/keith3201/ligeia/ligeia_pm.mdl")
    self:SetBodyGroups("0000")
    self:SetSkin(math.random(0,10))
    -- хотябы это норм работает
    self:SetSubMaterial()

    self.PlayerClassName = "meow"
end

function CLASS.Guilt(self, Victim)
    if CLIENT then return end
    if Victim:GetPlayerClass() == self:GetPlayerClass() then return 1 end
end

-- ZCITY NIGGASCRIPTHOOK
hook.Add("HG_ReplacePhrase", "mrphh", function(ent, phrase, muffed, pitch)
    if IsHui(ent) then
        local inpain = ent.organism and ent.organism.pain > 60
        local phr = inpain and table.Random(fur_pain) or table.Random(uwuspeak_phrases)
        return ent, phr, muffed, pitch
    end
end)

hook.Add("HG_ReplaceBurnPhrase", "meowburnn", function(ply, phrase)
    if IsHui(ply) then
        return ply, table.Random(fur_pain)
    end
end)
