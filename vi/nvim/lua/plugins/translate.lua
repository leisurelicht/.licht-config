-- =================
-- translate.lua --- translate config
-- Author: MuCheng
-- =================
--
local ok, translate = pcall(require, "translate")
if not ok then
    vim.notify("Load translate Failed", "warn")
    return
end

translate.setup({
    default = {
        command = "translate_shell",
        output = "floating",
        parse_before = "trim",
        parse_after = "replace_symbols",
    },
    preset = {
        output = {
            split = {
                min_size = 8,
            }
        }
    },
    parse_after = {
        replace_symbols = {
            cmd = function(lines)
                for index, char in ipairs(lines) do
                    if char:find("u003d") then
                        lines[index] = char:gsub("u003d", "=")
                    end
                end
                return lines
            end,
        },
    },
})

local map = require("utils.mapping")

map.set({"n", "x"}, "<leader>mcf", "<CMD>Translate ZH -source=EN -output=floating<CR>", "E2C in float window")
map.set({"n", "x"}, "<leader>mcs", "<CMD>Translate ZH -source=EN -output=split<CR>", "E2C in split window")
map.set({"n", "x"}, "<leader>mcr", "<CMD>Translate ZH -source=EN -output=replace<CR>", "E2C and replace")
map.set({"n", "x"}, "<leader>mci", "<CMD>Translate ZH -source=EN -output=insert<CR>", "E2C and insert to next line")
map.set({"n", "x"}, "<leader>mcc", "<CMD>Translate ZH -source=EN -output=register<CR>", "E2C and copy to clipboard")
map.set("n", "<leader>mcb", "<CMD>Translate ZH -source=EN -output=floating -comment<CR>", "E2C comment in float window")
map.set("n", "<leader>mcw", "<CMD>normal: viw<CR>:Translate ZH -source=EN -output=floating<CR>", "E2C word in float window")

map.set({"n", "x"}, "<leader>mef", "<CMD>Translate EN -source=ZH -output=floating<CR>", "C2E in floating")
map.set({"n", "x"}, "<leader>mes", "<CMD>Translate EN -source=ZH -output=split<CR>", "C2E in split window")
map.set({"n", "x"}, "<leader>mer", "<CMD>Translate EN -source=ZH -output=replace<CR>", "C2E and replace")
map.set({"n", "x"}, "<leader>mei", "<CMD>Translate EN -source=ZH -output=insert<CR>", "C2E and insert to next line")
map.set({"n", "x"}, "<leader>mec", "<CMD>Translate EN -source=ZH -output=register<CR>", "C2E and copy to clipboard")
map.set("n", "<leader>meb", "<CMD>Translate EN -source=ZH -output=floating -comment<CR>", "C2E comment in float window")
map.set("n", "<leader>tew", "<CMD>normal: viw<CR>:Translate EN -source=ZH -output=floating<CR>", "C2E word in float window")

