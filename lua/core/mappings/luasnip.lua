local ls  = require "luasnip"

local M = {
  plugin = true,
  i =  {
    ["<C-n>"] = { function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end},

    ["<C-ñ>"] = {  function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end},

    ["<C-p>"] = {function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end},
  },
  s =  {
    ["<C-n>"] = { function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end},

    ["<C-p>"] = {function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end},
  },
}

return M
