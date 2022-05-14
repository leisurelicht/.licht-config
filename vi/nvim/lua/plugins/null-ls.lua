-- =================
-- null-ls.lua --- null-ls config file
-- Author: MuCheng
-- =================
--
local ok, null = pcall(require, "null-ls")
if not ok then
  return
end

null.setup(
  {
    sources = {
      null.builtins.formatting.prettier,
      null.builtins.formatting.gofmt,
      null.builtins.formatting.autopep8,
      null.builtins.formatting.sqlformat,
      null.builtins.formatting.stylua.with(
        {
          extra_args = {
            "--indent-type=Spaces",
            "--indent-width=2"
          }
        }
      )
    }
  }
)
