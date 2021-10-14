local discordia=require('discordia')
discordia.extensions()
local commands=require('./../commands.lua')
commands:Add('ping',{'pong','latency'},"Returns the bot's latency (it doesnt lol)", function(message,args)
    if #args~=0 then
        return message:reply('why u passing args for a ping command.......?')
    else
        return message:reply('ping 👍')
    end
end)