local M = {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  lazy = false,
  version = false,
  opts = {
    provider = 'codestral',
    vendors = {
      codestral = {
        endpoint = 'https://codestral.mistral.ai/v1/chat/completions',
        model = 'codestral-latest',
        api_key_name = 'CODESTRAL_API_KEY',
        parse_curl_args = function(opts, code_opts)
          local api_key = os.getenv(opts.api_key_name)
          local llm = require('avante.providers')

          return {
            url = opts.endpoint,
            headers = {
              ['Accept'] = 'application/json',
              ['Content-Type'] = 'application/json',
              ['Authorization'] = 'Bearer ' .. api_key,
            },
            body = {
              model = opts.model,
              messages = llm.openai.parse_message(code_opts),
              temperature = 0.7,
              max_tokens = 8192,
              stream = true,
              safe_prompt = false,
            },
          }
        end,
        parse_response_data = function(data_stream, event_state, opts)
          local llm = require('avante.providers')
          llm.openai.parse_response(data_stream, event_state, opts)
        end,
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = 'make',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'stevearc/dressing.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
        },
      },
    },
  },
}

return M
