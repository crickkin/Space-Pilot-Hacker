var view_width = view_get_wport(view_camera[0]);
var view_height = view_get_hport(view_camera[0]);

//draw_text_transformed(20, 20, "crick in", 1, 1, 0);
//draw_text_transformed(90, 20, "k", -1, 1, 0);

draw_set_font(fnt_ark);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (room == rm_how_to_play) {
	draw_text_transformed_color(view_width/2 + 5, 60 + 5, "Como Jogar", 4, 4, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(view_width/2, 60, "Como Jogar", 4, 4, 0, title_color, title_color, title_color, title_color, 1);
	
	draw_set_halign(fa_left);
	
	draw_sprite_ext(spr_buttons_esc, 0, 20, 20, 1.5, 1.5, 0, c_white, 1);
	draw_text_transformed_color(75, 35, "- Voltar", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(75, 30, "- Voltar", 1.5, 1.5, 0, blue, blue, blue, blue, 1);
	
	#region Controles
		draw_text_transformed_color(45, 145, "Controles", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(40, 140, "Controles", 2, 2, 0, yellow, yellow, yellow, yellow, 1);
	
		draw_sprite_ext(spr_buttons_arrows, 0, 40, 180, 1.5, 1.5, 0, c_white, 1);
		draw_text_transformed_color(165, 215, "- Mover Nave", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(160, 210, "- Mover Nave", 1.5, 1.5, 0, blue, blue, blue, blue, 1);
	
		draw_sprite_ext(spr_buttons_zc, 0, view_width/2 - 80, 180, 1.5, 1.5, 0, c_white, 1);
		draw_text_transformed_color(view_width/2 - 40, 195, "- Hackear", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(view_width/2 - 40, 190, "- Hackear", 1.5, 1.5, 0, blue, blue, blue, blue, 1);
	
		draw_text_transformed_color(view_width/2 - 32, 229, "- Atirar", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(view_width/2 - 32, 224, "- Atirar", 1.5, 1.5, 0, blue, blue, blue, blue, 1);
	
		draw_sprite_ext(spr_buttons_space, 0, view_width - 320, 160, 1.5, 1.5, 0, c_white, 1);
		draw_sprite_ext(spr_buttons_enter, 0, view_width - 295, 200, 1.5, 1.5, 0, c_white, 1);
		draw_text_transformed_color(view_width - 215, 205, "- Confirmar", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(view_width - 210, 200, "- Confirmar", 1.5, 1.5, 0, blue, blue, blue, blue, 1);
	#endregion
	
	#region Objetivo
		draw_text_transformed_color(45, view_height/2 + 45, "Objetivo:", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_transformed_color(40, view_height/2 + 40, "Objetivo:", 2, 2, 0, yellow, yellow, yellow, yellow, 1);
		
		draw_text_ext_transformed_color(45, view_height/2 + 145, objective_text, 20, 480, 2, 2, 0, c_black, c_black, c_black, c_black, 1);
		draw_text_ext_transformed_color(40, view_height/2 + 140, objective_text, 20, 480, 2, 2, 0, white, white, white, white, 1);
	#endregion
	
	draw_set_valign(fa_top);
	exit;
}
else if (room == rm_credits) {
	draw_text_transformed_color(view_width/2 + 5, 60 + 5, "Creditos", 4, 4, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(view_width/2, 60, "Creditos", 4, 4, 0, title_color, title_color, title_color, title_color, 1);
	
	draw_set_halign(fa_left);
	
	draw_sprite_ext(spr_buttons_esc, 0, 20, 20, 1.5, 1.5, 0, c_white, 1);
	draw_text_transformed_color(80, 35, "- Voltar", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(75, 30, "- Voltar", 1.5, 1.5, 0, blue, blue, blue, blue, 1);
	
	draw_set_halign(fa_center);
	
	draw_text_transformed_color(view_width/2 + 5, view_height/2 - 120, "Programacao", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(view_width/2, view_height/2 - 125, "Programacao", 2, 2, 0, blue, blue, blue, blue, 1);
	
	draw_text_transformed_color(view_width/2 + 2, view_height/2 - 75, "crick in", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(view_width/2 + 27, view_height/2 - 75, "k", -1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
	
	draw_text_transformed(view_width/2, view_height/2 - 80, "crick in", 1.5, 1.5, 0);
	draw_text_transformed(view_width/2 + 25, view_height/2 - 80, "k", -1.5, 1.5, 0);
	
	draw_text_transformed_color(view_width/2 + 5, view_height/2 + 20, "Arte e Musica", 2, 2, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(view_width/2, view_height/2 + 25, "Arte e Musica", 2, 2, 0, blue, blue, blue, blue, 1);
	
	draw_text_transformed_color(view_width/2 + 2, view_height/2 + 82, "r nsen", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
	draw_text_transformed_color(view_width/2 - 24, view_height/2 + 82, "3", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, 1);
	
	draw_text_transformed(view_width/2, view_height/2 + 80, "r nsen", 1.5, 1.5, 0);
	draw_text_transformed_color(view_width/2 - 26, view_height/2 + 79, "3", 1.5, 1.5, 0, title_color, title_color, title_color, title_color, 1);
	
	draw_set_valign(fa_top);
	exit;
}

draw_text_transformed_color(view_width/2 + 5, 150 + 5, "Space Pilot Hacker", 4, 4, 0, c_black, c_black, c_black, c_black, 1);
draw_text_transformed_color(view_width/2, 150, "Space Pilot Hacker", 4, 4, 0, title_color, title_color, title_color, title_color, 1);

switch (option) {
	case 0:
		draw_text_transformed_color(view_width/2 + 2, view_height - 208, "Iniciar", 2, 2, 0, c_black, c_black, c_black, c_black, text_alpha);
		draw_text_transformed_color(view_width/2, view_height - 210, "Iniciar", 2, 2, 0, yellow, yellow, yellow, yellow, text_alpha);
		draw_text_transformed_color(view_width/2, view_height - 160, "Como Jogar", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2, view_height - 110, "Creditos", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2, view_height - 60, "Sair", 2, 2, 0, gray, gray, gray, gray, 1);
		break;
	case 1:
		draw_text_transformed_color(view_width/2, view_height - 210, "Iniciar", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2 + 2, view_height - 158, "Como Jogar", 2, 2, 0, c_black, c_black, c_black, c_black, text_alpha);
		draw_text_transformed_color(view_width/2, view_height - 160, "Como Jogar", 2, 2, 0, yellow, yellow, yellow, yellow, text_alpha);
		draw_text_transformed_color(view_width/2, view_height - 110, "Creditos", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2, view_height - 60, "Sair", 2, 2, 0, gray, gray, gray, gray, 1);
		break;
	case 2:
		draw_text_transformed_color(view_width/2, view_height - 210, "Iniciar", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2, view_height - 160, "Como Jogar", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2 + 2, view_height - 108, "Creditos", 2, 2, 0, c_black, c_black, c_black, c_black, text_alpha);
		draw_text_transformed_color(view_width/2, view_height - 110, "Creditos", 2, 2, 0, yellow, yellow, yellow, yellow, text_alpha);
		draw_text_transformed_color(view_width/2, view_height - 60, "Sair", 2, 2, 0, gray, gray, gray, gray, 1);
		break;
	case 3:
		draw_text_transformed_color(view_width/2, view_height - 210, "Iniciar", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2, view_height - 160, "Como Jogar", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2, view_height - 110, "Creditos", 2, 2, 0, gray, gray, gray, gray, 1);
		draw_text_transformed_color(view_width/2 + 2, view_height - 58, "Sair", 2, 2, 0, c_black, c_black, c_black, c_black, text_alpha);
		draw_text_transformed_color(view_width/2, view_height - 60, "Sair", 2, 2, 0, yellow, yellow, yellow, yellow, text_alpha);
		break;
	default:
		break;
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);