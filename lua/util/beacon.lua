---|fS "doc: Type definitions"

---@alias beacon.color
---| string Hwx code: #RRGGBB
---| number Decimal value: 12345678
---| number[] RGB: { R, G, B }
---| fun(): ( string | number | number[] ) Dynamic as value.


--- Configuration for a beacon.
---@class beacon.config
---
---@field set_keymap? boolean Should `<leader><leader>` be remapped?
---@field on_motions? table<string, beacon.instance.config> Configuration for beacons used as indicators for motions.
---
---@field default beacon.instance.config Default config.


--- Configuration for a beacon instance.
---@class beacon.instance.config
---
---@field from? beacon.color Start color.
---@field to? beacon.color End color.
---
---@field steps? integer Gradient steps.
---@field interval? integer Delay between each animation frame.

--- Configuration for a beacon instance.
---@class beacon.instance.config


--- Creates a new beacon.
---@class beacon.instance
---
---@field ns integer Anonymous namespace.
---
---@field window integer Window where the beacon should be shown(default is current window).
---@field buffer integer Buffer being shown in window.
---
---@field pos [ integer, integer ] A position(default is cursor position).
---
---@field from_color beacon.color Start color.
---@field to_color beacon.color End color.
---@field steps integer Number of steps the beacon will have.
---@field interval integer Interval between each draw cycle(in milliseconds).
---
---@field colors string[] Gradient highlight groups.
---@field step integer Current step.
---@field timer table Timer.
---
---@field __index beacon.instance
---
---@field __gradient fun(self: beacon.instance): string[] Creates the gradient for the beacon.
---@field __list_render fun(self: beacon.instance): nil Render function for `list` mode.
---@field __nolist_render fun(self: beacon.instance): nil Render function for normal mode.
---
---@field update fun(self: beacon.instance, window?: integer, config?: beacon.instance.config): nil Updates beacon state.
---@field pos fun(self: beacon.instance, pos: [ integer, integer ]): nil Updates beacon position.
---@field render fun(self: beacon.instance): nil Renders current frame.
---@field start fun(self: beacon.instance): nil Starts the beacon.
---@field stop fun(self: beacon.instance): nil Stops the beacon.

---|fE

-----------------------------------------------------------------------------

---|fS "code: Utilities"

---@param str string
---@return integer
local function last_width (str)
	local chars = vim.fn.strchars(str);
	local reduced = vim.fn.strcharpart(str, 0, chars - 1);

	return vim.fn.strdisplaywidth(str) - vim.fn.strdisplaywidth(reduced);
end

local function get_win (...)
	for _, win in ipairs({ ... }) do
		if type(win) == "number" and vim.api.nvim_win_is_valid(win) then
			return win;
		end
	end

	return vim.api.nvim_get_current_win();
end

---|fE

-----------------------------------------------------------------------------

--[[
Beacon implementation for `Neovim`. Based on the **Emacs** package with the same name.

Usage,

```lua
local beacon = require("beacon").new();
beacon:start();
```
]]
local M = {};

--- Default configuration table.
---@type beacon.config
M.config = {
	set_keymap = true,
	on_motions = {
		gg = {
			from = function ()
				local fg = vim.api.nvim_get_hl(0, { name = "Comment", create = false, link = false }).fg;
				return fg or { 147, 153, 178 };
			end,
		},
		G = {
			from = function ()
				local fg = vim.api.nvim_get_hl(0, { name = "Conditional", create = false, link = false }).fg;
				return fg or { 203, 166, 247 };
			end,
		},
	},

	default = {
		from = function ()
			local colors = {
				Function = vim.api.nvim_get_hl(0, { name = "Function", create = false, link = false }).fg,
				Character = vim.api.nvim_get_hl(0, { name = "Character", create = false, link = false }).fg,
				Constant = vim.api.nvim_get_hl(0, { name = "Constant", create = false, link = false }).fg,
				Conditional = vim.api.nvim_get_hl(0, { name = "Conditional", create = false, link = false }).fg,
				Define = vim.api.nvim_get_hl(0, { name = "Define", create = false, link = false }).fg,
				Type = vim.api.nvim_get_hl(0, { name = "Type", create = false, link = false }).fg,
				DiagnosticError = vim.api.nvim_get_hl(0, { name = "DiagnosticError", create = false, link = false }).fg,
				DiagnosticOk = vim.api.nvim_get_hl(0, { name = "DiagnosticOk", create = false, link = false }).fg,
			};

			local keys = vim.tbl_keys(colors);
			local K = math.random(1, #keys);

			return colors[keys[K]] or { 203, 166, 247 };
		end,
		to = function ()
			---@type integer?
			local bg = vim.api.nvim_get_hl(0, { name = "CursorLine", create = false, link = false }).bg;
			return bg or { 30, 30, 46 }
		end,

		steps = 10,
		interval = 100,
	}
};

---|fS "chunk: Beacon creator"

---@type beacon.instance
---@diagnostic disable-next-line: missing-fields
local beacon = {};
beacon.__index = beacon;

function beacon:__gradient ()
	---@param val beacon.color
	---@param ... any
	---@return integer[]
	local function eval (val, ...)
		if type(val) == "string" then
			---@cast val string

			local R, G, B = string.match(val, "^#?(..?)(..?)(..?)$")
			return { tonumber(R, 16), tonumber(G, 16), tonumber(B, 16) };
		elseif type(val) == "number" then
			---@cast val number

			local hex = string.format("%x", val);
			hex = string.sub(hex, 0, 6);

			local R, G, B = string.match(hex, "^(..?)(..?)(..?)$")
			return { tonumber(R, 16), tonumber(G, 16), tonumber(B, 16) };
		elseif  vim.islist(val --[[ @as any ]]) == true and type(val[1]) == "number" then
			---@cast val number[]

			return val;
		elseif pcall(val --[[ @as any ]]) then
			---@cast val fun(): ( string | number | number[] )

			local _, _val = pcall(val, ...);
			return type(_val) ~= "function" and eval(_val, ...) or { 0, 0, 0 };
		end

		return { 0, 0, 0 };
	end

	-- NOTE: Eval only when starting a new beacon.

	local from = eval(self.from_color);
	local to = eval(self.to_color);

	---@param n number
	---@param y number
	---@return integer
	local function lerp (n, y)
		local _from = from[n];
		local _to = to[n];

		return math.floor(_from + ((_to - _from) * y));
	end

	local gradient = {};
	local corrected_steps = self.steps - 1;

	for s = 0, corrected_steps do
		local multiplier = s / corrected_steps;
		local name = string.format("Beacon%dStep%d", self.ns, s);

		local color = string.format(
			"#%02x%02x%02x",
			lerp(1, multiplier),
			lerp(2, multiplier),
			lerp(3, multiplier)
		);

		table.insert(gradient, name);
		vim.api.nvim_set_hl(0, name, { bg = color });
	end

	return gradient;
end

function beacon:__list_render ()
	---|fS "func: Renderer for when `list` is enabled."

	if vim.wo[self.window].list == false then
		return;
	end

	local Y, X = self.pos[1] - 1, self.pos[2];
	vim.api.nvim_buf_clear_namespace(self.buffer, self.ns, Y, Y + 1);

	local line = vim.api.nvim_buf_get_lines(self.buffer, Y, Y + 1, false)[1] or "";
	local before = vim.fn.strpart(line, 0, X);
	local after = vim.fn.strpart(line, X);

	local C = 1;
	local removed = "";

	---@type table[]
	local virt_eol = {};

	while C <= #self.colors do
		---@type string
		local first = vim.fn.strcharpart(after, 0, 1);
		removed = removed .. first;

		---@type integer
		local width = last_width(before .. removed);

		if after == "" then
			-- Nothing after cursor. Add virtual text.
			table.insert(virt_eol, { " ", self.colors[C] });
			C = C + 1;
		elseif width > 1 then
			-- Multi-width character. Add multiple single characters.

			---@type integer
			local col = #(before .. removed) - #first;
			local virt_text = {};

			while width >= 1 do
				table.insert(virt_text, { " ", self.colors[C] });

				C = C + 1;
				width = width - 1;
			end

			vim.api.nvim_buf_set_extmark(self.buffer, self.ns, Y, col, {
				virt_text_pos = "overlay",
				virt_text = virt_text,

				hl_mode = "combine"
			});
		else
			-- Normal text. Only highlight the text.

			---@type integer
			local col = #(before .. removed) - #first;

			vim.api.nvim_buf_set_extmark(self.buffer, self.ns, Y, col, {
				end_col = col + 1,
				hl_group = self.colors[C],
			});

			C = C + 1;
		end

		after = vim.fn.strcharpart(after, 1);
	end

	if #virt_eol > 0 then
		local col = #line;

		pcall(vim.api.nvim_buf_set_extmark, self.buffer, self.ns, Y, col, {
			virt_text_pos = "inline",
			virt_text = virt_eol,
		})
	end

	---|fE
end

function beacon:__nolist_render ()
	---|fS "func: Renderer for when `list` is disabled."

	if vim.wo[self.window].list == true then
		return;
	end

	local Y, X = self.pos[1] - 1, self.pos[2];
	vim.api.nvim_buf_clear_namespace(self.buffer, self.ns, Y, Y + 1);

	local line = vim.api.nvim_buf_get_lines(self.buffer, Y, Y + 1, false)[1] or "";
	local before = vim.fn.strpart(line, 0, X);
	local after = vim.fn.strpart(line, X);

	local C = 1;
	local removed = "";

	---@type table[]
	local virt_eol = {};

	while C <= #self.colors do
		---@type string
		local first = vim.fn.strcharpart(after, 0, 1);
		removed = removed .. first;

		---@type integer
		local width = last_width(before .. removed);

		if after == "" then
			-- Nothing after cursor. Add virtual text.
			table.insert(virt_eol, { " ", self.colors[C] });
			C = C + 1;
		elseif width > 1 then
			-- Multi-width character. Add multiple single characters.

			---@type integer
			local col = #(before .. removed) - #first;
			local virt_text = {};

			while width >= 1 do
				-- If this character is under the cursor.
				-- We add empty spaces to align it correctly as
				-- the cursor is shown at the end of this character.
				if X == col and width > 1 then
					table.insert(virt_text, { " " });
				else
					table.insert(virt_text, { " ", self.colors[C] });
					C = C + 1;
				end

				width = width - 1;
			end

			vim.api.nvim_buf_set_extmark(self.buffer, self.ns, Y, col, {
				virt_text_pos = "overlay",
				virt_text = virt_text,

				hl_mode = "combine"
			});
		else
			-- Normal text. Only highlight the text.

			---@type integer
			local col = #(before .. removed) - #first;

			vim.api.nvim_buf_set_extmark(self.buffer, self.ns, Y, col, {
				end_col = col + 1,
				hl_group = self.colors[C],
			});

			C = C + 1;
		end

		after = vim.fn.strcharpart(after, 1);
	end

	if #virt_eol > 0 then
		local col = #line;

		vim.api.nvim_buf_set_extmark(self.buffer, self.ns, Y, col, {
			virt_text_pos = "inline",
			virt_text = virt_eol,
		})
	end

	---|fE
end

function beacon:render ()
	if type(self.window) == "number" and vim.api.nvim_win_is_valid(self.window) then
		self:__list_render();
		self:__nolist_render();
	end

	table.remove(self.colors, 1);
	self.step = self.step + 1;
end

function beacon:update (window, config)
	local _config = type(config) == "table" and config or {};

	self.window = get_win(window, self.window, vim.api.nvim_get_current_win());
	self.buffer = vim.api.nvim_win_get_buf(self.window);

	self.pos = vim.api.nvim_win_get_cursor(self.window);

	self.from_color = _config.from or self.from_color;
	self.to_color = _config.to or self.to_color;

	self.interval = _config.interval or self.interval;
	self.steps = _config.steps or self.steps;
	self.step = 0;

	self.colors = self:__gradient();
end

function beacon:pos (pos)
	if vim.islist(pos) then
		self.pos = pos;
	end
end

function beacon:stop ()
	if not self.timer then
		return;
	end

	self.timer:stop();
end

function beacon:start ()
	if not self.timer then
		return;
	end

	self.timer:stop();
	pcall(vim.api.nvim_buf_clear_namespace, self.buffer, self.ns, 0, -1);

	self.timer:start(0, self.interval, vim.schedule_wrap(function ()
		if self.step > self.steps then
			pcall(vim.api.nvim_buf_clear_namespace, self.buffer, self.ns, 0, -1);
			self:stop();
			return;
		end

		self:render();
	end));
end

---|fE

--- Creates a new beacon.
---@param window? integer
---@param config? beacon.instance.config
---
---@return beacon.instance
M.new = function (window, config)
	---|fS

	local _config = type(config) == "table" and config or M.config.default;
	local instance = setmetatable({}, beacon);

	instance.ns = vim.api.nvim_create_namespace("");

	instance.window = get_win(window, vim.api.nvim_get_current_win());
	instance.buffer = vim.api.nvim_win_get_buf(instance.window);

	instance.pos = vim.api.nvim_win_get_cursor(instance.window);

	instance.from_color = _config.from;
	instance.to_color = _config.to;

	instance.interval = _config.interval;
	instance.steps = _config.steps;
	instance.step = 0;

	instance.colors = instance:__gradient();

	---@diagnostic disable-next-line: undefined-field
	instance.timer = vim.uv.new_timer();

	return instance;

	---|fE
end

--- Instance of Motion event listener.
M.motion = nil;

--- Configuration for beacon.
---@param config? beacon.config
M.setup = function (config)
	---|fS

	if type(config) == "table" then
		M.config = vim.tbl_extend("force", M.config.default, config);
	end

	--- Keymap beacon.
	local instance = M.new();
	local enabled = true;

	--- Sets/Resets keymap
	local function set ()
		---|fS

		if not M.config.set_keymap or not enabled then
			vim.api.nvim_del_keymap("n", "<leader><leader>");
			return;
		end

		vim.api.nvim_set_keymap("n", "<leader><leader>", "", {
			callback = function ()
				instance:update(nil, M.config.default);
				instance:start();
			end
		});

		if M.motion then
			-- Remove the current listener.
			vim.on_key(M.motion.id, nil);
		elseif not pcall(require, "scripts.motions") then
			return;
		end

		local map = {};

		for k, v in pairs(M.config.on_motions) do
			if type(v) == "table" then
				map[k] = function ()
					vim.schedule(function ()
						if enabled == false then
							return;
						end

						instance:update(nil, v);
						instance:start();
					end);
				end
			end
		end

		M.motion = require("scripts.motions").add_event_listener(map);

		---|fE
	end

	set();

	---|fS "code: Command completion"

	vim.api.nvim_create_user_command("Beacon", function (opts)
		local fargs = opts.fargs;

		if #fargs == 0 or fargs[1] == "show" then
			instance:update(nil, M.config.default);
			instance:start();

			return;
		elseif fargs[1] == "enable" then
			enabled = true;
		elseif fargs[1] == "disable" then
			enabled = false;
		elseif fargs[1] == "toggle" then
			enabled = not enabled;
		end

		set();
	end, {
		nargs = "?",
		complete = function (aeg_lead, cmdline)
			local sub_commands = { "enable", "disable", "toggle" };

			if string.match(cmdline, "^Beacon%s+%S+%s+") then
				return {};
			elseif string.match(cmdline, "^Beacon%s*$") then
				return sub_commands;
			end

			---@type string[]
			local completeions = {};

			for _, opt in ipairs(sub_commands) do
				if string.match(opt, aeg_lead) then
					table.insert(completeions, opt);
				end
			end

			return completeions;
		end
	});

	---|fE

	---|fE
end

return M;
