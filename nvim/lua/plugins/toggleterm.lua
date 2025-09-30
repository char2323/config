-- 文件路径: ~/.config/nvim/lua/plugins/toggleterm-custom.lua
-- 功能: 为 LazyVim 的 toggleterm 插件添加一个自定义的、能自动检测 Conda 环境的快捷键。

return {
  -- 指定要修改配置的插件
  {
    "akinsho/toggleterm.nvim",

    -- `keys` table 是 LazyVim 推荐的、用于添加或修改插件快捷键的方式
    keys = {

      -- 定义快捷键 <leader>cp
      {
        "<leader>cp",
        function()
          -- 步骤 1: 运行前先保存当前文件
          vim.cmd("w")

          -- 步骤 2: 动态检测 Conda 环境
          local conda_prefix = os.getenv("CONDA_PREFIX")
          local python_executable

          -- 检查 CONDA_PREFIX 环境变量是否存在且不为空
          if conda_prefix and conda_prefix ~= "" then
            -- 如果存在，说明 Conda 环境已激活，我们用它来构建 Python 解释器的完整路径
            python_executable = conda_prefix .. "/bin/python"
            -- 通过 Neovim 的通知功能给出清晰的提示
            vim.notify("✅ Using Conda Python: " .. python_executable, vim.log.levels.INFO)
          else
            -- 如果不存在，说明没有激活的 Conda 环境，则回退到使用在 PATH 中找到的通用 'python'
            python_executable = "python"
            vim.notify("⚠️ No active Conda env detected. Using default 'python'.", vim.log.levels.WARN)
          end

          -- 步骤 3: 准备并执行命令
          local file = vim.fn.expand("%") -- 获取当前文件名

          -- 使用 toggleterm 的 Terminal 对象来创建一个一次性的终端实例
          local Terminal = require("toggleterm.terminal").Terminal
          local term = Terminal:new({
            cmd = python_executable .. " " .. file,

            -- 关键：设置为 false，这样窗口会保留下来，方便我们查看输出
            close_on_exit = false,

            direction = "horizontal", -- 使用浮动窗口
            hidden = true, -- 这是一个一次性的、临时的终端，不会被 ToggleTerm 记住
          })

          -- 打开这个我们刚刚定义好的终端实例
          term:open()
        end,
        desc = "Run Python File (Auto-detect Conda)", -- which-key 会显示的描述信息
      },
    },
  },
}
