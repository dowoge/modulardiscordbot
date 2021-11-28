local discordia=require('discordia')
local commands=require('./../commands.lua')
discordia.extensions()
local vowels={'a','e','i','o','u'}
local alternatives={}
local function addAlternative(word,alternative)if not alternatives[word] then alternatives[word]=alternative end end
addAlternative('hi', {"hi", "hizies"})
addAlternative('hey', {"hey", "heya"})
addAlternative('and', {"and", "n"})
addAlternative('you', {"yu", "you", "u"})
addAlternative('are', {"are", "r"})
addAlternative('got', {"got", "gto", "tog"})
commands:Add('insardia',{'sard'},'Speak lke insrda!!', function(message,args)
    local lines=table.concat(args,' '):split('\n')
    local formatted_string=''
    for il,line in pairs(lines) do
        local words=line:split(' ')
        local formatted_words={}
        for iw,word in pairs(words) do
            local new_word=''
            local rng = math.random(1,30)
            if table.search(alternatives,word) then
                table.insert(formatted_words,alternatives[word][rng])
                goto continuew
            end
            if (#word-1 >= 3) and (rng==1) then
                table.insert(formatted_words,word)
                goto continuew
            end
            for i,letter in pairs(word:split('')) do
                if (#word-1)>3 then
                    if i>0 and i<(#word-1) then
                        if word:sub(i+1,i+1):match('%a') then
                            if word:sub(i+1,i+1)==letter then
                                goto continuel
                            end
                            if table.search(vowels,letter) then
                                goto continuel
                            end
                        end
                    end
                    if i==0 then
                        local rng=math.random(1,50)
                        if rng==1 then
                            new_word=new_word..string.rep(letter,2)
                        end
                    end
                    if i==#word-1 then
                        local rng=math.random(1,50)
                        if rng==1 then
                            new_word=new_word..string.rep(letter,2)
                        end
                    end
                end
                new_word=new_word..letter
                ::continuel::
            end
            table.insert(formatted_words,new_word)
            ::continuew::
        end
        formatted_string=formatted_string..table.concat(formatted_words,' ')..'\n'
    end
    message:reply(formatted_string)
end)