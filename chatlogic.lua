--[[-------------------------------------------------------------------------
Hey delikanlı, eğer ne yaptığını bilmiyorsan bura ile oynama.
---------------------------------------------------------------------------]]
local ply = LocalPlayer()
hook.Add( "PlayerSay", "checkForChatCommand", checkForChatCommand )
local prefixlen = string.len(komutPrefiksi)
local chatCommands = {}
local komutTipleri = {}

local function checkForChatCommand(ply, msg, takm)
    if not komutPrefiksi == "" then
        if string.sub(msg, 1, prefixlen) == komutPrefiksi then
            chatCommandLogic(ply,msg,takm)
            return
        end
    else
        if chatCommandLogic(ply,msg,takm) == true then
            return
        end
    end
end

local function chatCommandLogic(ply,msg,takm)
    for key,value in ipairs(chatCommands) do
        local commandlen = string.len(key)
        if string.sub(msg, 1, commandlen) == komutPrefiksi .. key then
            if value[1] == "ozel" then
                value[2](ply,msg,takm)
            else
                komutTipleri[value[1]](value[2])
            end
            return true
        end
    end
    return false
end

function komutEkle(command,tip,parameter)
    if chatCommands[command] == nil then
        chatCommands[command] = {tip,parameter}
    else
        print(command .. " zaten mevcut ve tekrardan eklenmeye çalıştı. ( Eklediginiz komutlara tekrardan goz atin. )")
    end
end

