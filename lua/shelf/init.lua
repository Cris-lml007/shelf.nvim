local M = {}

function M.setup(opts)
   vim.api.nvim_set_keymap('n','<C-k>',':set hlsearch!<CR>',{noremap=true,silent=true})
   opts = opts or {}
   if not opts.keymap then
       opts.keymap ='<leader>fs'
   end
   vim.keymap.set('n', opts.keymap, function()
       require('shelf.shelf.shelf')
       session()
   end)

end


vim.api.nvim_create_user_command('Sessions',function ()
    require('shelf.shelf.shelf')
    session()
end,{})

return M

