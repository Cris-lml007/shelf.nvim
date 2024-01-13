local dir=vim.fn.stdpath('data') .. "/session/"

function save(name)
    vim.cmd("mksession! " .. dir .. name)
end

function getDir()
    return dir
end

function loadSessions()-->table
    local listObj={}
    l=io.popen("ls "..dir,"r")
    local list=l:lines()
    q=1
    for i in list do
        table.insert(listObj,i)
    end
    return listObj
end
