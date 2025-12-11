require('config.settings')
require('config.color')
require('config.font')
require('config.lsp')
-- LAZY
require('config.lazy')
-- UTIL
require('util.hjkl_notifier')
require('util.diagnostics').setup();
require('util.beacon').setup();
require('util.highlights').setup();
-- COMPLETION
require('config.completion')
-- KEYMAP
require('config.mappings')
