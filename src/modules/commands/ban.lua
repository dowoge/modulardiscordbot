local discordia=require('discordia')
local commands=require('./../commands.lua')
discordia.extensions()
commands:Add('ban',{'banish'},'Ban a member from the server',function(message,args)
    local user=message.guild:getMember(message.mentionedUsers.first.id)
    local author=message.member
    if user then
        if author:hasPermission('banMembers') then
            if author.highestRole.position>user.highestRole.position then
                local reason=table.concat(args,' ',2)
                user:ban(reason,7)
                return message:reply('Banned member '..user.tag..' ('..user.id..')')
            else
                return message:reply('Mentioned user has higher role.')
            end
        else
            return message:reply('Invalid permissions')
        end
    else
        return message:reply('No users mentioned')
    end
end)