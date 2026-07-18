vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local directory_watchers = {}
local file_change_group = vim.api.nvim_create_augroup('external-file-changes', { clear = true })

vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufNewFile' }, {
  desc = 'Watch open files for external changes',
  group = file_change_group,
  callback = function(event)
    if vim.bo[event.buf].buftype ~= '' then
      return
    end

    local file = vim.api.nvim_buf_get_name(event.buf)
    local directory = vim.fs.dirname(file)

    if file == '' or directory == nil or directory_watchers[directory] then
      return
    end

    local watcher = vim.uv.new_fs_event()
    local started = watcher:start(directory, {}, vim.schedule_wrap(function(error)
      if error == nil then
        pcall(vim.cmd, 'checktime')
      end
    end))

    if started then
      directory_watchers[directory] = watcher
    else
      watcher:close()
    end
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  desc = 'Stop watching files for external changes',
  group = file_change_group,
  callback = function()
    for _, watcher in pairs(directory_watchers) do
      watcher:stop()
      watcher:close()
    end
  end,
})
