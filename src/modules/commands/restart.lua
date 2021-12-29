local discordia=require('discordia')
local commands=require('./../commands.lua')
discordia.extensions()
function os.sleep(n)c=os.clock t=c()while c()-t < n do end;end
commands:Add('restart',{},"restart bot [dev]", function(message,args,t)
    if message.author==t[1].owner then
        message:addReaction('👍')
        t[1]:stop()
        os.sleep(1)
        os.execute('luvit ./src/main.lua')
    end
end)