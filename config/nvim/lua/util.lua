M = {}

function M.getOS()
  return os.execute('uname -s') == "Darwin" and "unix" or os.execute('uname -s') == 1 and "win" or "macOS"
end

return M;
