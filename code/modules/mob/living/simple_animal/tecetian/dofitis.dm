/mob/living/simple_animal/hostile/dofitis
	name = "dofitis"
	desc = "The Dofitis is a Tecetian beast of burden that found a second lease on life on account of its incredible meat. When well cared for, a Dofitis’s meat has a rich marbled texture unlike any other animal. Some affectionately call the animal a ‘Doofus’ due to its simple-minded temperament, which can include bouts of aggression."
	icon = 'icons/mob/teceti/dofitis.dmi'
	icon_state = "dofitis"
	icon_living = "dofitis"
	var/icon_aggro = "dofitis"
	icon_dead = "dofitis_dead"
	pixel_x = -8
	base_pixel_x = -8
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	mouse_opacity = MOUSE_OPACITY_ICON
	move_to_delay = 30
	friendly_verb_continuous = "wails at"
	friendly_verb_simple = "wail at"
	speak_emote = list("bellows")
	speed = 2.7
	var/throw_deflection = 10
	maxHealth = 140
	health = 140
	armor = list("melee" = 0, "bullet" = 10, "laser" = 10, "energy" = 10, "bomb" = 10, "bio" = 10, "rad" = 10, "fire" = 10, "acid" = 10) //Large and strong. Minor bullet armor.
	melee_damage_lower = 12
	melee_damage_upper = 20
	attack_verb_continuous = "pulverizes"
	attack_verb_simple = "pulverize"
	attack_sound = 'sound/weapons/punch1.ogg'
	vision_range = 8
	aggro_vision_range = 9
	move_resist = MOVE_FORCE_VERY_STRONG
	gender = MALE //should be random but I'll leave it male for now because goliaths were like that
	var/can_charge = TRUE
	var/pre_attack = 0
	var/pre_attack_icon = "dofitis" //might be worth having a pre-attack icon where they lower their head
	butcher_results = list(/obj/item/food/meat/slab/dofitis = 3)
	food_type = list(/obj/item/food/grown/ash_flora/cactus_fruit) //add tecetian vegetables to this
	tame_chance = 0
	bonus_tame_chance = 0
	search_objects = 1
	wanted_objects = list(/obj/structure/flora/ash/garden/arid)
	stat_attack = SOFT_CRIT
	robust_searching = 1
	var/charging = FALSE
	var/revving_charge = FALSE
	var/charge_range = 7
	var/charge_cooldown_time = 10 SECONDS
	var/tent_range = 3
	footstep_type = FOOTSTEP_MOB_HEAVY
	a_intent = INTENT_HARM
	mob_size = MOB_SIZE_LARGE
	see_in_dark = 8
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
	faction = list("mining")

/mob/living/simple_animal/hostile/dofitis/Life()
	. = ..()
	handle_preattack()

/mob/living/simple_animal/hostile/dofitis/AttackingTarget()
	. = ..()
	if(isliving(target))
		var/mob/living/bonk = target
		if(!bonk.anchored && charging)
			var/atom/throw_target = get_edge_target_turf(bonk, src.dir)
			bonk.throw_at(throw_target, rand(2,3), 2, src, gentle = FALSE)

/mob/living/simple_animal/hostile/dofitis/proc/handle_preattack()
	if(charge_cooldown <= (world.time + charge_cooldown_time))
		pre_attack++
		charge_cooldown = world.time
		charge(target)
	if(!pre_attack || stat || AIStatus == AI_IDLE)
		return
	if(icon_state != icon_dead)
		icon_state = pre_attack_icon

/mob/living/simple_animal/hostile/dofitis/revive(full_heal = FALSE, admin_revive = FALSE)//who the fuck anchors mobs
	if(..())
		move_resist = MOVE_FORCE_VERY_STRONG
		return TRUE

/mob/living/simple_animal/hostile/dofitis/death(gibbed)
	move_resist = MOVE_RESIST_DEFAULT
	..()

/mob/living/simple_animal/hostile/dofitis/Found(atom/A)
	if(istype(A, /obj/structure/flora/ash/garden/arid))
		var/obj/structure/flora/ash/garden/arid/edible = A
		if(!edible.harvested)
			return TRUE
	return FALSE

/mob/living/simple_animal/hostile/dofitis/AttackingTarget()
	if(istype(target, /obj/structure/flora/ash/garden/arid))
		var/obj/structure/flora/ash/garden/arid/edible = target
		visible_message(span_notice("[src] eats the [edible]."))
		edible.consume()
		target = null		// Don't gnaw on the same plant forever
	else
		. = ..()

/mob/living/simple_animal/hostile/dofitis/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	handle_preattack()
	. = ..()

/mob/living/simple_animal/hostile/dofitis/Aggro()
	vision_range = aggro_vision_range
	handle_preattack()
	if((icon_state != icon_aggro) && (icon_state != icon_dead)) //can use a custom aggro icon but this works for now
		icon_state = icon_aggro

/mob/living/simple_animal/hostile/dofitis/proc/charge(atom/chargeat = target, delay = 10, chargepast = 2)
	if(!chargeat)
		return
	var/chargeturf = get_turf(chargeat)
	if(!chargeturf)
		return
	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir, chargepast)
	if(!T)
		return
	charging = TRUE
	revving_charge = TRUE
	walk(src, 0)
	setDir(dir)
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#FF0000", transform = matrix()*2, time = 3)
	SLEEP_CHECK_DEATH(delay)
	revving_charge = FALSE
	var/movespeed = 0.7
	walk_towards(src, T, movespeed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * movespeed)
	walk(src, 0) // cancel the movement
	charging = FALSE

/mob/living/simple_animal/hostile/dofitis/Bump(atom/A)
	. = ..()
	if(charging && isclosedturf(A))				// We slammed into a wall while charging
		wall_slam(A)

/mob/living/simple_animal/hostile/dofitis/proc/wall_slam(atom/A)
	charging = FALSE
	Stun(100, TRUE, TRUE)
	walk(src, 0)		// Cancel the movement
	if(ismineralturf(A))
		var/turf/closed/mineral/M = A
		if(M.mineralAmt < 7)
			M.mineralAmt++

/mob/living/simple_animal/hostile/dofitis/OpenFire()
	var/tturf = get_turf(target)
	var/dist = get_dist(src, target)
	if(!isturf(tturf) || !isliving(target))
		return
	if(dist <= charge_range && can_charge)		//Screen range check, so you can't get charged offscreen
		charge()


