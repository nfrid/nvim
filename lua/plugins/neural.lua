local f =
io.popen('pass tokens/openai')
if not f then return end
local api_key = f:read()
f:close()

---@type LazySpec
local M = {
  'dense-analysis/neural',
  lazy = false,
  opts = {
    mappings = {
      swift = '<A-f>',
      prompt = '<A-s>',
    },
    open_ai = {
      temperature = 0.1,
      presence_penalty = 0.5,
      frequency_penalty = 0.5,
      max_tokens = 2048,
      context_lines = 16, -- Surrounding lines for swift completion
      api_key = api_key,
    },
    ui = {
      use_prompt = true, -- Use visual floating Input
      use_animated_sign = true, -- Use animated sign mark
      show_hl = true,
      show_icon = true,
      icon = '🗲', -- Prompt/Static sign icon
      icon_color = '#ffe030', -- Sign icon color
      hl_color = '#4D4839', -- Line highlighting on output
      prompt_border_color = '#E5C07B',
    },
  },
}

return M
