local status, cmp_path = pcall(require, "cmp")

if (not status) then return end

cmp_path.setup({
  sources = {
    { name = 'path' }
  }
})
