local discordia = require('discordia')
local token = require('./modules/token.lua')
local commands=require('./modules/commands.lua')
local prefix = '%'
local client = discordia.Client()
discordia.extensions()

client:on('ready',function()
    commands:INIT()
end)

client:on('messageCreate', function(message)
    local content=message.content
    if content:sub(1,#prefix)=='%' then
        local cmd=content:sub(#prefix+1,#content)
        local args=cmd:split(' ')
        local cmdName=args[1]
        table.remove(args,1)
        local command=commands.command_list[cmdName]
        if command~=nil then
            if message.guild~=nil then
                command.exec(message,args,{client,discordia,token})
            else
                message:reply('i will not let you type in dms!!! 👿👿😡😠')
            end
        else
            message:reply('command does not exist 👎')
        end
    end
end)

client:run('Bot '..token)