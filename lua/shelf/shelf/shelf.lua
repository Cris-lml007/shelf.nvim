local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions =require('telescope.actions')
local action_state =require('telescope.actions.state')
--package.path=package.path .. ";~/.local/share/nvim/site/pack/packer/start/shelf.nvim/lua/shelf/"
require('shelf.shelf.dialog')

require('shelf.shelf.file')

-- our picker function: colors
session = function(opts)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "Shelf",
    finder = finders.new_table {
      results = loadSessions()
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings=function (bufnr,map)
        actions.select_default:replace(function ()
            actions.close(bufnr)
            local selection=action_state.get_selected_entry()
            vim.cmd("source " .. getDir() ..selection[1])
        end)

        map({"i","n"},"<C-n>",function ()
            actions.close(bufnr)
            showInput()
        end)

        map({"i","n"},"<C-d>",function ()
            actions.close(bufnr)
            local selection=action_state.get_selected_entry()
            ShowDelete(selection[1])
        end)
        return true
    end
  }):find()
end

--session()
