if(global.active_draw_gui1){
	//mapの描画
	draw_sprite_ext(spr_map, 0, 0, 0, 1, 1, 0, c_white, 1);
	var map_x = 77;
	var map_y = 62;
	for(var i = 0; i < DANGEON_SIZE_X/128; i++){
		for(var j = 0; j < DANGEON_SIZE_X/128; j++){
			data = ds_grid_get(dangeon_manager.dangeon_info, i, j);
			draw_set_color(data);
			if(data == -1){
				//draw_set_alpha(0);
			}else{
				draw_rectangle(map_x + 3*i, map_y + 3*j, map_x + 3*(i+1), map_y + 3*(j+1), false);
			}
		}
	}
	

	//HPの描画
	if(instance_exists(obj_player)){
		var hp = obj_player.player_health;
		for(var i = 1; i <= PLAYER_HEALTH_MAX; i++){
			//HP(色付き)
			if(i <= floor(hp)){
				draw_sprite(spr_hp1, 0, 30 + 82*i, window_get_height() - 130);
				continue;
			}
		
			//half HP
			if(hp > i-1 && hp < i){
				draw_sprite(spr_hp2, 0, 30 + 82*i, window_get_height() - 130);
				continue;
			}
		
			//empty HP
			draw_sprite(spr_hp3, 0, 30 + 82*i, window_get_height() - 130);
		}
	}

	//持ち物の描画
	draw_sprite(spr_itemholder, 0, window_get_width() - sprite_get_width(spr_itemholder), window_get_height() - sprite_get_height(spr_itemholder));
	//メインアイテム
	if(obj_player.hold_item_index == -1){
		draw_sprite(get_pickaxe_sprite(obj_player.pickaxe_id), 0, window_get_width() - sprite_get_width(spr_itemholder) + 75, window_get_height() - sprite_get_height(spr_itemholder) + 110);
	}else{
		draw_sprite(get_holditem_sprite(obj_player.hold_item_index), 0, window_get_width() - sprite_get_width(spr_itemholder) + 75, window_get_height() - sprite_get_height(spr_itemholder) + 110);
		
		draw_set_font(font_popup);
		var color = c_black;
		draw_set_color(color);
		draw_text(window_get_width() - sprite_get_width(spr_itemholder) + 225, window_get_height() - sprite_get_height(spr_itemholder) + 233, string(obj_player.inventory[obj_player.hold_item_index]));
		draw_set_font(font_main);
	}
	
	//サブアイテム
	if(obj_player.hold_subitem_index == -1){
		draw_sprite_stretched(get_pickaxe_sprite(obj_player.pickaxe_id), 0, window_get_width() - sprite_get_width(spr_itemholder) + 230, window_get_height() - sprite_get_height(spr_itemholder) + 95, 50, 50);
	}else{
		draw_sprite_stretched(get_holditem_sprite(obj_player.hold_subitem_index), 0, window_get_width() - sprite_get_width(spr_itemholder) + 230, window_get_height() - sprite_get_height(spr_itemholder) + 95, 50, 50);
	}
}