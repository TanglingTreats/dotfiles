M = {}

function M.getOS()
  return os.execute('uname -s') == "Darwin" and "unix" or "macOS"
end

return M;
