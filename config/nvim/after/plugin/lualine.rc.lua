local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'everforest',
    -- component_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {
      {
        'buffers',
        use_mode_colors = true,
        buffers_color = {
          -- Same values as the general color option can be used here.
          active = 'lualine_a_normal',     -- Color for active buffer.
          inactive = 'lualine_a_inactive', -- Color for inactive buffer.
        },
        symbols = {
          modified = ' ●', -- Text to show when the buffer is modified
          alternate_file = ' ', -- Text to show to identify the alternate file
          directory = '', -- Text to show when the buffer is a directory
        },
      }
    },
    lualine_x = {
      { 'diganostics', sources = { 'nvim_diagnostic' }, symbols = {} },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true,
      path = 1
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { 'fugitive' }
}
