function run_popup_funcY(popup_id){
	switch(popup_id){
		case POPUP_ID_COPY:
		break;
		
		case POPUP_ID_DELETE:
		break;
		
		case POPUP_ID_EXIT:
			game_end();
		break;
		
		case POPUP_ID_PLUS:
			create_textbox_popup(POPUP_RESPONSETYPE_YN, ["", "プレイヤー名を入力してください"], [
				make_color_rgb(POPUP_MAINCOLOR_R, POPUP_MAINCOLOR_G, POPUP_MAINCOLOR_B),
				make_color_rgb(POPUP_MAINCOLOR_R, POPUP_MAINCOLOR_G, POPUP_MAINCOLOR_B)
			]);
		break;
		
		case POPUP_ID_GAME_STORY:
			blur_reset();
			rm_modeselect_manager.start_game = true;
			global.button_hovering_active = false;
		break;
		
		case POPUP_ID_HOME:
			back_from_modeselect();
		break;
	}
}