-- =================
-- G.lua --- 保存一些全局的工具函数
-- Author: MuCheng
-- =================
--

function _G.dump(...)
    local objects = vim.tbl_map(vim.inspect, {...})
    print(unpack(objects))
end

