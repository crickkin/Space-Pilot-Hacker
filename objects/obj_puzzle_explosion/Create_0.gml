image_xscale = 4;
image_yscale = image_xscale;

audio_play_sound(sfx_puzzle_explosion, 10, false);
audio_sound_gain(sfx_puzzle_explosion, global.master_volume * global.sfx_volume, 0);