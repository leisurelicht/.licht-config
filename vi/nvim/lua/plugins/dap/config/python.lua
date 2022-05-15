return {
    names = {
        adapters = "python",
        configurations = "python"
    },
    adapters = {
        type = "executable",
        command = "python3",
        args = {"-m", "debugpy.adapter"}
    },
    configurations = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return "/opt/homebrew/bin/python3"
            end
        },
        {
            type = "python",
            request = "launch",
            name = "Launch Django",
            program = vim.fn.getcwd() .. "/manage.py",
            pythonPath = "/opt/homebrew/bin/python3",
            justMyCode = false,
            args = {
                "runserver",
                "127.0.0.1:8000",
                "--noreload"
            }
        }
    }
}
