AnimList = {
	Expressions = {
		{Name = "Fâché", Value = "mood_angry_1"},
		{Name = "Bourré", Value = "mood_drunk_1"},
		{Name = "Débile", Value = "pose_injured_1"},
		{Name = "Electrocuté", Value = "electrocuted_1"},
		{Name = "Enervé", Value = "effort_1"},
		{Name = "Enervé2", Value= "mood_drivefast_1"},
		{Name = "Enervé3", Value = "pose_angry_1"},
		{Name = "Content", Value = "mood_happy_1"},
		{Name = "Blessé", Value = "mood_injured_1"},
		{Name = "Joyeux", Value = "mood_dancing_low_1"},
		{Name = "Mouthbreather", Value = "smoking_hold_1"},
		{Name = "Ne cligne jamais", Value = "pose_normal_1"},
		{Name = "Un oeil", Value = "pose_aiming_1"},
		{Name = "Etonné", Value = "shocked_1"},
		{Name = "Etonné2", Value = "shocked_2"},
		{Name = "Endormi", Value = "mood_sleeping_1"},
		{Name = "Endormi2", Value = "dead_1"},
		{Name = "Endormi3", Value = "dead_2"},
		{Name = "Fier", Value = "mood_smug_1"},
		{Name = "Speculatif", Value = "mood_aiming_1"},
		{Name = "Stressé", Value = "mood_stressed_1"},
		{Name = "Bouder", Value = "mood_sulk_1"},
		{Name = "Bizarre", Value = "effort_2"},
		{Name = "Bizarre2", Value = "effort_3"},
	},
	Demarches = {
		{Name = "Alien", Value = "move_m@alien"},
		{Name = "Blindé", Value = "anim_group_move_ballistic"},
		{Name = "Arrogante", Value = "move_f@arrogant@a"},
		{Name = "Brave", Value = "move_m@brave"},
		{Name = "Casual", Value = "move_m@casual@a"},
		{Name = "Casual2", Value = "move_m@casual@b"},
		{Name = "Casual3", Value = "move_m@casual@c"},
		{Name = "Casual4", Value = "move_m@casual@d"},
		{Name = "Casual5", Value = "move_m@casual@e"},
		{Name = "Casual6", Value = "move_m@casual@f"},
		{Name = "Chichi", Value = "move_f@chichi"},
		{Name = "Confident", Value = "move_m@confident"},
		{Name = "Coincé", Value = "move_m@business@a"},
		{Name = "Coincé2", Value = "move_m@business@b"},
		{Name = "Coincé3", Value = "move_m@business@c"},
		{Name = "Défaut Femme", Value = "move_f@multiplayer"},
		{Name = "Défaut homme", Value = "move_m@multiplayer"},
		{Name = "Bourré", Value = "move_m@drunk@a"},
		{Name = "Bourré", Value = "move_m@drunk@slightlydrunk"},
		{Name = "Bourré2", Value = "move_m@buzzed"},
		{Name = "Bourré3", Value = "move_m@drunk@verydrunk"},
		{Name = "Femme", Value = "move_f@femme@"},
		{Name = "Pompier", Value = "move_characters@franklin@fire"},
		{Name = "Pompier2", Value = "move_characters@michael@fire"},
		{Name = "Pompier3", Value = "move_m@fire"},
		{Name = "efféminé", Value = "move_f@flee@a"},
		{Name = "Franklin", Value = "move_p_m_one"},
		{Name = "Gangster", Value = "move_m@gangster@generic"},
		{Name = "Gangster2", Value = "move_m@gangster@ng"},
		{Name = "Gangster3", Value = "move_m@gangster@var_e"},
		{Name = "Gangster4", Value = "move_m@gangster@var_f"},
		{Name = "Gangster5", Value = "move_m@gangster@var_i"},
		{Name = "Musicale", Value = "anim@move_m@grooving@"},
		{Name = "Garde", Value = "move_m@prison_gaurd"},
		{Name = "Menotté", Value = "move_m@prisoner_cuffed"},
		{Name = "Talons", Value = "move_f@heels@c"},
		{Name = "Talons2", Value = "move_f@heels@d"},
		{Name = "Randonnée", Value = "move_m@hiking"},
		{Name = "Hipster", Value = "move_m@hipster@a"},
		{Name = "SDF", Value = "move_m@hobo@a"},
		{Name = "Oressée", Value = "move_f@hurry@a"},
		{Name = "Homme de ménage", Value = "move_p_m_zero_janitor"},
		{Name = "Homme de ménage2", Value = "move_p_m_zero_slow"},
		{Name = "Cahoter", Value = "move_m@jog@"},
		{Name = "Rouler du cul", Value = "anim_group_move_lemar_alley"},
		{Name = "Lester", Value = "move_heist_lester"},
		{Name = "Lester2", Value = "move_lester_caneup"},
		{Name = "pupute", Value = "move_f@maneater"},
		{Name = "Michael", Value = "move_ped_bucket"},
		{Name = "Se la péter", Value = "move_m@money"},
		{Name = "Muscle", Value = "move_m@muscle@a"},
		{Name = "Chic", Value = "move_m@posh@"},
		{Name = "Chic (femme)", Value = "move_f@posh@"},
		{Name = "Rapide", Value = "move_m@quick"},
		{Name = "Rapide (femme)", Value = "female_fast_runner"},
		{Name = "Triste", Value = "move_m@sad@a"},
		{Name = "impertinent", Value = "move_m@sassy"},
		{Name = "impertinente", Value = "move_f@sassy"},
		{Name = "Effrayé", Value = "move_f@scared"},
		{Name = "Sexy", Value = "move_f@sexy@a"},
		{Name = "Balant", Value = "move_m@shadyped@a"},
		{Name = "Lent", Value = "move_characters@jimmy@slow@"},
		{Name = "Gay", Value = "move_m@swagger"},
		{Name = "Fort", Value = "move_m@tough_guy@"},
		{Name = "Forte", Value = "move_f@tough_guy@"},
		{Name = "Poubelle", Value = "clipset@move@trash_fast_turn"},
		{Name = "poubelle2", Value = "missfbi4prepp1_garbageman"},
		{Name = "Trevor", Value = "move_p_m_two"},
		{Name = "Gros", Value = "move_m@bag"},
	},
	List = {
		{
			Label = "Danses",
			Action = function(Dict, Anim, AnimOptions)
				LoadAnim(Dict)
				if AnimOptions then
					if AnimOptions.EmoteLoop then
						MovementType = 1
						if AnimOptions.EmoteMoving then
							MovementType = 51
						end
					elseif AnimOptions.EmoteMoving then
						MovementType = 51
					elseif AnimOptions.EmoteMoving == false then
						MovementType = 0
					elseif AnimOptions.EmoteStuck then
						MovementType = 50
					end
				else
					MovementType = 0
				end
				if InVehicle == 1 then
					MovementType = 51
				end
				if AnimOptions then
					if AnimOptions.EmoteDuration == nil then 
						AnimOptions.EmoteDuration = -1
						AttachWait = 0
					else
						AnimationDuration = AnimOptions.EmoteDuration
						AttachWait = AnimOptions.EmoteDuration
					end
				end
				ESX.ShowNotification(Dict)
				ESX.ShowNotification(Anim)
				TaskPlayAnim(GetPlayerPed(-1), Dict, Anim, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
				RemoveAnimDict(Dict)
			end,
			Table = {
				["dancef"] = {"anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1", "Danse F", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancef2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center", "Danse F2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancef3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Danse F3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancef4"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1", "Danse F4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancef5"] = {"anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3", "Danse F5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancef6"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up", "Danse F6", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["danceslow2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center", "Danse Lente 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["danceslow3"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down", "Danse Lente 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["danceslow4"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center", "Danse Lente 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance"] = {"anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5", "Danse", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance2"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down", "Danse 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance3"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center", "Danse 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance4"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up", "Danse 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["danceupper"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center", "Danse stimulante", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["danceupper2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up", "Danse stimulante 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["danceshy"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center", "Danse timide", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["danceshy2"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down", "Danse timide 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["danceslow"] = {"anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "low_center", "Danse lente", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly9"] = {"rcmnigel1bnmt_1b", "dance_loop_tyler", "Danse idiote 9", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance6"] = {"misschinese2_crystalmazemcs1_cs", "dance_loop_tao", "Danse 6", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance7"] = {"misschinese2_crystalmazemcs1_ig", "dance_loop_tao", "Danse 7", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance8"] = {"missfbi3_sniping", "dance_m_default", "Danse 8", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly"] = {"special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag", "Danse idiote", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly2"] = {"move_clown@p_m_zero_idles@", "fidget_short_dance", "Danse idiote 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly3"] = {"move_clown@p_m_two_idles@", "fidget_short_dance", "Danse idiote 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly4"] = {"anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz", "Danse idiote 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly5"] = {"timetable@tracy@ig_5@idle_a", "idle_a", "Danse idiote 5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly6"] = {"timetable@tracy@ig_8@idle_b", "idle_d", "Danse idiote 6", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dance9"] = {"anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up", "Danse 9", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["dancesilly8"] = {"anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie", "Danse idiote 8", AnimationOptions =
				{
					EmoteLoop = true
				}},
				["dancesilly7"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center", "Danse idiote 7", AnimationOptions =
				{
					EmoteLoop = true
				}},
				["dance5"] = {"anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center", "Danse 5", AnimationOptions =
				{
					EmoteLoop = true
				}},
				["danceglowstick"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_13_mi_hi_sexualgriding_laz", "Danse batons lumineux", AnimationOptions =
				{
					Prop = 'ba_prop_battle_glowstick_01',
					PropBone = 28422,
					PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
					SecondProp = 'ba_prop_battle_glowstick_01',
					SecondPropBone = 60309,
					SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["danceglowstick2"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_12_mi_hi_bootyshake_laz", "Danse batons lumineux 2", AnimationOptions =
				{
					Prop = 'ba_prop_battle_glowstick_01',
					PropBone = 28422,
					PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
					SecondProp = 'ba_prop_battle_glowstick_01',
					SecondPropBone = 60309,
					SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
					EmoteLoop = true,
				}},
				["danceglowstick3"] = {"anim@amb@nightclub@lazlow@hi_railing@", "ambclub_09_mi_hi_bellydancer_laz", "Danse batons lumineux 3", AnimationOptions =
				{
					Prop = 'ba_prop_battle_glowstick_01',
					PropBone = 28422,
					PropPlacement = {0.0700,0.1400,0.0,-80.0,20.0},
					SecondProp = 'ba_prop_battle_glowstick_01',
					SecondPropBone = 60309,
					SecondPropPlacement = {0.0700,0.0900,0.0,-120.0,-20.0},
					EmoteLoop = true,
				}},
				["dancehorse"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_15_handup_laz", "Danse cheval", AnimationOptions =
				{
					Prop = "ba_prop_battle_hobby_horse",
					PropBone = 28422,
					PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["dancehorse2"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "crowddance_hi_11_handup_laz", "Danse cheval 2", AnimationOptions =
				{
					Prop = "ba_prop_battle_hobby_horse",
					PropBone = 28422,
					PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
					EmoteLoop = true,
				}},
				["dancehorse3"] = {"anim@amb@nightclub@lazlow@hi_dancefloor@", "dancecrowd_li_11_hu_shimmy_laz", "Danse cheval 3", AnimationOptions =
				{
					Prop = "ba_prop_battle_hobby_horse",
					PropBone = 28422,
					PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
					EmoteLoop = true,
				}},
			},
		},
		{
			Label = "Emotes avec objet",
			Action = function()

			end,
			Table = {
				["umbrella"] = {"amb@world_human_drinking@coffee@male@base", "base", "Parapluie", AnimationOptions =
					{
						Prop = "p_amb_brolly_01",
						PropBone = 57005,
						PropPlacement = {0.15, 0.005, 0.0, 87.0, -20.0, 180.0},
						--
						EmoteLoop = true,
						EmoteMoving = true,
					}},

					-----------------------------------------------------------------------------------------------------
					------ This is an example of an emote with 2 props, pretty simple! ----------------------------------
					-----------------------------------------------------------------------------------------------------

					["notepad"] = {"missheistdockssetup1clipboard@base", "base", "Carnet", AnimationOptions =
					{
						Prop = 'prop_notepad_01',
						PropBone = 18905,
						PropPlacement = {0.1, 0.02, 0.05, 10.0, 0.0, 0.0},
						SecondProp = 'prop_pencil_01',
						SecondPropBone = 58866,
						SecondPropPlacement = {0.11, -0.02, 0.001, -120.0, 0.0, 0.0},
						-- EmoteLoop is used for emotes that should loop, its as simple as that.
						-- Then EmoteMoving is used for emotes that should only play on the upperbody.
						-- The code then checks both values and sets the MovementType to the correct one
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["box"] = {"anim@heists@box_carry@", "idle", "Boîte", AnimationOptions =
					{
						Prop = "hei_prop_heist_box",
						PropBone = 60309,
						PropPlacement = {0.025, 0.08, 0.255, -145.0, 290.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["rose"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Rose", AnimationOptions =
					{
						Prop = "prop_single_rose",
						PropBone = 18905,
						PropPlacement = {0.13, 0.15, 0.0, -100.0, 0.0, -20.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["smoke2"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_c", "Fumer 2", AnimationOptions =
					{
						Prop = 'prop_cs_ciggy_01',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["smoke3"] = {"amb@world_human_aa_smoke@male@idle_a", "idle_b", "Fumer 3", AnimationOptions =
					{
						Prop = 'prop_cs_ciggy_01',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["smoke4"] = {"amb@world_human_smoking@female@idle_a", "idle_b", "Fumer 4", AnimationOptions =
					{
						Prop = 'prop_cs_ciggy_01',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["bong"] = {"anim@safehouse@bong", "bong_stage3", "Bong", AnimationOptions =
					{
						Prop = 'hei_heist_sh_bong_01',
						PropBone = 18905,
						PropPlacement = {0.10,-0.25,0.0,95.0,190.0,180.0},
					}},
					["suitcase"] = {"missheistdocksprep1hold_cellphone", "static", "Malette", AnimationOptions =
					{
						Prop = "prop_ld_suitcase_01",
						PropBone = 57005,
						PropPlacement = {0.39, 0.0, 0.0, 0.0, 266.0, 60.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["suitcase2"] = {"missheistdocksprep1hold_cellphone", "static", "malette 2", AnimationOptions =
					{
						Prop = "prop_security_case_01",
						PropBone = 57005,
						PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["mugshot"] = {"mp_character_creation@customise@male_a", "loop", "Plaque", AnimationOptions =
					{
						Prop = 'prop_police_id_board',
						PropBone = 58868,
						PropPlacement = {0.12, 0.24, 0.0, 5.0, 0.0, 70.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Café", AnimationOptions =
					{
						Prop = 'p_amb_coffeecup_01',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
					{
						Prop = 'prop_drink_whisky',
						PropBone = 28422,
						PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Bière", AnimationOptions =
					{
						Prop = 'prop_amb_beer_bottle',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["cup"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tasse", AnimationOptions =
					{
						Prop = 'prop_plastic_cup_02',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
					{
						Prop = 'prop_amb_donut',
						PropBone = 18905,
						PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
						EmoteMoving = true,
					}},
					["burger"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Burger", AnimationOptions =
					{
						Prop = 'prop_cs_burger_01',
						PropBone = 18905,
						PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
						EmoteMoving = true,
					}},
					["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
					{
						Prop = 'prop_sandwich_01',
						PropBone = 18905,
						PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
						EmoteMoving = true,
					}},
					["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
					{
						Prop = 'prop_ecola_can',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["egobar"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Mars", AnimationOptions =
					{
						Prop = 'prop_choc_ego',
						PropBone = 60309,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteMoving = true,
					}},
					["wine"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Verre de vin", AnimationOptions =
					{
						Prop = 'prop_drink_redwine',
						PropBone = 18905,
						PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["flute"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Coupe de Champagne (vide)", AnimationOptions =
					{
						Prop = 'prop_champ_flute',
						PropBone = 18905,
						PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["champagne"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Coupe de Champagne (pleine)", AnimationOptions =
					{
						Prop = 'prop_drink_champ',
						PropBone = 18905,
						PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["cigar"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigare", AnimationOptions =
					{
						Prop = 'prop_cigar_02',
						PropBone = 47419,
						PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
						EmoteMoving = true,
						EmoteDuration = 2600
					}},
					["cigar2"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigare 2", AnimationOptions =
					{
						Prop = 'prop_cigar_01',
						PropBone = 47419,
						PropPlacement = {0.010, 0.0, 0.0, 50.0, 0.0, -80.0},
						EmoteMoving = true,
						EmoteDuration = 2600
					}},
					["guitar"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare", AnimationOptions =
					{
						Prop = 'prop_acc_guitar_01',
						PropBone = 24818,
						PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["guitar2"] = {"switch@trevor@guitar_beatdown", "001370_02_trvs_8_guitar_beatdown_idle_busker", "Guitare 2", AnimationOptions =
					{
						Prop = 'prop_acc_guitar_01',
						PropBone = 24818,
						PropPlacement = {-0.05, 0.31, 0.1, 0.0, 20.0, 150.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["guitarelectric"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare Electrique", AnimationOptions =
					{
						Prop = 'prop_el_guitar_01',
						PropBone = 24818,
						PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["guitarelectric2"] = {"amb@world_human_musician@guitar@male@idle_a", "idle_b", "Guitare Electrique 2", AnimationOptions =
					{
						Prop = 'prop_el_guitar_03',
						PropBone = 24818,
						PropPlacement = {-0.1, 0.31, 0.1, 0.0, 20.0, 150.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["book"] = {"cellphone@", "cellphone_text_read_base", "Livre", AnimationOptions =
					{
						Prop = 'prop_novel_01',
						PropBone = 6286,
						PropPlacement = {0.15, 0.03, -0.065, 0.0, 180.0, 90.0}, -- This positioning isnt too great, was to much of a hassle
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["bouquet"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Bouquet", AnimationOptions =
					{
						Prop = 'prop_snow_flower_02',
						PropBone = 24817,
						PropPlacement = {-0.29, 0.40, -0.02, -90.0, -90.0, 0.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["teddy"] = {"impexp_int-0", "mp_m_waremech_01_dual-0", "Ourson", AnimationOptions =
					{
						Prop = 'v_ilev_mr_rasberryclean',
						PropBone = 24817,
						PropPlacement = {-0.20, 0.46, -0.016, -180.0, -90.0, 0.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["backpack"] = {"move_p_m_zero_rucksack", "idle", "Sac à dos", AnimationOptions =
					{
						Prop = 'p_michael_backpack_s',
						PropBone = 24818,
						PropPlacement = {0.07, -0.11, -0.05, 0.0, 90.0, 175.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["clipboard"] = {"missfam4", "base", "Presse papier", AnimationOptions =
					{
						Prop = 'p_amb_clipboard_01',
						PropBone = 36029,
						PropPlacement = {0.16, 0.08, 0.1, -130.0, -50.0, 0.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["map"] = {"amb@world_human_tourist_map@male@base", "base", "Carte", AnimationOptions =
					{
						Prop = 'prop_tourist_map_01',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteMoving = true,
						EmoteLoop = true
					}},
					["beg"] = {"amb@world_human_bum_freeway@male@base", "base", "SDF", AnimationOptions =
					{
						Prop = 'prop_beggers_sign_03',
						PropBone = 58868,
						PropPlacement = {0.19, 0.18, 0.0, 5.0, 0.0, 40.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["makeitrain"] = {"anim@mp_player_intupperraining_cash", "idle_a", "Fais pleuvoir", AnimationOptions =
					{
						Prop = 'prop_anim_cash_pile_01',
						PropBone = 60309,
						PropPlacement = {0.0, 0.0, 0.0, 180.0, 0.0, 70.0},
						EmoteMoving = true,
						EmoteLoop = true,
					}},
					["camera"] = {"amb@world_human_paparazzi@male@base", "base", "Appareil photo", AnimationOptions =
					{
						Prop = 'prop_pap_camera_01',
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["champagnespray"] = {"anim@mp_player_intupperspray_champagne", "idle_a", "Douche de Champagne", AnimationOptions =
					{
						Prop = 'ba_prop_battle_champ_open',
						PropBone = 28422,
						PropPlacement = {0.0,0.0,0.0,0.0,0.0,0.0},
						EmoteMoving = true,
						EmoteLoop = true,
					}},
					["joint"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Joint", AnimationOptions =
					{
						Prop = 'p_cs_joint_02',
						PropBone = 47419,
						PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
						EmoteMoving = true,
						EmoteDuration = 2600
					}},
					["cig"] = {"amb@world_human_smoking@male@male_a@enter", "enter", "Cigarette", AnimationOptions =
					{
						Prop = 'prop_amb_ciggy_01',
						PropBone = 47419,
						PropPlacement = {0.015, -0.009, 0.003, 55.0, 0.0, 110.0},
						EmoteMoving = true,
						EmoteDuration = 2600
					}},
					["brief3"] = {"missheistdocksprep1hold_cellphone", "static", "Malette 3", AnimationOptions =
					{
						Prop = "prop_ld_case_01",
						PropBone = 57005,
						PropPlacement = {0.10, 0.0, 0.0, 0.0, 280.0, 53.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["tablet"] = {"amb@world_human_tourist_map@male@base", "base", "Tablette", AnimationOptions =
					{
						Prop = "prop_cs_tablet",
						PropBone = 28422,
						PropPlacement = {0.0, -0.03, 0.0, 20.0, -90.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["tablet2"] = {"amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_a", "Tablette 2", AnimationOptions =
					{
						Prop = "prop_cs_tablet",
						PropBone = 28422,
						PropPlacement = {-0.05, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["phonecall"] = {"cellphone@", "cellphone_call_listen_base", "Téléphone (appel)", AnimationOptions =
					{
						Prop = "prop_npc_phone_02",
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["phone"] = {"cellphone@", "cellphone_text_read_base", "Téléphone", AnimationOptions =
					{
						Prop = "prop_npc_phone_02",
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["clean"] = {"timetable@floyd@clean_kitchen@base", "base", "nettoyer (table)", AnimationOptions =
					{
						Prop = "prop_sponge_01",
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
					["clean2"] = {"amb@world_human_maid_clean@", "base", "nettoyer (vitre)", AnimationOptions =
					{
						Prop = "prop_sponge_01",
						PropBone = 28422,
						PropPlacement = {0.0, 0.0, -0.01, 90.0, 0.0, 0.0},
						EmoteLoop = true,
						EmoteMoving = true,
					}},
			},
		},
		{
			Label = "Diverses",
			Action = function(Dict, Anim, AnimOptions)
				LoadAnim(Dict)
				if AnimOptions then
					if AnimOptions.EmoteLoop then
						MovementType = 1
						if AnimOptions.EmoteMoving then
							MovementType = 51
						end
					elseif AnimOptions.EmoteMoving then
						MovementType = 51
					elseif AnimOptions.EmoteMoving == false then
						MovementType = 0
					elseif AnimOptions.EmoteStuck then
						MovementType = 50
					end
				else
					MovementType = 0
				end
				if InVehicle == 1 then
					MovementType = 51
				end
				if AnimOptions then
					if AnimOptions.EmoteDuration == nil then 
						AnimOptions.EmoteDuration = -1
						AttachWait = 0
					else
						AnimationDuration = AnimOptions.EmoteDuration
						AttachWait = AnimOptions.EmoteDuration
					end
				end
				ESX.ShowNotification(Dict)
				ESX.ShowNotification(Anim)
				TaskPlayAnim(GetPlayerPed(-1), Dict, Anim, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
				RemoveAnimDict(Dict)
			end,
			Table = {
				["drink"] = {"mp_player_inteat@pnq", "loop", "Boire", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 2500,
				}},
				["beast"] = {"anim@mp_fm_event@intro", "beast_transform", "Animal", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 5000,
				}},
				["chill"] = {"switch@trevor@scares_tramp", "trev_scares_tramp_idle_tramp", "Se coucher (parler)", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["cloudgaze"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_girl", "Se coucher (regarder les nuages)", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["cloudgaze2"] = {"switch@trevor@annoys_sunbathers", "trev_annoys_sunbathers_loop_guy", "Se coucher (regarder les nuages) 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["prone"] = {"missfbi3_sniping", "prone_dave", "Se coucher sur le ventre", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["pullover"] = {"misscarsteal3pullover", "pull_over_right", "Arretez-vous", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1300,
				}},
				["idle"] = {"anim@heists@heist_corona@team_idles@male_a", "idle", "Poser", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle8"] = {"amb@world_human_hang_out_street@male_b@idle_a", "idle_b", "Poser 8"},
				["idle9"] = {"friends@fra@ig_1", "base_idle", "Poser 9", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle10"] = {"mp_move@prostitute@m@french", "idle", "Poser 10", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["idle11"] = {"random@countrysiderobbery", "idle_a", "Poser 11", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle2"] = {"anim@heists@heist_corona@team_idles@female_a", "idle", "Poser 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle3"] = {"anim@heists@humane_labs@finale@strip_club", "ped_b_celebrate_loop", "Poser 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle4"] = {"anim@mp_celebration@idles@female", "celebration_idle_f_a", "Poser 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle5"] = {"anim@mp_corona_idles@female_b@idle_a", "idle_a", "Poser 5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle6"] = {"anim@mp_corona_idles@male_c@idle_a", "idle_a", "Poser 6", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idle7"] = {"anim@mp_corona_idles@male_d@idle_a", "idle_a", "Poser 7", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["wait3"] = {"amb@world_human_hang_out_street@female_hold_arm@idle_a", "idle_a", "Attendre 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idledrunk"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd1", "Poser bourré", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idledrunk2"] = {"random@drunk_driver_1", "drunk_driver_stand_loop_dd2", "Poser bourré 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["idledrunk3"] = {"missarmenian2", "standing_idle_loop_drunk", "Poser bourré 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["airguitar"] = {"anim@mp_player_intcelebrationfemale@air_guitar", "air_guitar", "Air Guitare"},
				["airsynth"] = {"anim@mp_player_intcelebrationfemale@air_synth", "air_synth", "Air Synthé"},
				["argue"] = {"misscarsteal4@actor", "actor_berating_loop", "Se disputer", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["argue2"] = {"oddjobs@assassinate@vice@hooker", "argue_a", "Se disputer 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["bartender"] = {"anim@amb@clubhouse@bar@drink@idle_a", "idle_a_bartender", "Barman", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["blowkiss"] = {"anim@mp_player_intcelebrationfemale@blow_kiss", "blow_kiss", "Baiser volant"},
				["blowkiss2"] = {"anim@mp_player_intselfieblow_kiss", "exit", "Baiser volant 2", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 2000

				}},
				["curtsy"] = {"anim@mp_player_intcelebrationpaired@f_f_sarcastic", "sarcastic_left", "révérence"},
				["bringiton"] = {"misscommon@response", "bring_it_on", "Faire le malin", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 3000
				}},
				["comeatmebro"] = {"mini@triathlon", "want_some_of_this", "Vas-y viens", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 2000
				}},
				["cop2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Police bras croisé", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["cop3"] = {"amb@code_human_police_investigate@idle_a", "idle_b", "Police radio", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["crossarms"] = {"amb@world_human_hang_out_street@female_arms_crossed@idle_a", "idle_a", "Bras croisés", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["crossarms2"] = {"amb@world_human_hang_out_street@male_c@idle_a", "idle_b", "Bras croisés 2", AnimationOptions =
				{
					EmoteMoving = true,
				}},
				["crossarms3"] = {"anim@heists@heist_corona@single_team", "single_team_loop_boss", "Bras croisés 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["crossarms4"] = {"random@street_race", "_car_b_lookout", "Bras croisés 4", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["crossarms5"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Bras croisés 5", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["foldarms2"] = {"anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop", "Bras croisés 7", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["crossarms6"] = {"random@shop_gunstore", "_idle", "Bras croisés 6", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["foldarms"] = {"anim@amb@business@bgen@bgen_no_work@", "stand_phone_phoneputdown_idle_nowork", "Bras croisés 8", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["crossarmsside"] = {"rcmnigel1a_band_groupies", "base_m2", "Bras croisés Side", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["damn"] = {"gestures@m@standing@casual", "gesture_damn", "Fais chier", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1000
				}},
				["damn2"] = {"anim@am_hold_up@male", "shoplift_mid", "Merde", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1000
				}},
				["pointdown"] = {"gestures@f@standing@casual", "gesture_hand_down", "Pinter le sol", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1000
				}},
				["surrender"] = {"random@arrests@busted", "idle_a", "mains sur la tête", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["facepalm2"] = {"anim@mp_player_intcelebrationfemale@face_palm", "face_palm", "Facepalm 2", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 8000
				}},
				["facepalm"] = {"random@car_thief@agitated@idle_a", "agitated_idle_a", "Facepalm", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 8000
				}},
				["facepalm3"] = {"missminuteman_1ig_2", "tasered_2", "Facepalm 3", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 8000
				}},
				["facepalm4"] = {"anim@mp_player_intupperface_palm", "idle_a", "Facepalm 4", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteLoop = true,
				}},
				["fallover"] = {"random@drunk_driver_1", "drunk_fall_over", "Tomber (bourré)"},
				["fallover2"] = {"mp_suicide", "pistol", "Tomber (balle tête)"},
				["fallover3"] = {"mp_suicide", "pill", "Tomber (pillule)"},
				["fallover4"] = {"friends@frf@ig_2", "knockout_plyr", "Tomber (giffle)"},
				["fallover5"] = {"anim@gangops@hostage@", "victim_fail", "Tomber (giffle) 2"},
				["fallasleep"] = {"mp_sleep", "sleep_loop", "Dormir (debout)", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteLoop = true,
				}},
				["fightme"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_c", "viens te battre"},
				["fightme2"] = {"anim@deathmatch_intros@unarmed", "intro_male_unarmed_e", "viens te battre 2"},
				["finger"] = {"anim@mp_player_intselfiethe_bird", "idle_a", "Doigt", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["finger2"] = {"anim@mp_player_intupperfinger", "idle_a_fp", "Double doigt", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["handshake"] = {"mp_ped_interaction", "handshake_guy_a", "Check", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 3000
				}},
				["wait4"] = {"amb@world_human_hang_out_street@Female_arm_side@idle_a", "idle_a", "Attendre 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["wait5"] = {"missclothing", "idle_storeclerk", "Attendre 5", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait6"] = {"timetable@amanda@ig_2", "ig_2_base_amanda", "Attendre 6", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait7"] = {"rcmnigel1cnmt_1c", "base", "Attendre 7", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait8"] = {"rcmjosh1", "idle", "Attendre 8", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait9"] = {"rcmjosh2", "josh_2_intp1_base", "Attendre 9", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait10"] = {"timetable@amanda@ig_3", "ig_3_base_tracy", "Attendre 10", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait11"] = {"misshair_shop@hair_dressers", "keeper_base", "Attendre 11", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["hiking"] = {"move_m@hiking", "idle", "Faire de la randonnée", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["hug"] = {"mp_ped_interaction", "kisses_guy_a", "Calin"},
				["hug2"] = {"mp_ped_interaction", "kisses_guy_b", "Calin 2"},
				["hug3"] = {"mp_ped_interaction", "hugs_guy_a", "Check"},
				["inspect"] = {"random@train_tracks", "idle_e", "Examiner"},
				["jazzhands"] = {"anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands", "Applaudir (sourd)", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 6000,
				}},
				["jog2"] = {"amb@world_human_jog_standing@male@idle_a", "idle_a", "Jogging 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["jog3"] = {"amb@world_human_jog_standing@female@idle_a", "idle_a", "Jogging 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["jog4"] = {"amb@world_human_power_walker@female@idle_a", "idle_a", "Jogging 4", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["jog5"] = {"move_m@joy@a", "walk", "Jogging 5", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["jumpingjacks"] = {"timetable@reunited@ig_2", "jimmy_getknocked", "Jumping Jacks", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["kneel2"] = {"rcmextreme3", "idle", "s'agenouiller 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["kneel3"] = {"amb@world_human_bum_wash@male@low@idle_a", "idle_a", "s'agenouiller 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["knock"] = {"timetable@jimmy@doorknock@", "knockdoor_idle", "frapper (porte)", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteLoop = true,
				}},
				["knock2"] = {"missheistfbi3b_ig7", "lift_fibagent_loop", "frapper (porte) 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["knucklecrunch"] = {"anim@mp_player_intcelebrationfemale@knuckle_crunch", "knuckle_crunch", "Craquer les poings", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["lapdance"] = {"mp_safehouse", "lap_dance_girl", "Lapdanse"},
				["lean2"] = {"amb@world_human_leaning@female@wall@back@hand_up@idle_a", "idle_a", "s'appyer (mur) 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["lean3"] = {"amb@world_human_leaning@female@wall@back@holding_elbow@idle_a", "idle_a", "s'appyer (mur) 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["lean4"] = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", "s'appyer (mur) 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["lean5"] = {"amb@world_human_leaning@male@wall@back@hands_together@idle_b", "idle_b", "s'appyer (mur) 5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["leanflirt"] = {"random@street_race", "_car_a_flirt_girl", "s'appyer Flirt", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["leanbar2"] = {"amb@prop_human_bum_shopping_cart@male@idle_a", "idle_c", "s'appyer (Bar) 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["leanbar3"] = {"anim@amb@nightclub@lazlow@ig1_vip@", "clubvip_base_laz", "s'appyer (Bar) 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["leanbar4"] = {"anim@heists@prison_heist", "ped_b_loop_a", "s'appyer (Bar) 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["leanhigh"] = {"anim@mp_ferris_wheel", "idle_a_player_one", "s'appyer (haut)", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["leanhigh2"] = {"anim@mp_ferris_wheel", "idle_a_player_two", "s'appyer (haut) 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["leanside"] = {"timetable@mime@01_gc", "idle_a", "s'appyer (côté)", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["leanside2"] = {"misscarstealfinale", "packer_idle_1_trevor", "s'appyer (côté) 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["leanside3"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "s'appyer (côté) 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["leanside4"] = {"misscarstealfinalecar_5_ig_1", "waitloop_lamar", "s'appyer (côté) 4", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = false,
				}},
				["leanside5"] = {"rcmjosh2", "josh_2_intp1_base", "s'appyer (côté) 5", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = false,
				}},
				["me"] = {"gestures@f@standing@casual", "gesture_me_hard", "Moi", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1000
				}},
				["mechanic"] = {"mini@repair", "fixing_a_ped", "Mécano", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["mechanic2"] = {"amb@world_human_vehicle_mechanic@male@base", "idle_a", "Mécano 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["mechanic3"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mécano 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["mechanic4"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "Mécano 4", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["medic2"] = {"amb@medic@standing@tendtodead@base", "base", "EMS 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["meditate"] = {"rcmcollect_paperleadinout@", "meditiate_idle", "Mediter", AnimationOptions = -- CHANGE ME
				{
					EmoteLoop = true,
				}},
				["meditate2"] = {"rcmepsilonism3", "ep_3_rcm_marnie_meditating", "Mediter 2", AnimationOptions = -- CHANGE ME
				{
					EmoteLoop = true,
				}},
				["meditate3"] = {"rcmepsilonism3", "base_loop", "Mediter 3", AnimationOptions = -- CHANGE ME
				{
					EmoteLoop = true,
				}},
				["metal"] = {"anim@mp_player_intincarrockstd@ps@", "idle_a", "Metal", AnimationOptions = -- CHANGE ME
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["no"] = {"anim@heists@ornate_bank@chat_manager", "fail", "Non", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["no2"] = {"mp_player_int_upper_nod", "mp_player_int_nod_no", "Non 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["nosepick"] = {"anim@mp_player_intcelebrationfemale@nose_pick", "nose_pick", "se curer le nez", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["noway"] = {"gestures@m@standing@casual", "gesture_no_way", "Pas question", AnimationOptions =
				{
					EmoteDuration = 1500,
					EmoteMoving = true,
				}},
				["ok"] = {"anim@mp_player_intselfiedock", "idle_a", "OK", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["outofbreath"] = {"re@construction", "out_of_breath", "Essouflé", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["pickup"] = {"random@domestic", "pickup_low", "Ramasser"},
				["push"] = {"missfinale_c2ig_11", "pushcar_offcliff_f", "Pousser", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["push2"] = {"missfinale_c2ig_11", "pushcar_offcliff_m", "Pousser 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["point"] = {"gestures@f@standing@casual", "gesture_point", "Pointer devant", AnimationOptions =
				{
					EmoteLoop = false,
					EmoteMoving = true,
				}},
				["pushup"] = {"amb@world_human_push_ups@male@idle_a", "idle_d", "Pompes", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["countdown"] = {"random@street_race", "grid_girl_race_start", "Encourager", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["pointright"] = {"mp_gun_shop_tut", "indicate_right", "Pointer à droite", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["salute"] = {"anim@mp_player_intincarsalutestd@ds@", "idle_a", "Salut militaire", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["salute2"] = {"anim@mp_player_intincarsalutestd@ps@", "idle_a", "Salut militaire 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["salute3"] = {"anim@mp_player_intuppersalute", "idle_a", "Salut militaire 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["scared"] = {"random@domestic", "f_distressed_loop", "apeuré", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["scared2"] = {"random@homelandsecurity", "knees_loop_girl", "apeuré 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["screwyou"] = {"misscommon@response", "screw_you", "Bras d'honneur", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["shakeoff"] = {"move_m@_idles@shake_off", "shakeoff_1", "Se dépoussiérer", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 3500,
				}},
				["shot"] = {"random@dealgonewrong", "idle_a", "Touché", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sleep"] = {"timetable@tracy@sleep@", "idle_c", "Dormir", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["shrug"] = {"gestures@f@standing@casual", "gesture_shrug_hard", "Hein ", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1000,
				}},
				["shrug2"] = {"gestures@m@standing@casual", "gesture_shrug_hard", "Hein 2", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1000,
				}},
				["sit"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_idle_nowork", "S'asseoir'", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit2"] = {"rcm_barry3", "barry_3_sit_loop", "S'asseoir 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit3"] = {"amb@world_human_picnic@male@idle_a", "idle_a", "S'asseoir 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit4"] = {"amb@world_human_picnic@female@idle_a", "idle_a", "S'asseoir 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit5"] = {"anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", "S'asseoir 5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit6"] = {"timetable@jimmy@mics3_ig_15@", "idle_a_jimmy", "S'asseoir 6", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit7"] = {"anim@amb@nightclub@lazlow@lo_alone@", "lowalone_base_laz", "S'asseoir 7", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit8"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_jimmy", "S'asseoir 8", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sit9"] = {"amb@world_human_stupor@male@idle_a", "idle_a", "S'asseoir 9", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitlean"] = {"timetable@tracy@ig_14@", "ig_14_base_tracy", "S'asseoir allongé", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitsad"] = {"anim@amb@business@bgen@bgen_no_work@", "sit_phone_phoneputdown_sleeping-noworkfemale", "S'asseoir triste", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitscared"] = {"anim@heists@ornate_bank@hostages@hit", "hit_loop_ped_b", "S'asseoir apeuré", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitscared2"] = {"anim@heists@ornate_bank@hostages@ped_c@", "flinch_loop", "S'asseoir apeuré 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitscared3"] = {"anim@heists@ornate_bank@hostages@ped_e@", "flinch_loop", "S'asseoir apeuré 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitdrunk"] = {"timetable@amanda@drunk@base", "base", "S'asseoir bourré", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitchair2"] = {"timetable@ron@ig_5_p3", "ig_5_p3_base", "S'asseoir Chaise 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitchair3"] = {"timetable@reunited@ig_10", "base_amanda", "S'asseoir Chaise 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitchair4"] = {"timetable@ron@ig_3_couch", "base", "S'asseoir Chaise 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitchair5"] = {"timetable@jimmy@mics3_ig_15@", "mics3_15_base_tracy", "S'asseoir Chaise 5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitchair6"] = {"timetable@maid@couch@", "base", "S'asseoir Chaise 6", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sitchairside"] = {"timetable@ron@ron_ig_2_alt1", "ig_2_alt1_base", "S'asseoir Chaise 7", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["situp"] = {"amb@world_human_sit_ups@male@idle_a", "idle_a", "Abdos", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["clapangry"] = {"anim@arena@celeb@flat@solo@no_props@", "angry_clap_a_player_a", "Applaudir éneré", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["slowclap3"] = {"anim@mp_player_intupperslow_clap", "idle_a", "Applaudir lentement 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["clap"] = {"amb@world_human_cheering@male_a", "base", "Applaudir", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["slowclap"] = {"anim@mp_player_intcelebrationfemale@slow_clap", "slow_clap", "Applaudir lentement", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["slowclap2"] = {"anim@mp_player_intcelebrationmale@slow_clap", "slow_clap", "Applaudir lentement 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["smell"] = {"move_p_m_two_idles@generic", "fidget_sniff_fingers", "Sentir", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["stickup"] = {"random@countryside_gang_fight", "biker_02_stickup_loop", "Pointer (arme)", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["stumble"] = {"misscarsteal4@actor", "stumble", "Etourdit (cogné)", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["stunned"] = {"stungun@standing", "damage", "Tazé", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sunbathe"] = {"amb@world_human_sunbathe@male@back@base", "base", "Couché", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["sunbathe2"] = {"amb@world_human_sunbathe@female@back@base", "base", "SuCouchénbathe 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["t"] = {"missfam5_yoga", "a2_pose", "T", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["t2"] = {"mp_sleep", "bind_pose_180", "T 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["think5"] = {"mp_cp_welcome_tutthink", "b_think", "Penser 5", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 2000,
				}},
				["think"] = {"misscarsteal4@aliens", "rehearsal_base_idle_director", "Penser", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["think3"] = {"timetable@tracy@ig_8@base", "base", "Penser 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},

				["think2"] = {"missheist_jewelleadinout", "jh_int_outro_loop_a", "Penser 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["thumbsup3"] = {"anim@mp_player_intincarthumbs_uplow@ds@", "enter", "Pousse en l'air 3", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 3000,
				}},
				["thumbsup2"] = {"anim@mp_player_intselfiethumbs_up", "idle_a", "Pousse en l'air 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["thumbsup"] = {"anim@mp_player_intupperthumbs_up", "idle_a", "Pousse en l'air", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["type"] = {"anim@heists@prison_heiststation@cop_reactions", "cop_b_idle", "Ecrire", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["type2"] = {"anim@heists@prison_heistig1_p1_guard_checks_bus", "loop", "Ecrire 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["type3"] = {"mp_prison_break", "hack_loop", "Ecrire 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["type4"] = {"mp_fbi_heist", "loop", "Ecrire 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["warmth"] = {"amb@world_human_stand_fire@male@idle_a", "idle_a", "Se réchauffer", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave4"] = {"random@mugging5", "001445_01_gangintimidation_1_female_idle_b", "Coucou 4", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 3000,
				}},
				["wave2"] = {"anim@mp_player_intcelebrationfemale@wave", "wave", "Coucou 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave3"] = {"friends@fra@ig_1", "over_here_idle_a", "Coucou 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave"] = {"friends@frj@ig_1", "wave_a", "Coucou", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave5"] = {"friends@frj@ig_1", "wave_b", "Coucou 5", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave6"] = {"friends@frj@ig_1", "wave_c", "Coucou 6", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave7"] = {"friends@frj@ig_1", "wave_d", "Coucou 7", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave8"] = {"friends@frj@ig_1", "wave_e", "Coucou 8", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wave9"] = {"gestures@m@standing@casual", "gesture_hello", "Coucou 9", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["whistle"] = {"taxi_hail", "hail_taxi", "Siffler", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 1300,
				}},
				["whistle2"] = {"rcmnigel1c", "hailing_whistle_waive_a", "Siffler 2", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 2000,
				}},
				["yeah"] = {"anim@mp_player_intupperair_shagging", "idle_a", "Yeah", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["lift"] = {"random@hitch_lift", "idle_f", "Auto stop", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["lol"] = {"anim@arena@celeb@flat@paired@no_props@", "laugh_a_player_b", "LOL", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["lol2"] = {"anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_b", "LOL 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["statue2"] = {"fra_0_int-1", "cs_lamardavis_dual-1", "Statue 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["statue3"] = {"club_intro2-0", "csb_englishdave_dual-0", "Statue 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["gangsign"] = {"mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a", "Signe gang ", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["gangsign2"] = {"mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b", "Signe gang 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["passout"] = {"missarmenian2", "drunk_loop", "Coma", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["passout2"] = {"missarmenian2", "corpse_search_exit_ped", "Coma 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["passout3"] = {"anim@gangops@morgue@table@", "body_search", "Coma (droit) 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["passout4"] = {"mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle", "Coma 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["passout5"] = {"random@mugging4", "flee_backward_loop_shopkeeper", "Coma (bourré) 5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["petting"] = {"creatures@rottweiler@tricks@", "petting_franklin", "Carresser", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["crawl"] = {"move_injured_ground", "front_loop", "Ramper (blessé)", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["flip2"] = {"anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a", "Salto côté"},
				["flip"] = {"anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a", "Salto"},
				["slide"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a", "Glisser"},
				["slide2"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_b_player_a", "Glisser 2"},
				["slide3"] = {"anim@arena@celeb@flat@solo@no_props@", "slide_c_player_a", "Glisser 3"},
				["slugger"] = {"anim@arena@celeb@flat@solo@no_props@", "slugger_a_player_a", "Home run"},
				["flipoff"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_a_1st", "Doigt d'honneur", AnimationOptions =
				{
					EmoteMoving = true,
				}},
				["flipoff2"] = {"anim@arena@celeb@podium@no_prop@", "flip_off_c_1st", "Doigt d'honneur 2", AnimationOptions =
				{
					EmoteMoving = true,
				}},
				["bow"] = {"anim@arena@celeb@podium@no_prop@", "regal_c_1st", "Révérence", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["bow2"] = {"anim@arena@celeb@podium@no_prop@", "regal_a_1st", "Révérence", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["keyfob"] = {"anim@mp_player_intmenu@key_fob@", "fob_click", "Déverrouiller voiture", AnimationOptions =
				{
					EmoteLoop = false,
					EmoteMoving = true,
					EmoteDuration = 1000,
				}},
				["golfswing"] = {"rcmnigel1d", "swing_a_mark", "Swing de Golf"},
				["eat"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Manger", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 3000,
				}},
				["reaching"] = {"move_m@intimidation@cop@unarmed", "idle", "Dégainer", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait"] = {"random@shop_tattoo", "_idle_a", "Attendre", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait2"] = {"missbigscore2aig_3", "wait_for_van_c", "Attendre 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait12"] = {"rcmjosh1", "idle", "Attendre 12", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["wait13"] = {"rcmnigel1a", "base", "Attendre 13", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["lapdance2"] = {"mini@strip_club@private_dance@idle", "priv_dance_idle", "Lapdance 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["lapdance3"] = {"mini@strip_club@private_dance@part2", "priv_dance_p2", "Lapdance 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["lapdance3"] = {"mini@strip_club@private_dance@part3", "priv_dance_p3", "Lapdance 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["twerk"] = {"switch@trevor@mocks_lapdance", "001443_01_trvs_28_idle_stripper", "Twerk", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["slap"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_slap", "Giffler", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
					EmoteDuration = 2000,
				}},
				["headbutt"] = {"melee@unarmed@streamed_variations", "plyr_takedown_front_headbutt", "Coup de boule"},
				["fishdance"] = {"anim@mp_player_intupperfind_the_fish", "idle_a", "Danse du poisson", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["peace"] = {"mp_player_int_upperpeace_sign", "mp_player_int_peace_sign", "Peace", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["peace2"] = {"anim@mp_player_intupperpeace", "idle_a", "Peace 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["cpr"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["cpr2"] = {"mini@cpr@char_a@cpr_str", "cpr_pumpchest", "CPR 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["ledge"] = {"missfbi1", "ledge_loop", "Avion accroupi", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["airplane"] = {"missfbi1", "ledge_loop", "Avion", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["peek"] = {"random@paparazzi@peek", "left_peek_a", "Espionner", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["cough"] = {"timetable@gardener@smoking_joint", "idle_cough", "Tousser", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["stretch"] = {"mini@triathlon", "idle_e", "S'étirer", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["stretch2"] = {"mini@triathlon", "idle_f", "S'étirer 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["stretch3"] = {"mini@triathlon", "idle_d", "S'étirer 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["stretch4"] = {"rcmfanatic1maryann_stretchidle_b", "idle_e", "S'étirer 4", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["celebrate"] = {"rcmfanatic1celebrate", "celebrate", "Célebrer", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["punching"] = {"rcmextreme2", "loop_punching", "Boxer", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["superhero"] = {"rcmbarry", "base", "Super hero", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["superhero2"] = {"rcmbarry", "base", "Super hero 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["mindcontrol"] = {"rcmbarry", "mind_control_b_loop", "Contrôle mental", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["mindcontrol2"] = {"rcmbarry", "bar_1_attack_idle_aln", "Contrôle mental 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["clown"] = {"rcm_barry2", "clown_idle_0", "Clown", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["clown2"] = {"rcm_barry2", "clown_idle_1", "Clown 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["clown3"] = {"rcm_barry2", "clown_idle_2", "Clown 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["clown4"] = {"rcm_barry2", "clown_idle_3", "Clown 4", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["clown5"] = {"rcm_barry2", "clown_idle_6", "Clown 5", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["tryclothes"] = {"mp_clothing@female@trousers", "try_trousers_neutral_a", "S'admirer", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["tryclothes2"] = {"mp_clothing@female@shirt", "try_shirt_positive_a", "S'admirer 2", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["tryclothes3"] = {"mp_clothing@female@shoes", "try_shoes_positive_a", "S'admirer 3", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["nervous2"] = {"mp_missheist_countrybank@nervous", "nervous_idle", "Stressé 2", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["nervous"] = {"amb@world_human_bum_standing@twitchy@idle_a", "idle_c", "Stressé", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["nervous3"] = {"rcmme_tracey1", "nervous_loop", "Stressé 3", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["uncuff"] = {"mp_arresting", "a_uncuff", "Démenotter", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["namaste"] = {"timetable@amanda@ig_4", "ig_4_base", "Namaste", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["dj"] = {"anim@amb@nightclub@djs@dixon@", "dixn_dance_cntr_open_dix", "DJ", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["threaten"] = {"random@atmrobberygen", "b_atm_mugging", "Menacer", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["radio"] = {"random@arrests", "generic_radio_chatter", "Radio", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["pull"] = {"random@mugging4", "struggle_loop_b_thief", "Tirer", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["bird"] = {"random@peyote@bird", "wakeup", "Oiseau"},
				["chicken"] = {"random@peyote@chicken", "wakeup", "Poule mouillée", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["bark"] = {"random@peyote@dog", "wakeup", "Abboyer"},
				["rabbit"] = {"random@peyote@rabbit", "wakeup", "Lapin"},
				["spiderman"] = {"missexile3", "ex03_train_roof_idle", "Spider-Man", AnimationOptions =
				{
					EmoteLoop = true,
				}},
				["boi"] = {"special_ped@jane@monologue_5@monologue_5c", "brotheradrianhasshown_2", "BOI", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 3000,
				}},
				["adjust"] = {"missmic4", "michael_tux_fidget", "Ajuster", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 4000,
				}},
				["handsup"] = {"missminuteman_1ig_2", "handsup_base", "Mains en l'air", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteLoop = true,
				}},
				["pee"] = {"misscarsteal2peeing", "peeing_loop", "Pipi", AnimationOptions =
				{
					EmoteStuck = true,
				}},
   				["mindblown"] = {"anim@mp_player_intcelebrationmale@mind_blown", "mind_blown", "époustouflé", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 4000
				}},
				["mindblown2"] = {"anim@mp_player_intcelebrationfemale@mind_blown", "mind_blown", "époustouflé 2", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 4000
				}},
				["boxing"] = {"anim@mp_player_intcelebrationmale@shadow_boxing", "shadow_boxing", "Boxer", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 4000
				}},
				["boxing2"] = {"anim@mp_player_intcelebrationfemale@shadow_boxing", "shadow_boxing", "Boxer 2", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 4000
				}},
				["stink"] = {"anim@mp_player_intcelebrationfemale@stinker", "stinker", "Puer", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteLoop = true
				}},
				["think4"] = {"anim@amb@casino@hangout@ped_male@stand@02b@idles", "idle_a", "Penser 4", AnimationOptions =
				{
					EmoteLoop = true,
					EmoteMoving = true,
				}},
				["adjusttie"] = {"clothingtie", "try_tie_positive_a", "Ajuster (cravate)", AnimationOptions =
				{
					EmoteMoving = true,
					EmoteDuration = 5000
				}},
			},
		}
	}
}