---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  version = "*", -- 使用最新稳定版本
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- 打开当前文件
    {
      "<leader>y",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    -- 在当前工作目录打开
    {
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    -- 恢复上一次 Yazi 会话
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    yazi_config_dir = vim.fn.stdpath("config") .. "/yazi",
    use_ueberzug = true,
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  -- 如果你启用了 open_for_directories=true，推荐屏蔽 netrw
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
