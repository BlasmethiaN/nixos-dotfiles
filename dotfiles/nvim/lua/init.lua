local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

vim.g.mason_home = vim.fn.expand("~/.local/share/nvim/mason")

require("lazy").setup("plugins", {
  lockfile = vim.fn.expand("~/.local/state/nvim/lazy-lock.json"),
})
require("settings")
