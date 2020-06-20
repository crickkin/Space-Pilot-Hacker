var select_up = keyboard_check_pressed(vk_up);
var select_down = keyboard_check_pressed(vk_down);
var confirm = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_enter);

var fullscreen_trigger = keyboard_check_pressed(vk_f4);
	
if (fullscreen_trigger) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (room == rm_how_to_play || room == rm_credits) {
	var back = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace);
	
	if (back) {
		audio_play_sound(sfx_ui_cancel, 10, false);
		audio_sound_gain(sfx_ui_cancel, global.master_volume * global.sfx_volume, 0);
		room_goto(rm_main_menu);
	}
	
	exit;
}
if (select_up || select_down) {
	audio_play_sound(sfx_ui_toggle, 10, false);
	audio_sound_gain(sfx_ui_toggle, global.master_volume * global.sfx_volume, 0);
	option += (select_up) ? -1 : 1;
	if (option > option_lenght - 1) {
		option = 0;
	}
	else if (option < 0) {
		option = option_lenght - 1;
	}
}

if (confirm) {
	switch (option) {
		case 0:
			audio_play_sound(sfx_ui_confirm, 10, false);
			audio_sound_gain(sfx_ui_confirm, global.master_volume * global.sfx_volume, 0);
			room_goto(rm_gameplay);
			audio_stop_sound(snd_main_screen);
			break;
		case 1:
			audio_play_sound(sfx_ui_confirm, 10, false);
			audio_sound_gain(sfx_ui_confirm, global.master_volume * global.sfx_volume, 0);
			room_goto(rm_how_to_play);
			break;
		case 2:
			audio_play_sound(sfx_ui_confirm, 10, false);
			audio_sound_gain(sfx_ui_confirm, global.master_volume * global.sfx_volume, 0);
			room_goto(rm_credits);
			break;
		case 3:
			game_end();
			break;
		default:
			break;
	}
}

text_alpha += (fading) ? -fade_amount : fade_amount;

if ((fading && text_alpha <= 0.2) || (!fading && text_alpha >= 1)) {
	fading = !fading;
}