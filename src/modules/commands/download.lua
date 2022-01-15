local discordia=require('discordia')
local commands=require('./../commands.lua')
discordia.extensions()

commands:Add('yt',{},"wip", function(message,args,t)
    if args[1] then
        if args[1]:match('?v=([%w-_]+)') or args[1]:match('youtu.be/([%w-_]+)') then
            local id=args[1]:match('?v=([%w-_]+)') or args[1]:match('youtu.be/([%w-_]+)')
            message:reply('Attempting to download song ID='..id)
            local filepath
            local s=io.popen('ytdl.exe -x --audio-format mp3 --output "./tmp/%(title)s - %(uploader)s.%(ext)s" '..id)
            if s then
                local final=''
                repeat
                    local c=s:read(1)
                    if c then
                        if c=='\n' then
                            if final:find('Destination: ') and final:find('.mp3') then
                                filepath=final:split(': ')[2]
                                message:reply('Found "'..filepath:sub(1+#'tmp\\',#filepath-4)..'"')
                            end
                            print(final)
                            final=''
                        else
                            final=final..c
                        end
                    end
                until not c
                if filepath then
                    message:reply({file='./'..filepath})
                    os.remove('./'..filepath)
                else
                    message:reply('Error downloading song (this is not supposed to happen)')
                end
            else
                message:reply('Error downloading song')
            end
        else
            message:reply('Invalid URL')
        end
    else
        message:reply('No URL provided')
    end
end)
commands:Add('sc',{},"wip", function(message,args,t)
    if args[1] then
        if args[1]:match('https://soundcloud.com/[%w-_]+/[%w-_]+') then
            local link=args[1]:match('https://soundcloud.com/[%w-_]+/[%w-_]+')
            message:reply('Attempting to download song from <'..link..'>')
            local filepath
            local s=io.popen('ytdl.exe -o "./tmp/%(title)s - %(uploader)s.%(ext)s" '..link)
            if s then
                local final=''
                repeat
                    local c=s:read(1)
                    if c then
                        if c=='\n' then
                            if final:find('Destination: ') and final:find('.mp3') then
                                filepath=final:split(': ')[2]
                                message:reply('Found "'..filepath:sub(1+#'tmp\\',#filepath-4)..'"')
                            end
                            print(final)
                            final=''
                        else
                            final=final..c
                        end
                    end
                until not c
                if filepath then
                    message:reply({file='./'..filepath})
                    os.remove('./'..filepath)
                else
                    message:reply('Error downloading song (this is not supposed to happen)')
                end
            else
                message:reply('Error downloading song')
            end
        else
            message:reply('Invalid URL')
        end
    else
        message:reply('No URL provided')
    end
end)