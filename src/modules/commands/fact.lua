local discordia=require('discordia')
local commands=require('./../commands.lua')
local http=require('coro-http')
local json=require('json')
discordia.extensions()
local link='https://some-random-api.ml/animal/'
local animals={dog='dog',cat='cat',panda='panda',fox='fox',['red panda']='red_panda',koala='koala',bird='bird',raccoon='raccoon',kangaroo='kangaroo'}
function get(url,headers,params)
    local _,body=http.request('GET',url,headers or {{"Content-Type", "application/json"}},params)
    body=json.decode(body)
    return body
end
commands:Add('fact',{'tellme'},'Returns a random image and fact for a specified animal',function(message,args)
    local msg=table.concat(args,' ')
    local animal=animals[msg:lower()]
    if animal then
        local response=get(link..animal)
        return message:reply({
            embed={
                author={
                    name=message.author.username,
                    icon_url=message.author.avatarURL,
                },
                image={
                    url=response.image
                },
                description=response.fact,
                timestamp=discordia.Date():toISO('T', 'Z');
                color=discordia.Color.fromRGB(math.random(255),math.random(255),math.random(255)).value,
            }
        })
    end
end)
local animallist={'dog','cat','panda','fox','red panda','koala','bird','raccoon','kangaroo'}
commands:Add('factlist',{'animallist','animals'},'Returns a list of animals that can be used for the "fact" command',function(message,args)
    message:reply('```'..table.concat(animallist,'\n')..'```')
end)