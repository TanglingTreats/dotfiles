M = {}

function M.getOS()
  return os.execute('uname -s') == 1 and "win" or "unix"
end

return M;
