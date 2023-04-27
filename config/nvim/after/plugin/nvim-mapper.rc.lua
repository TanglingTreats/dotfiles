local status, nvim_mapper = pcall(require, "nvim-mapper")

if (not status) then return end

nvim_mapper.setup({
  no_map = false,
  search_path = function ()
    if (os.getenv("HOME"))
    then
      return os.getenv("HOME") .. "/.config/nvim/lua"
    else
      return os.getenv('APPDATA') .. "/local/nvim/lua"
    end
  end,
  action_on_enter = "definition",
})
