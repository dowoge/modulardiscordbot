local discordia=require('discordia')
local commands=require('./../commands.lua')
local date=discordia.Date
discordia.extensions()
commands:Add('ping',{'pong','latency'},"Returns the bot's latency", function(message,args)
    local timestamp=date.toSeconds(message:getDate())
    local ping=os.time()-timestamp
    return message:reply(tostring(math.floor((ping*100)+.5))..' ms')
end)