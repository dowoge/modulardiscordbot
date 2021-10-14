local discordia=require('discordia')
local commands=require('./../commands.lua')
discordia.extensions()
commands:Add('cmds',{'commands','cmd','help','how does this work???'},'Returns a list of all commands',function(message,args)
    local final='```\n'
    for i,v in pairs(commands.command_list) do
        local name=v.name
        local alias=''
        for j,k in pairs(v.alias) do
            alias=alias..k..', '
        end
        local desc=v.desc
        final=final..'Name: '..name..'\nDescription: '..desc..'\n'..'Aliases: '..alias:sub(1,#alias-2)..'\n\n'
    end
    final=final..'```'
    message:reply(final)
end)