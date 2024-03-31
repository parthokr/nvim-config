vim.cmd("set expandtab")

vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set smarttab")
vim.cmd("set smartcase")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set mouse=a")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cursorline")
vim.cmd("set colorcolumn=80")
vim.cmd("set statuscolumn=%l\\ %r")
vim.opt.termguicolors = true

vim.g.mapleader = " "

-- clear search highlight with <leader>h
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', {})

-- CP
function CompileAndRunCPP()
  -- check if file is a cpp file
  local allowed_filetypes = {"cpp", "cc", "cxx", "c++"}
  local extension = vim.fn.expand('%:e')
  if not vim.tbl_contains(allowed_filetypes, extension) then
    print("❌  Not a C++ file")
    return
  end
  -- save file
  vim.cmd("w")
  -- save start time
  local start = os.clock()
  -- compile
  -- compile using homebrew g++
  vim.cmd("echohl WarningMsg | echo '🚀  Compiling and running...' | echohl None")
  vim.cmd("!g++-13 -Wall -Wno-unused-result -std=c++17 -O2 " .. vim.fn.expand('%') .. " -o " .. vim.fn.expand('%:r') .. ".out && ./" .. vim.fn.expand('%:r') .. ".out")
  -- save end time
  local finish = os.clock()
  local taken = finish - start
  vim.cmd("echo '✅  Compiled and ran in " .. taken .. " seconds'")
end

vim.keymap.set('n', '<leader> ', CompileAndRunCPP, {})

function ToggleDebug()
  -- check if file is a cpp file
  local allowed_filetypes = {"cpp", "cc", "cxx", "c++"}
  local extension = vim.fn.expand('%:e')
  if not vim.tbl_contains(allowed_filetypes, extension) then
    print("❌  Not a C++ file")
    return
  end
  -- get current line no and save it
  local line = vim.fn.line('.')
  -- go to the top of the file
  vim.cmd("normal gg")
  -- read current line and check if DEBUG macro is set to 1
  local current_line = vim.fn.getline('.')
  -- check if current line ends with 1
  if current_line:sub(-1) == "1" then
    -- delete the line
    vim.cmd("normal dd")
    -- insert new line with DEBUG macro set to 0
    vim.cmd("normal O#define DEBUG 0")
    -- write the file
    vim.cmd("w")
    -- go back to the original line
    vim.cmd("normal " .. line .. "G")
    -- print message
    vim.notify("DEBUG mode turned off", "info", {title = "DEBUG", timeout = 200})
  else
    -- delete the line
    vim.cmd("normal dd")
    -- insert new line with DEBUG macro set to 1
    vim.cmd("normal O#define DEBUG 1")
    -- write the file
    vim.cmd("w")
    -- go back to the original line
    vim.cmd("normal " .. line .. "G")
    -- print message
    vim.notify("DEBUG mode turned on", "info", {title = "DEBUG", timeout = 200})
  end
end

vim.keymap.set('n', '<leader>d', ToggleDebug, {})

