option = 0;
option_lenght = 4;

global.master_volume = .7;
global.music_volume = .5;
global.sfx_volume = .9;

if (!audio_is_playing(snd_main_screen))
	audio_play_sound(snd_main_screen, 1, true);
audio_sound_gain(snd_main_screen, global.master_volume * global.music_volume, 0);

text_alpha = 1;
fading = true;
fade_amount = 0.025;

title_color = make_color_rgb(61, 210, 110);
yellow = make_color_rgb(255, 245, 64);
gray = make_color_rgb(146, 143, 184);
blue = make_color_rgb(26, 70, 107);
white = make_color_rgb(250, 250, 255);

objective_text = " Sobreviva em meio as hordas de inimigos vindo em sua direcao e hackeie suas naves para recuperar energia.";