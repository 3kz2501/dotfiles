return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false,
	opts = {
		provider = "vertex_ai_claude",
		vendors = {
			vertex_ai_claude = {
				__inherited_from = "openai",
				endpoint = "https://us-east5-aiplatform.googleapis.com/v1/projects/nodex-generation-ai/locations/us-east5/publishers/anthropic/models",
				model = "claude-sonnet-4@20250514",
				api_key_name = "cmd:gcloud auth print-access-token",
				parse_curl_args = function(opts, code_opts)
					-- トークンを取得
					local api_key = ""
					if opts.api_key_name and opts.parse_api_key then
						api_key = opts.parse_api_key(opts.api_key_name)
					elseif opts.api_key_name and opts.api_key_name:match("^cmd:") then
						local cmd = opts.api_key_name:sub(5)
						api_key = vim.fn.system(cmd):gsub("%s+", "")
					end

					-- bodyをJSONとして解析
					local body_content = opts.body
					if type(body_content) == "string" then
						-- すでにJSON文字列の場合はデコード
						local ok, decoded = pcall(vim.json.decode, body_content)
						if ok then
							body_content = decoded
						end
					end

					-- メッセージを抽出
					local messages = body_content and body_content.messages or { { role = "user", content = "test" } }

					-- Vertex AI Anthropic API用のリクエストボディ
					local vertex_body = {
						anthropic_version = "vertex-2023-10-16",
						messages = messages,
						max_tokens = (body_content and body_content.max_tokens) or 4096,
						stream = true,
					}

					-- オプショナルパラメータを追加
					if body_content then
						if body_content.system then
							vertex_body.system = body_content.system
						end
						if body_content.temperature then
							vertex_body.temperature = body_content.temperature
						end
					end

					-- URLを構築
					local url = opts.endpoint .. "/" .. opts.model .. ":streamRawPredict"

					-- curlコマンドの引数を返す
					return {
						url = url,
						headers = {
							["Authorization"] = "Bearer " .. api_key,
							["Content-Type"] = "application/json",
						},
						body = vim.json.encode(vertex_body),
					}
				end,
				-- ストリーミングレスポンスをパース
				parse_response_data = function(data_stream, event_state, opts)
					if not data_stream then
						return nil
					end

					-- SSE形式のデータをパース
					if data_stream:match("^event:") then
						-- イベントタイプ行はスキップ
						return nil
					elseif data_stream:match("^data:") then
						-- data: から始まる行をパース
						local json_str = data_stream:match("^data:%s*(.+)$")
						if json_str and json_str ~= "" then
							local ok, data = pcall(vim.json.decode, json_str)
							if ok and data then
								-- content_block_deltaイベントからテキストを抽出
								if data.type == "content_block_delta" and data.delta and data.delta.text then
									return data.delta.text
								elseif data.type == "error" then
									-- エラーの場合はログに出力
									vim.notify("Vertex AI Error: " .. vim.inspect(data), vim.log.levels.ERROR)
								end
							end
						end
					end

					return nil
				end,
				-- ストリーミングを無効にするかどうか
				is_streaming = function(opts)
					return opts.stream ~= false
				end,
			},
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",
	},
}
