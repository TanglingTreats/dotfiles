local status, nvim_mapper = pcall(require, "nvim-mapper")

if (not status) then return end

nvim_mapper.setup({
  no_map = false,
  search_path = os.getenv("HOME") .. "/.config/nvim/lua",
  action_on_enter = "definition",
})
