-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- =============================
-- CMake 快捷键 (cmake-tools.nvim)
-- =============================
local opts = { noremap = true, silent = true }

-- 运行 CMake 项目
vim.keymap.set("n", "<leader>cc", "<cmd>CMakeRun<cr>", vim.tbl_extend("force", opts, { desc = "Run CMake project" }))

-- 构建项目
vim.keymap.set(
  "n",
  "<leader>cb",
  "<cmd>CMakeBuild<cr>",
  vim.tbl_extend("force", opts, { desc = "Build CMake project" })
)

-- 配置项目 (选择构建类型、生成器等)
vim.keymap.set(
  "n",
  "<leader>cf",
  "<cmd>CMakeConfigure<cr>",
  vim.tbl_extend("force", opts, { desc = "Configure CMake project" })
)

-- 测试项目
vim.keymap.set("n", "<leader>ct", "<cmd>CMakeTest<cr>", vim.tbl_extend("force", opts, { desc = "Test CMake project" }))

-- 清理构建目录
vim.keymap.set("n", "<leader>cl", "<cmd>CMakeClean<cr>", vim.tbl_extend("force", opts, { desc = "Clean CMake build" }))

-- 查看当前 CMake 构建类型
vim.keymap.set(
  "n",
  "<leader>cv",
  "<cmd>CMakeSelectBuildType<cr>",
  vim.tbl_extend("force", opts, { desc = "Select CMake build type" })
)
