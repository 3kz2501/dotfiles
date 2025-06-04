return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  build = ":MasonUpdate",
  config = function()
    -- 必要なディレクトリを作成
    local mason_path = vim.fn.stdpath("data") .. "/mason"
    vim.fn.mkdir(mason_path, "p")
    vim.fn.mkdir(mason_path .. "/registries", "p")

    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      -- ログレベルを上げてデバッグ
      log_level = vim.log.levels.DEBUG,
      -- プロバイダーの設定
      providers = {
        "mason.providers.registry-api",
        "mason.providers.client",
      },
      -- レジストリの明示的な設定
      registries = {
        "github:mason-org/mason-registry",
      },
      -- GitHubの設定
      github = {
        -- APIレート制限を回避
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
      },
      -- インストール時の設定
      install_root_dir = mason_path,
      PATH = "prepend",
      pip = {
        upgrade_pip = false,
      },
    })

    -- レジストリの手動更新を試みる
    vim.defer_fn(function()
      local ok, err = pcall(function()
        vim.cmd("MasonUpdate")
      end)
      if not ok then
        vim.notify("Mason update failed: " .. tostring(err), vim.log.levels.WARN)
      end
    end, 1000)

    local registry = require("mason-registry")
    -- 自動インストールしたいパッケージのリスト
    local ensure_installed = {
      "bacon",
      "biome",
      "checkstyle",
      "clang-format",
      "clangd",
      "cpplint",
      "codelldb",
      "goimports",
      "google-java-format",
      "gopls",
      "jdtls",
      "luacheck",
      "prettier",
      "pyright",
      "ruff",
      "rust-analyzer",
      "sqlfluff",
      "staticcheck",
      "stylua",
      "typescript-language-server",
    }
    -- パッケージが存在しない場合はインストール
    for _, tool in ipairs(ensure_installed) do
      if not registry.is_installed(tool) then
        registry.get_package(tool):install()
      end
    end
  end,
}
