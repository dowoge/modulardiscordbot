animals={
    ['cat']={'a','b','c'},
    ['dog']={'a','b','c'},
    ['bird']={'a','b','c'},
    ['fish']={'a','b','c'},
    ['cow']={'a','b','c'},
    ['pig']={'a','b','c'},
    ['sheep']={'a','b','c'},
    ['horse']={'a','b','c'},
    ['chicken']={'a','b','c'},
    ['duck']={'a','b','c'},
    ['goat']={'a','b','c'},
    ['pigeon']={'a','b','c'},
    ['rabbit']={'a','b','c'},
    ['turkey']={'a','b','c'},
}
function table.find(t,v) tr=nil for i,j in pairs(t)do if i==v then tr=j or i break end end if tr==nil then for i,j in pairs(t) do if v==j then tr=i end end end return tr end
print(table.find(animals,'duck'))