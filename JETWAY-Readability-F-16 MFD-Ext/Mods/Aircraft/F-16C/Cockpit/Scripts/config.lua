--USE_LCD_MFD = true
USE_LCD_MFD = false

args_initial_state = {}

if get_option_value("difficulty.hideStick", "local") then 
	args_initial_state[796] = 1.0
end