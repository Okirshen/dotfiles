vim.o.number = true
vim.o.clipboard = 'unnamed'
vim.o.tabstop = 4
vim.o.ma = true

require'plugins'
require'maps'
require'options'

vim.g.airline_theme='dracula'
-- vim.colorscheme = 'dracula'

vim.g.startify_custom_header = {
	'     ____    _    __  __ _____ _ __     _____ __  __  ',
	'    / ___|  / \\  |  \\/  | ____| |\\ \\   / /_ _|  \\/  | ',
'   | |     / _ \\ | |\\/| |  _| | | \\ \\ / / | || |\\/| | ',
'   | |___ / ___ \\| |  | | |___| |__\\ V /  | || |  | | ',
'    \\____/_/   \\_\\_|  |_|_____|_____\\_/  |___|_|  |_| ',
'                 ,,__                                 ',
'       ..  ..   / o._)                                ',   
'      /--`/--\\  \\-`|                                  ',       
'     /        \\_/ /                                   ',     
'   .`\\  \\__\\  __.`                                    ',     
'     )\\ |  )\\ |                                       ',   
'    // \\\\ // \\\\                                       ',
'   ||_  \\\\|_  \\\\_                                     ',
'   `--` `--`` `--`                                    ',
}
