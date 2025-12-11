--[[
*Dynamic* highlights for `Neovim` to match the current `colorscheme`.

Usage,

```lua
require("highlights").setup();
```
]]
local highlights = {};

--- Clamps a value between 0 & 255.
---@param c integer
---@return integer
local function clamp (c)
	return math.min(
		math.max(
			0,
			math.floor(c)
		),
		255
	);
end

--[[ Turns given color into **RGB** color value. ]]
---@param input string | number
---@return config.hl.rgb
---@return boolean invalid_value Was the given value invalid?
highlights.rgb = function (input)
	---|fS

	local lookup = vim.api.nvim_get_color_map();
	local hex;

	if type(input) == "string" and (lookup[input]) then
		hex = string.format("#%06x", lookup[input]);
	elseif type(input) == "number" then
		hex = string.format("#%06x", input);
	else
		hex = type(input) == "string" and input or "#FFFFFF";
	end

	return {
		r = tonumber(
			string.sub(hex, 2, 3),
			16
		),
		g = tonumber(
			string.sub(hex, 4, 5),
			16
		),
		b = tonumber(
			string.sub(hex, 6, 7),
			16
		),
	}, type(input) ~= "string" and type(input) ~= "number";

	---|fE
end

--[[ Simple RGB color mixer. ]]
---@param c1 config.hl.rgb | config.hl.Lab
---@param c2 config.hl.rgb | config.hl.Lab
---@param p1 number
---@param p2 number
---@return config.hl.rgb | config.hl.Lab
highlights.mix = function (c1, c2, p1, p2)
	---|fS

	local out = {};

	for k, v in pairs(c1) do
		if c2[k] then
			out[k] = (v * p1) + (c2[k] * p2);
		else
			out[k] = v;
		end
	end

	return out;

	---|fE
end

--[[ `RGB` to `hex color code` converter. ]]
---@param color config.hl.rgb
---@return string
highlights.rgb_to_hex = function (color)
	return string.format(
		"#%02x%02x%02x",
		clamp(color.r),
		clamp(color.g),
		clamp(color.b)
	)
end

---|fS "chunk: sRGB <-> Oklab"

--[[
`sRGB` -> `Oklab` conversion.

Source: https://bottosson.github.io/posts/oklab/#converting-from-linear-srgb-to-oklab
License: https://bottosson.github.io/misc/License.txt
]]
---@param c config.hl.rgb
---@return config.hl.Lab
highlights.srgb_to_oklab = function (c)
    local l = 0.4122214708 * c.r + 0.5363325363 * c.g + 0.0514459929 * c.b;
	local m = 0.2119034982 * c.r + 0.6806995451 * c.g + 0.1073969566 * c.b;
	local s = 0.0883024619 * c.r + 0.2817188376 * c.g + 0.6299787005 * c.b;

    local l_ = math.pow(l, 1 / 3);
    local m_ = math.pow(m, 1 / 3);
    local s_ = math.pow(s, 1 / 3);

    return {
        L = 0.2104542553 *l_ + 0.7936177850 *m_ - 0.0040720468 *s_,
        a = 1.9779984951 *l_ - 2.4285922050 *m_ + 0.4505937099 *s_,
        b = 0.0259040371 *l_ + 0.7827717662 *m_ - 0.8086757660 *s_,
    };
end


--[[
`Oklab` -> `sRGB` conversion.

Source: https://bottosson.github.io/posts/oklab/#converting-from-linear-srgb-to-oklab
License: https://bottosson.github.io/misc/License.txt
]]
highlights.oklab_to_srgb = function (c)
    local l_ = c.L + 0.3963377774 * c.a + 0.2158037573 * c.b;
    local m_ = c.L - 0.1055613458 * c.a - 0.0638541728 * c.b;
    local s_ = c.L - 0.0894841775 * c.a - 1.2914855480 * c.b;

    local l = l_*l_*l_;
    local m = m_*m_*m_;
    local s = s_*s_*s_;

    return {
		r = clamp( 4.0767416621 * l - 3.3077115913 * m + 0.2309699292 * s),
		g = clamp(-1.2684380046 * l + 2.6097574011 * m - 0.3413193965 * s),
		b = clamp(-0.0041960863 * l - 0.7034186147 * m + 1.7076147010 * s),
    };
end

---|fE

--- Wrapper function for `nvim_set_hl()`.
---@param name string
---@param value table
highlights.set_hl = function (name, value)
	---|fS

	local found, v = pcall(vim.api.nvim_get_hl, 0, { name = name, create = false, link = false });
	local is_empty = vim.deep_equal(v, vim.empty_dict());

	if found and not is_empty then
		-- ISSUE: Old highlight group values are stored as `vim.empty_dict()`. These should be overwritten.
		-- BUG(no-regression): No way to remove any of config's highlight group entirely.
		return;
	end

	-- NOTE: `default = true` will skip empty highlight groups.
	value.default = not is_empty;
	local success, err = pcall(vim.api.nvim_set_hl, 0, name, value);

	if success == false and err then
		-- require("config.health").print({
		-- 	kind = "hl",
		--
		-- 	from = "highlights.lua",
		-- 	fn = "set_hl() -> " .. tostring(name),
		--
		-- 	name = name,
		-- 	value = value,
		-- 	message = {
		-- 		{ tostring(err), "DiagnosticError" }
		-- 	}
		-- });
	end

	---|fE
end

--- Creates highlight groups from an array of tables
---@param array table<string, config.hl>
highlights.create = function (array)
	---|fS

	if type(array) == "string" then
		if not highlights[array] then
			return;
		end

		array = highlights[array];
	end

	local hls = vim.tbl_keys(array) or {};
	table.sort(hls);

	for _, hl in ipairs(hls) do
		local _value = array[hl];
		local value;

		if type(_value) == "function" then
			local s, v = pcall(_value);

			if s then
				value = v;
			else
				value = {};
			end
		else
			value = _value;
		end

		if vim.islist(value) and #value > 0 then
			---@cast value table[]
			for _, entry in ipairs(value) do
				highlights.set_hl(entry.group_name, entry.value);
			end
		elseif type(value) == "table" then
			---@cast value table
			highlights.set_hl(hl, value);
		end
	end

	---|fE
end

--- Is the background "dark"?
--- Returns values based on this condition(when provided).
---@param on_light any
---@param on_dark any
---@return any
local is_dark = function (on_light, on_dark)
	return vim.o.background == "dark" and on_dark or on_light;
end

--[[ Gets `property` from a list of `highlight group`s. ]]
---@param property string
---@param groups string[]
---@param light any
---@param dark any
---@return any
---@private
highlights.get_property = function (property, groups, light, dark)
	---|fS

	local val;

	for _, item in ipairs(groups) do
		local hl = vim.api.nvim_get_hl(0, { name = item, link = false, create = false });

		if vim.fn.hlexists(item) == 1 and hl[property] then
			val = hl[property];
			break;
		end
	end

	local fallback = is_dark(light, dark);

	if property == "fg" or property == "bg" or property == "sp" then
		local converted, as_fallback = highlights.rgb(val or fallback);
		return as_fallback == false and converted or nil;
	else
		return val or fallback;
	end

	---|fE
end

------------------------------------------------------------------------------

--- Creates a highlight group options by inheriting options from `from`.
---@param from string
---@param with vim.api.keyset.highlight
---@param properties? string[]
---@return vim.api.keyset.highlight
highlights.inherit = function (from, with, properties)
	---|fS

	local _from = vim.api.nvim_get_hl(0, { name = from, link = false, create = false }) or {};
	local output = {};

	if properties and vim.islist(properties) then
		for _, property in ipairs(properties) do
			output[property] = _from[property];
		end
	else
		output = _from;
	end

	return vim.tbl_extend("force", output, with);

	---|fE
end

--- Creates highlight groups for code block icons.
---@param n integer
---@return vim.api.keyset.highlight
highlights.icon_hl = function (n)
	return highlights.inherit(
		"MarkviewCode",
		{
			fg = vim.api.nvim_get_hl(0, {
				name = string.format("MarkviewPalette%d", n),
				link = false, create = false
			}).fg
		}
	);
end


---@type table<string, config.hl>
highlights.groups = {
	FadedBg = function ()
		---|fS

		local bg = highlights.srgb_to_oklab(
			highlights.get_property("fg", { "Normal" }, "#EFF1F5", "#1E1E2E")
		);
		local alpha = vim.g.faded_alpha or (vim.o.background == "light" and 0.25 or 0.5);

		---@type config.hl.Lab
		local faded = {
			L = bg.L * alpha,
			a = bg.a,
			b = bg.b
		};

		return {
			bg = highlights.rgb_to_hex(
				highlights.oklab_to_srgb(faded)
			)
		};

		---|fE
	end,

	Modified = function ()
		---|fS

		return {
			{
				group_name = "@lsp.type.comment.lua",
				value = {},
			},
		};

		---|fE
	end,

	Diagnostic = function ()
		---|fS

		local bg = highlights.srgb_to_oklab(
			highlights.get_property("bg", { "Normal" }, "#EFF1F5", "#1E1E2E")
		);
		local alpha = vim.g.diagnostic_alpha or 0.1;

		local output = {};

		--- Handles a specific diagnostic kind.
		---@param kind "Default" | "Info" | "Hint" | "Warn" | "Error"
		local function handle_kind (kind)
			---|fS

			local color_map = {
				Default = { "#7C7F93", "#9399B2" },

				Info = { "#179299", "#94E2D5" },
				Hint = { "#179299", "#94E2D5" },
				Warn = { "#DF8E1D", "#F9E2AF" },
				Error = { "#D20F39", "#F38BA8" },
			};
			local this_color = color_map[kind] or color_map.Default;

			local fg = highlights.srgb_to_oklab(
				highlights.get_property("fg", {
					kind == "Default" and "@comment" or string.format("Diagnostic%s", kind),
				}, this_color[1], this_color[2])
			);
			local new_bg = highlights.mix(fg, bg, alpha, 1 - alpha);

			table.insert(output, {
				group_name = string.format("FancyDiagnostic%s", kind),
				value = {
					bg = highlights.rgb_to_hex(
						highlights.oklab_to_srgb(new_bg)
					),
					fg = highlights.rgb_to_hex(
						highlights.oklab_to_srgb(fg)
					),
				}
			});
			table.insert(output, {
				group_name = string.format("FancyDiagnostic%sIcon", kind),
				value = {
					bg = highlights.rgb_to_hex(
						highlights.oklab_to_srgb(fg)
					),
					fg = highlights.rgb_to_hex(
						highlights.oklab_to_srgb(bg)
					),
				}
			});

			---|fE
		end

		handle_kind("Default");
		handle_kind("Info");
		handle_kind("Hint");
		handle_kind("Warn");
		handle_kind("Error");

		return output;

		---|fE
	end,

	InspectTree = function ()
		---|fS

		local bg = highlights.srgb_to_oklab(
			highlights.get_property("bg", { "Normal" }, "#EFF1F5", "#1E1E2E")
		);
		local alpha = vim.g.diagnostic_alpha or 0.25;

		local output = {};

		local function handle_level (n)
			---|fS

			local color_map = {
				[0] = { "#9CA0B0", "#6C7086" },

				[1] = { "#D20F39", "#F38BA8" },
				[2] = { "#FAB387", "#FE640B" },
				[3] = { "#DF8E1D", "#F9E2AF" },
				[4] = { "#40A02B", "#A6E3A1" },
				[5] = { "#209FB5", "#74C7EC" },
				[6] = { "#7287FD", "#B4BEFE" },
			};
			local this_color = color_map[n] or color_map[1];

			local fg = highlights.srgb_to_oklab(
				highlights.get_property("fg", {
					n == 0 and "@comment" or string.format("@markup.heading.%d.markdown", n),
				}, this_color[1], this_color[2])
			);
			local new_bg = highlights.mix(fg, bg, alpha, 1 - alpha);

			table.insert(output, {
				group_name = string.format("Injection%s", n),
				value = {
					bg = highlights.rgb_to_hex(
						highlights.oklab_to_srgb(new_bg)
					),
				}
			});

			---|fE
		end

		handle_level(0);
		handle_level(1);
		handle_level(2);
		handle_level(3);
		handle_level(4);
		handle_level(5);
		handle_level(6);

		return output;

		---|fE
	end,

	Completion = function ()
		---|fS

		local bg = highlights.get_property("bg", { "Normal" }, "#EFF1F5", "#1E1E2E");
		local output = {};

		---@param kind string
		---@param src string[]
		---@param light any
		---@param dark any
		local function handle_kind (kind, src, light, dark)
			---|fS

			local fg = highlights.get_property("fg", src, light, dark);

			table.insert(output, {
				group_name = string.format("Completion%s", kind),
				value = {
					bg = highlights.rgb_to_hex(fg),
					fg = highlights.rgb_to_hex(bg)
				}
			});
			table.insert(output, {
				group_name = string.format("Completion%sBg", kind),
				value = {
					fg = highlights.rgb_to_hex(fg),
				}
			});

			---|fE
		end

		---@param from string
		---@param to string
		local function libk (from, to)
			---|fS

			table.insert(output, {
				group_name = string.format("Completion%s", from),
				value = {
					link = string.format("Completion%s", to)
				}
			});
			table.insert(output, {
				group_name = string.format("Completion%sBg", from),
				value = {
					link = string.format("Completion%sBg", to)
				}
			});

			---|fE
		end

		handle_kind("Class", { "@function" }, "#0F24B5", "#89B4FA");
		handle_kind("Color", { "@string" }, "#40A02B", "#A6E3A1");
		handle_kind("Constant", { "@constant" }, "#FE640B", "#FAB387");
		handle_kind("Constructor", { "@constructor" }, "#209FB5", "#70340C");
		handle_kind("Default", { "@comment" }, "#7C7F93", "#9399B2");
		handle_kind("Enum", { "@keyword.type" }, "#8839EF", "#CBA6F7");
		handle_kind("Field", { "@field" }, "#7287FD", "#B4BEFE");
		handle_kind("File", { "@keyword.import" }, "#8839EF", "#CBA6F7");
		handle_kind("Interface", { "@define" }, "#EA76CB", "#F5C2E7");
		handle_kind("Keyword", { "@keyword" }, "#8839EF", "#CBA6F7");
		handle_kind("Module", { "@module" }, "#7287FD", "#B4BEFE");
		handle_kind("Operator", { "@keyword.operator" }, "#04A5E5", "#89DCEB");
		handle_kind("Property", { "@property" }, "#7287FD", "#B4BEFE");
		handle_kind("Reference", { "@string.special.url" }, "#DC8A78", "#F5E0DC");
		handle_kind("Struct", { "@variable.member" }, "#7287FD", "#B4BEFE");
		handle_kind("Type", { "@type" }, "#DF8E1D", "#F9E2AF");
		handle_kind("Variable", { "@variable" }, "#4C4F69", "#CDD6F4");
		libk("Folder", "File");
		libk("Function", "Class");
		libk("Method", "Class");
		libk("Snippet", "Default");
		libk("Unit", "Constant");
		libk("Value", "Constant");

		return output;

		---|fE
	end
};

---@param opt? table<string, config.hl>
highlights.setup = function (opt)
	if type(opt) == "table" then
		highlights.groups = vim.tbl_extend("force", highlights.groups, opt);
	end

	highlights.create(highlights.groups);
end

return highlights;
