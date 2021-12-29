local discordia=require('discordia')
local commands=require('./../commands.lua')
local http=require('coro-http')
local json=require('json')
local link='https://some-random-api.ml/animu/'
discordia.extensions()
function get(url,headers,params)
    local _,body=http.request('GET',url,headers or {{"Content-Type", "application/json"}},params)
    body=json.decode(body)
    return body
end
commands:Add('wink',{},';)',function(message,args)
    local response=get(link..'wink')
    return message:reply({
        embed={
            image={
                url=response.link
            },
            timestamp=discordia.Date():toISO('T', 'Z');
            color=discordia.Color.fromRGB(math.random(255),math.random(255),math.random(255)).value,
        }
    })
end)
commands:Add('pat',{},'pat',function(message,args)
    local response=get(link..'pat')
    return message:reply({
        embed={
            image={
                url=response.link
            },
            timestamp=discordia.Date():toISO('T', 'Z');
            color=discordia.Color.fromRGB(math.random(255),math.random(255),math.random(255)).value,
        }
    })
end)
commands:Add('hug',{},':3',function(message,args)
    local response=get(link..'hug')
    return message:reply({
        embed={
            image={
                url=response.link
            },
            timestamp=discordia.Date():toISO('T', 'Z');
            color=discordia.Color.fromRGB(math.random(255),math.random(255),math.random(255)).value,
        }
    })
end)
