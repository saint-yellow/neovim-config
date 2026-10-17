--- comment
--- @param nvim_diags table
--- @return table
local function convert_diagnostics(nvim_diags)
  local lsp_diags = {}
  for _, d in ipairs(nvim_diags) do
    table.insert(lsp_diags, {
      range = {
        start = {
          line = d.lnum,
          character = d.col,
        },
        ["end"] = {
          line = d.end_lnum or d.lnum,
          character = d.end_col or d.col,
        },
      },
      severity = d.severity,
      code = d.code,
      source = d.source or "Ruff",
      message = d.message,
    })
  end
  return lsp_diags
end

local M = {}

---comment
---@param opts table { name: string, kind: table, bufnr: number }
M.on_save = function(opts)
  if not (opts and opts.name and opts.kind) then
    return
  end

  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  local name = opts.name
  local kind = opts.kind

  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = name })
  if #clients == 0 then
    return
  end
  local client = clients[1]

  local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
  params.context = {
    only = kind,
    diagnostics = convert_diagnostics(vim.diagnostic.get(bufnr)),
  }

  local raw_response = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
  if not raw_response then
    return
  end

  for client_id, res in pairs(raw_response) do
    if res.result then
      for _, action in ipairs(res.result) do
        if not action.edit then
          local resolved_response = vim.lsp.buf_request_sync(bufnr, "codeAction/resolve", action, 1000)
          if resolved_response and resolved_response[client_id] and resolved_response[client_id].result then
            action = resolved_response[client_id].result
          end
        end
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
        end
      end
    end
  end
end

return M
