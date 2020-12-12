local utils = {}

function utils.nmap_options(key, action, options)
  fn.nvim_set_keymap('n', key, action, options)
end
function utils.nmap(key, action)
  utils.nmap_options(key, action, {})
end
function utils.nmap_silent(key, action)
  utils.nmap_options(key, action, { silent = true })
end
function utils.nnoremap(key, action)
  utils.nmap_options(key, action, { noremap = true })
end
function utils.xmap(key, action)
  fn.nvim_set_keymap('x', key, action, {})
end

function utils.set(k, v)
  if v == true or v == false then
    key = k
    if not v then key = 'no'..k end
    vim.api.nvim_command('set ' .. key)
  else
    vim.api.nvim_command('set ' .. k .. '=' .. v)
  end
end

function utils.fexists(file)
  return os.rename(file, file) and true or false
end

function isOneOf(list, x)
  for _, v in pairs(list) do
    if v == x then return true end
  end
  return false
end

return utils
