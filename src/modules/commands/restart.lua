local discordia=require('discordia')
local commands=require('./../commands.lua')
discordia.extensions()
function os.sleep(n)c=os.clock t=c()while c()-t < n do end;end
commands:Add('restart',{},"restart bot [dev]", function(message,args,t)
    if message.author==t[1].owner then
        message:addReaction('👍')
        t[1]:stop()
        os.sleep(1.5)
        io.open('restart.txt','w+'):write(message.guild.id..','..message.channel.id..','..message.id):close()
        os.execute('luvit ./src/main.lua')
    end
end)