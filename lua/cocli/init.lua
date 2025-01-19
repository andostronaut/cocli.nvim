local cmd = vim.api.nvim_create_user_command

local M = {}

M.setup = function(opts)
  opts = opts or {}

  -- Validate configuration
  if opts.some_required_option and type(opts.some_required_option) ~= "string" then
    error "some_required_option must be a string"
  end

  -- Initialize plugin state
  M.config = vim.tbl_deep_extend("force", {
    -- default options here
  }, opts)

  -- Setup plugin
  local ok, err = pcall(function()
    -- Plugin initialization logic here
    cmd("Cocli", function()
      print "Get started with Cocli"
    end, { desc = "Show welcoming message" })

    vim.notify("Cocli initialized successfully", vim.log.levels.INFO)
  end)

  if not ok then
    error(string.format("Failed to setup Cocli: %s", err))
  end

  return ok
end

return M
