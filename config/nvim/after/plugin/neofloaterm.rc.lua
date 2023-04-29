local status, neoFloaTerm = pcall(require, 'NeoFloaTerm')
if not status then return end

-- Run setup here
neoFloaTerm.test_func()
