--Startup screen/navigation
return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		_Gopts = {
			position = "center",
			hl = "Type",
			wrap = "overflow",
		}

		-- DASHBOARD HEADER

		local function getGreeting(name)
			local tableTime = os.date("*t")
			local datetime = os.date(" %Y-%m-%d-%A   %H:%M:%S ")
			local hour = tableTime.hour
			local greetingsTable = {
				[1] = "  Sleep well",
				[2] = "  Good morning",
				[3] = "  Good afternoon",
				[4] = "  Good evening",
				[5] = "󰖔  Good night",
			}
			local greetingIndex = 0
			if hour == 23 or hour < 7 then
				greetingIndex = 1
			elseif hour < 12 then
				greetingIndex = 2
			elseif hour >= 12 and hour < 18 then
				greetingIndex = 3
			elseif hour >= 18 and hour < 21 then
				greetingIndex = 4
			elseif hour >= 21 then
				greetingIndex = 5
			end
			return datetime .. "  " .. greetingsTable[greetingIndex] .. ", " .. name
		end

		local fill = vim.fn.winheight(0) - 43
		local logo = (fill >= 0 and [[










    ]] or "") .. [[
                                          
       ███████████           █████      ██
      ███████████             █████ 
      ████████████████ ███████████ ███   ███████
     ████████████████ ████████████ █████ ██████████████
    █████████████████████████████ █████ █████ ████ █████
  ██████████████████████████████████ █████ █████ ████ █████
 ██████  ███ █████████████████ ████ █████ █████ ████ ██████
 ██████   ██  ███████████████   ██ █████████████████

      ]]

		local userName = "Lazy"
		local greeting = getGreeting(userName)
		local marginBottom = 0

		-- Highlight groups configuration for each segment
		local header_hl = {}

		if fill >= 0 then
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
			table.insert(header_hl, { { "Red", 1, 1 } })
		end
		table.insert(header_hl, { { "AlphaHeader0_0", 46, 48 } }) -- Line 10
		table.insert(header_hl, { -- Line 11
			{ "AlphaHeader1_0", 7, 22 },
			{ "AlphaHeader1_1", 33, 40 },
			{ "AlphaHeader1_2", 40, 50 },
		})
		table.insert(header_hl, { -- Line 12
			{ "AlphaHeader2_0", 6, 21 },
			{ "AlphaHeader2_1", 33, 45 },
		})
		table.insert(header_hl, { -- Line 13
			{ "AlphaHeader3_0", 6, 19 },
			{ "AlphaHeader3_1", 19, 20 },
			{ "AlphaHeader3_2", 20, 35 },
			{ "AlphaHeader3_3", 35, 45 },
			{ "AlphaHeader3_4", 45, 90 },
		})
		table.insert(header_hl, { -- Line 14
			{ "AlphaHeader4_0", 5, 18 },
			{ "AlphaHeader4_1", 18, 36 },
			{ "AlphaHeader4_2", 36, 45 },
			{ "AlphaHeader4_3", 45, 90 },
		})
		table.insert(header_hl, { -- Line 15
			{ "AlphaHeader5_0", 4, 17 },
			{ "AlphaHeader5_1", 17, 24 },
			{ "AlphaHeader5_2", 24, 28 },
			{ "AlphaHeader5_3", 28, 37 },
			{ "AlphaHeader5_4", 37, 46 },
			{ "AlphaHeader5_5", 46, 90 },
		})
		table.insert(header_hl, { -- Line 16
			{ "AlphaHeader6_0", 2, 17 },
			{ "AlphaHeader6_1", 17, 38 },
			{ "AlphaHeader6_2", 38, 45 },
			{ "AlphaHeader6_3", 46, 90 },
		})
		table.insert(header_hl, { -- Line 17
			{ "AlphaHeader7_0", 1, 17 },
			{ "AlphaHeader7_1", 17, 38 },
			{ "AlphaHeader7_2", 38, 45 },
			{ "AlphaHeader7_3", 46, 90 },
		})
		table.insert(header_hl, { -- Line 18 (drop shadow: one per letter group)
			{ "AlphaHeader8_0", 1, 17 },  -- N shadow
			{ "AlphaHeader8_1", 17, 38 }, -- eo shadow
			{ "AlphaHeader8_2", 38, 45 }, -- V shadow
			{ "AlphaHeader8_3", 45, 91 }, -- imm shadow
		})

		-- One Dark Atom Pro recolor: "Neo" = blue->cyan, "Vim" = teal->aqua.
		-- ("Vim" nudged off strict One Dark Pro toward teal by request.)
		-- Each letter keeps a per-line gradient (lines 11->17 lighten downward)
		-- plus the two drop shadows, retuned to navy + dark teal.
		vim.api.nvim_set_hl(0, "AlphaHeader0_0", { fg = "#a6dfcc" }) -- tittle (aqua accent)
		vim.api.nvim_set_hl(0, "AlphaHeader1_0", { fg = "#275ea2" }) -- N   (blue)
		vim.api.nvim_set_hl(0, "AlphaHeader1_1", { fg = "#2b6356" }) -- V   (teal)
		vim.api.nvim_set_hl(0, "AlphaHeader1_2", { fg = "#a6dfcc" }) -- imm (aqua, top edge)
		vim.api.nvim_set_hl(0, "AlphaHeader2_0", { fg = "#336daf" }) -- N   (blue)
		vim.api.nvim_set_hl(0, "AlphaHeader2_1", { fg = "#357364" }) -- V   (teal)
		vim.api.nvim_set_hl(0, "AlphaHeader3_0", { fg = "#3f7cbb" }) -- N   (blue)
		vim.api.nvim_set_hl(0, "AlphaHeader3_1", { fg = "#1f4d56" }) -- eo inner shadow (dark cyan)
		vim.api.nvim_set_hl(0, "AlphaHeader3_2", { fg = "#5fbecb" }) -- eo  (cyan)
		vim.api.nvim_set_hl(0, "AlphaHeader3_3", { fg = "#3f8471" }) -- V   (teal)
		vim.api.nvim_set_hl(0, "AlphaHeader3_4", { fg = "#84ceb8" }) -- imm (aqua)
		vim.api.nvim_set_hl(0, "AlphaHeader4_0", { fg = "#4b8bc8" }) -- N   (blue)
		vim.api.nvim_set_hl(0, "AlphaHeader4_1", { fg = "#68c4d0" }) -- eo  (cyan)
		vim.api.nvim_set_hl(0, "AlphaHeader4_2", { fg = "#4a947f" }) -- V   (teal)
		vim.api.nvim_set_hl(0, "AlphaHeader4_3", { fg = "#90d4c0" }) -- imm (aqua)
		vim.api.nvim_set_hl(0, "AlphaHeader5_0", { fg = "#569ad5" }) -- N   (blue)
		vim.api.nvim_set_hl(0, "AlphaHeader5_1", { fg = "#72cad5" }) -- eo  (cyan)
		vim.api.nvim_set_hl(0, "AlphaHeader5_2", { fg = "#1f4d56" }) -- eo inner shadow (dark cyan)
		vim.api.nvim_set_hl(0, "AlphaHeader5_3", { fg = "#72cad5" }) -- eo  (cyan)
		vim.api.nvim_set_hl(0, "AlphaHeader5_4", { fg = "#54a48d" }) -- V   (teal)
		vim.api.nvim_set_hl(0, "AlphaHeader5_5", { fg = "#9cd9c7" }) -- imm (aqua)
		vim.api.nvim_set_hl(0, "AlphaHeader6_0", { fg = "#62a9e1" }) -- N   (blue)
		vim.api.nvim_set_hl(0, "AlphaHeader6_1", { fg = "#7bd0da" }) -- eo  (cyan)
		vim.api.nvim_set_hl(0, "AlphaHeader6_2", { fg = "#5eb59a" }) -- V   (teal)
		vim.api.nvim_set_hl(0, "AlphaHeader6_3", { fg = "#a8dfcf" }) -- imm (aqua)
		vim.api.nvim_set_hl(0, "AlphaHeader7_0", { fg = "#6eb8ee" }) -- N   (blue, lightest)
		vim.api.nvim_set_hl(0, "AlphaHeader7_1", { fg = "#84d6df" }) -- eo  (cyan, lightest)
		vim.api.nvim_set_hl(0, "AlphaHeader7_2", { fg = "#68c5a8" }) -- V   (teal, lightest)
		vim.api.nvim_set_hl(0, "AlphaHeader7_3", { fg = "#b4e4d6" }) -- imm (aqua, lightest)
		vim.api.nvim_set_hl(0, "AlphaHeader8_0", { fg = "#233a52" }) -- N shadow (navy, matches N blue)
		vim.api.nvim_set_hl(0, "AlphaHeader8_1", { fg = "#1f4d56" }) -- eo shadow (dark cyan, matches eo)
		vim.api.nvim_set_hl(0, "AlphaHeader8_2", { fg = "#1f4a40" }) -- V shadow (dark teal, matches V)
		vim.api.nvim_set_hl(0, "AlphaHeader8_3", { fg = "#2d6254" }) -- imm shadow (dark aqua, matches imm)

		-- One Dark Pro themed dashboard text (non-logo elements)
		vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#61afef" })   -- menu labels (blue)
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#c678dd" }) -- shortcut keys (purple)
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#e5c07b" })   -- footer (One Dark Pro yellow)

		local utils = require("alpha.utils")

		local header_val = vim.split(logo, "\n")
		header_hl = utils.charhl_to_bytehl(header_hl, header_val, false)

		dashboard.section.header.opts.hl = header_hl
		dashboard.section.header.val = header_val
		-- Split logo into lines
		local logoLines = {}
		for line in logo:gmatch("[^\r\n]+") do
			table.insert(logoLines, line)
		end

		-- Calculate padding for centering the greeting
		local logoWidth = logo:find("\n") - 1 -- Assuming the logo width is the width of the first line
		local greetingWidth = #greeting
		local padding = math.floor((logoWidth - greetingWidth) / 2)

		-- Generate spaces for padding
		local paddedGreeting = string.rep(" ", padding) .. greeting

		-- Add margin lines below the padded greeting
		local margin = string.rep("\n", marginBottom)

		-- Concatenate logo, padded greeting, and margin
		local adjustedLogo = logo .. "\n" .. paddedGreeting .. margin

		local init_path = vim.fn.stdpath("config")
		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("r", "󰄉  Recent files", ":Telescope recent_files<CR>"),
			dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy update<CR>"),
			dashboard.button(
				"c",
				"󰈞  Find file in C:",
				":cd C: | silent Telescope find_files hidden=true no_ignore=true <CR>"
			),
			dashboard.button(
				"d",
				"󰮗  Find file in D:",
				":cd D: | silent Telescope find_files hidden=true no_ignore=true <CR>"
			),
			dashboard.button("s", "  Settings", ":cd " .. init_path .. "<CR>:e init.lua<CR>"),
			dashboard.button("q", "󰿅  Quit", "<cmd>q<CR>"),
			-- dashboard.button('', ''),
		}

		-- NOTE: a group-level opts.hl does NOT propagate to child buttons in alpha
		-- (groups only pass opts down when `inherit` is set). So highlight each button
		-- directly: label/icon via opts.hl, shortcut key via opts.hl_shortcut.
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButton" -- label + icon (One Dark Pro blue)
			button.opts.hl_shortcut = "AlphaShortcut" -- shortcut key (purple)
		end

		-- Footer color (overrides the dashboard default orange "Number" group)
		dashboard.section.footer.opts.hl = "AlphaFooter"
		-- local function footer()
		-- 	return "Footer Text"
		-- end

		-- dashboard.section.footer.val = vim.split('\n\n' .. getGreeting 'Lazy', '\n')

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			desc = "Add Alpha dashboard footer",
			once = true,
			callback = function()
				local stats = require("lazy").stats()
				local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
				dashboard.section.footer.val = {}
				if fill >= 0 then
					table.insert(dashboard.section.footer.val, "")
					table.insert(dashboard.section.footer.val, "")
					table.insert(dashboard.section.footer.val, "")
				end
				table.insert(
					dashboard.section.footer.val,
					" Loaded " .. stats.count .. " plugins  in " .. ms .. " ms "
				)
				for _ = 1, fill do
					table.insert(dashboard.section.footer.val, "")
				end
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
		-- Hide all the unnecessary visual elements while on the dashboard, and add
		-- them back when leaving the dashboard.
		local group = vim.api.nvim_create_augroup("CleanDashboard", {})

		vim.api.nvim_create_autocmd("User", {
			group = group,
			pattern = "AlphaReady",
			callback = function()
				-- vim.opt.showtabline = 0
				-- vim.opt.showmode = true
				-- vim.opt.laststatus = 3
				vim.opt.showcmd = false
				vim.opt.ruler = false
			end,
		})

		vim.api.nvim_create_autocmd("BufUnload", {
			group = group,
			pattern = "<buffer>",
			callback = function()
				-- vim.opt.showtabline = 0
				-- vim.opt.showmode = true
				-- vim.opt.laststatus = 3
				vim.opt.showcmd = true
				vim.opt.ruler = true
			end,
		})
		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
