local Input=require 'nui.input'
local Menu=require 'nui.menu'
require('shelf.shelf.file')

local input=Input({
    enter=true,
    border={
        style='single',
        text={
            top="| Name Session |",
            top_align='center'
        }
    },
    size={
        width="30%",
        height="20%"
    },
    position="50%"
},{
    prompt="> ",
    on_submit=function (value)
        save(value)
    end
})

function ShowDelete(name)
local menu=Menu({
    border={
        style='single',
        text={
            top="| delete " ..name .." |",
            top_align='center'
        }
    },
    size={
        width="20%",
        height="5%"
    },
    position="50%"
},{
    lines={
        Menu.item("yes"),
        Menu.item("no")
    },
    on_submit=function (item)
        if item.text =='yes' then
            vim.fn.delete(getDir() ..name)
        end
    end
})
menu:mount()
end

function showInput()
    input:mount()
end

