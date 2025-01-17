/obj/item/gun/ballistic/automatic/assault
	show_magazine_on_sprite = TRUE
	w_class = WEIGHT_CLASS_BULKY

	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_SEMIAUTO
	wield_delay = 0.8 SECONDS
	wield_slowdown = RIFLE_SLOWDOWN

	fire_delay = 0.2 SECONDS

	load_sound = 'sound/weapons/gun/rifle/ar_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/rifle/ar_reload.ogg'
	eject_sound = 'sound/weapons/gun/rifle/ar_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/rifle/ar_unload.ogg'

	rack_sound = 'sound/weapons/gun/rifle/ar_cock.ogg'
	spread_unwielded = 20

	gunslinger_recoil_bonus = 2
	gunslinger_spread_bonus = 16

	light_range = 2

/obj/item/gun/ballistic/automatic/assault/skm
	name = "\improper SKM-24"
	desc = "An obsolete model of assault rifle once used by CLIP. Legendary for its durability and low cost, surplus rifles are commonplace on the Frontier, and the design has been widely copied. Chambered in 7.62x40mm CLIP."
	icon = 'icons/obj/guns/manufacturer/frontier_import/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/frontier_import/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/frontier_import/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/frontier_import/onmob.dmi'

	fire_sound = 'sound/weapons/gun/rifle/skm.ogg'

	rack_sound = 'sound/weapons/gun/rifle/skm_cocked.ogg'
	load_sound = 'sound/weapons/gun/rifle/skm_reload.ogg'
	load_empty_sound = 'sound/weapons/gun/rifle/skm_reload.ogg'
	eject_sound = 'sound/weapons/gun/rifle/skm_unload.ogg'
	eject_empty_sound = 'sound/weapons/gun/rifle/skm_unload.ogg'

	icon_state = "skm"
	item_state = "skm"
	show_magazine_on_sprite = TRUE
	unique_mag_sprites_for_variants = TRUE
	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BACK
	manufacturer = MANUFACTURER_IMPORT
	default_ammo_type = /obj/item/ammo_box/magazine/skm_762_40
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/skm_762_40,
	)

	spread = 1
	wield_delay = 0.7 SECONDS

	fire_delay = 0.2 SECONDS

/obj/item/gun/ballistic/automatic/assault/skm/no_mag
	default_ammo_type = FALSE

/obj/item/gun/ballistic/automatic/assault/skm/pirate
	name = "\improper Chopper"
	desc = "An SKM-24 in a state of shockingly poor repair: Several parts are missing and the 'grip' is improvised from scrap wood. It's a miracle it still works at all. Chambered in 7.62x40mm CLIP."

	icon_state = "skm_pirate"
	item_state = "skm_pirate"
	manufacturer = MANUFACTURER_NONE

/obj/item/gun/ballistic/automatic/assault/skm/inteq
	name = "\improper SKM-44"
	desc = "An obsolete model of assault rifle once used by CLIP. Most of these were seized from Frontiersmen armories or purchased in CLIP, then modified to IRMG standards. Chambered in 7.62x40mm CLIP."

	icon = 'icons/obj/guns/manufacturer/inteq/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/inteq/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/inteq/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/inteq/onmob.dmi'

	icon_state = "skm_inteq"
	item_state = "skm_inteq"
	manufacturer = MANUFACTURER_INTEQ

/obj/item/gun/ballistic/automatic/assault/cm82
	name = "\improper CM-16"
	desc = "The standard-issue rifle of CLIP and an extensively modified reproduction of the P-16. Chambered in 5.56mm."
	icon = 'icons/obj/guns/manufacturer/clip_lanchester/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/clip_lanchester/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/clip_lanchester/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/clip_lanchester/onmob.dmi'
	icon_state = "cm16"
	item_state = "cm16"

/obj/item/gun/ballistic/automatic/assault/swiss_cheese
	name = "\improper Swiss Cheese"
	desc = "An ancient longarm famous for its boxy, modular design. Mass produced by the Terran Confederation in ages past, these often mutiple century old designs have survied due to their sheer ruggedness. The DMA on this unit is sadly broken, but these rifles are known for their excellent burst fire. Uses 5.56mm ammunition for Matter mode."
	icon = 'icons/obj/guns/manufacturer/solararmories/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/solararmories/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/solararmories/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/solararmories/onmob.dmi'
	fire_sound = 'sound/weapons/gun/rifle/swiss.ogg'
	icon_state = "swiss"
	item_state = "swiss"
	show_magazine_on_sprite = TRUE
	empty_indicator = TRUE
	burst_size = 3
	burst_delay = 0.08 SECONDS
	fire_delay = 0.25 SECONDS
	spread = 8
	weapon_weight = WEAPON_MEDIUM
	gun_firenames = list(FIREMODE_SEMIAUTO = "matter semi-auto", FIREMODE_BURST = "matter burst fire", FIREMODE_FULLAUTO = "matter full auto", FIREMODE_OTHER = "hybrid")
	gun_firemodes = list(FIREMODE_SEMIAUTO, FIREMODE_BURST, FIREMODE_FULLAUTO, FIREMODE_OTHER)

	fire_select_icon_state_prefix = "swisschesse_"

	slot_flags = ITEM_SLOT_BACK
	default_ammo_type = /obj/item/ammo_box/magazine/swiss
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/swiss,
	)
	manufacturer = MANUFACTURER_SOLARARMORIES
	spread = 8
	spread_unwielded = 15

/obj/item/gun/ballistic/automatic/assault/swiss_cheese/process_other(atom/target, mob/living/user, message = TRUE, flag, params = null, zone_override = "", bonus_spread = 0)
	to_chat(user, "<span class='danger'>You hear a strange sound from the DMA unit. It doesn't appear to be operational.</span>")

/obj/item/gun/ballistic/automatic/assault/e40
	name = "\improper E-40 Hybrid Rifle"
	desc = "A Hybrid Assault Rifle, best known for being having a dual ballistic/laser system along with an advanced ammo counter. Once an icon for bounty hunters, age has broken most down, so these end up in collector's hands or as shoddy Frontiersmen laser SMG conversions when in their inheritted stockpiles. But if one were to find one in working condition, it would be just as formidable as back then. Chambered in .299 Eoehoma caseless, and uses energy for lasers."
	icon = 'icons/obj/guns/manufacturer/eoehoma/48x32.dmi'
	lefthand_file = 'icons/obj/guns/manufacturer/eoehoma/lefthand.dmi'
	righthand_file = 'icons/obj/guns/manufacturer/eoehoma/righthand.dmi'
	mob_overlay_icon = 'icons/obj/guns/manufacturer/eoehoma/onmob.dmi'
	icon_state = "e40"
	item_state = "e40"
	default_ammo_type = /obj/item/ammo_box/magazine/e40
	allowed_ammo_types = list(
		/obj/item/ammo_box/magazine/e40,
	)
	var/obj/item/gun/energy/laser/e40_laser_secondary/secondary
	fire_select_icon_state_prefix = "e40_"

	fire_delay = 0.1 SECONDS
	recoil_unwielded = 3

	gun_firenames = list(FIREMODE_FULLAUTO = "full auto ballistic", FIREMODE_OTHER = "full auto laser")
	gun_firemodes = list(FIREMODE_FULLAUTO, FIREMODE_OTHER)
	default_firemode = FIREMODE_OTHER

	weapon_weight = WEAPON_MEDIUM
	slot_flags = ITEM_SLOT_BACK

	show_magazine_on_sprite = TRUE
	empty_indicator = TRUE
	fire_sound = 'sound/weapons/gun/laser/e40_bal.ogg'
	manufacturer = MANUFACTURER_EOEHOMA

/obj/item/gun/ballistic/automatic/assault/e40/Initialize()
	. = ..()
	secondary = new /obj/item/gun/energy/laser/e40_laser_secondary(src)
	RegisterSignal(secondary, COMSIG_ATOM_UPDATE_ICON, PROC_REF(secondary_update_icon))
	SEND_SIGNAL(secondary, COMSIG_GUN_DISABLE_AUTOFIRE)
	update_appearance()

/obj/item/gun/ballistic/automatic/assault/e40/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/ammo_hud/eoehoma) // at long last... the ammo counter on the side of the sprite is functional...

/obj/item/gun/ballistic/automatic/assault/e40/do_autofire(datum/source, atom/target, mob/living/shooter, params)
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode != FIREMODE_OTHER)
		return ..()
	return secondary.do_autofire(source, target, shooter, params)

/obj/item/gun/ballistic/automatic/assault/e40/do_autofire_shot(datum/source, atom/target, mob/living/shooter, params)
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode != FIREMODE_OTHER)
		return ..()
	return secondary.do_autofire_shot(source, target, shooter, params)

/obj/item/gun/ballistic/automatic/assault/e40/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode != FIREMODE_OTHER)
		if(!secondary.latch_closed && prob(65))
			to_chat(user, span_warning("[src]'s cell falls out!"))
			secondary.eject_cell()
		return ..()
	return secondary.process_fire(target, user, message, params, zone_override, bonus_spread)

/obj/item/gun/ballistic/automatic/assault/e40/can_shoot()
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode != FIREMODE_OTHER)
		return ..()
	return secondary.can_shoot()

/obj/item/gun/ballistic/automatic/assault/e40/afterattack(atom/target, mob/living/user, flag, params)
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode != FIREMODE_OTHER)
		return ..()
	return secondary.afterattack(target, user, flag, params)

/obj/item/gun/ballistic/automatic/assault/e40/attackby(obj/item/attack_obj, mob/user, params)
	if(istype(attack_obj, /obj/item/stock_parts/cell/gun))
		return secondary.attackby(attack_obj, user, params)
	return ..()

/obj/item/gun/ballistic/automatic/assault/e40/attack_hand(mob/user)
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode == FIREMODE_OTHER && loc == user && user.is_holding(src) && secondary.cell && !secondary.latch_closed)
		secondary.eject_cell(user)
		return
	if(current_firemode == FIREMODE_OTHER && loc == user && user.is_holding(src) && secondary.cell && secondary.latch_closed)
		to_chat(user, span_warning("The cell retainment clip is latched!"))
		return
	return ..()

/obj/item/gun/ballistic/automatic/assault/e40/AltClick(mob/living/user)
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode == FIREMODE_OTHER)
		if(secondary.latch_closed)
			to_chat(user, span_notice("You start to unlatch the [src]'s power cell retainment clip..."))
			if(do_after(user, secondary.latch_toggle_delay, src, IGNORE_USER_LOC_CHANGE))
				to_chat(user, span_notice("You unlatch [src]'s power cell retainment clip " + "<span class='red'>OPEN</span>" + "."))
				playsound(src, 'sound/items/taperecorder/taperecorder_play.ogg', 50, FALSE)
				secondary.tac_reloads = TRUE
				secondary.latch_closed = FALSE
				update_appearance()
				return
		else
			to_chat(user, span_warning("You start to latch the [src]'s power cell retainment clip..."))
			if (do_after(user, secondary.latch_toggle_delay, src, IGNORE_USER_LOC_CHANGE))
				to_chat(user, span_notice("You latch [src]'s power cell retainment clip " + "<span class='green'>CLOSED</span>" + "."))
				playsound(src, 'sound/items/taperecorder/taperecorder_close.ogg', 50, FALSE)
				secondary.tac_reloads = FALSE
				secondary.latch_closed = TRUE
				update_appearance()
				return
	else
		return ..()

/obj/item/gun/ballistic/automatic/assault/e40/on_wield(obj/item/source, mob/user)
	wielded = TRUE
	secondary.wielded = TRUE
	INVOKE_ASYNC(src, PROC_REF(do_wield), user)

/obj/item/gun/ballistic/automatic/assault/e40/do_wield(mob/user)
	. = ..()
	secondary.wielded_fully = wielded_fully

/// triggered on unwield of two handed item
/obj/item/gun/ballistic/automatic/assault/e40/on_unwield(obj/item/source, mob/user)
	. = ..()
	secondary.wielded_fully = FALSE
	secondary.wielded = FALSE


/obj/item/gun/ballistic/automatic/assault/e40/proc/secondary_update_icon()
	update_appearance()
	SEND_SIGNAL(src, COMSIG_UPDATE_AMMO_HUD)

/obj/item/gun/ballistic/automatic/assault/e40/process_other(atom/target, mob/living/user, message = TRUE, flag, params = null, zone_override = "", bonus_spread = 0)
	secondary.pre_fire(target, user, message, flag, params, zone_override, bonus_spread)


/obj/item/gun/ballistic/automatic/assault/e40/get_cell()
	return secondary.get_cell()

/obj/item/gun/ballistic/automatic/assault/e40/update_overlays()
	. = ..()
	//handle laser gunn overlays
	if(!secondary)
		return
	var/ratio = secondary.get_charge_ratio()
	if(ratio == 0)
		. += "[icon_state]_chargeempty"
	else
		. += "[icon_state]_charge[ratio]"
	if(secondary.cell)
		. += "[icon_state]_cell"
	if(ismob(loc))
		var/mutable_appearance/latch_overlay
		latch_overlay = mutable_appearance('icons/obj/guns/cell_latch.dmi')
		if(secondary.latch_closed)
			if(secondary.cell)
				latch_overlay.icon_state = "latch-on-full"
			else
				latch_overlay.icon_state = "latch-on-empty"
		else
			if(secondary.cell)
				latch_overlay.icon_state = "latch-off-full"
			else
				latch_overlay.icon_state = "latch-off-empty"
		. += latch_overlay


/obj/item/gun/ballistic/automatic/assault/e40/toggle_safety(mob/user, silent=FALSE)
	. = ..()
	secondary.toggle_safety(user, silent=TRUE)

/obj/item/gun/ballistic/automatic/assault/e40/fire_select(mob/living/carbon/human/user)
	. = ..()
	var/current_firemode = gun_firemodes[firemode_index]
	if(current_firemode == FIREMODE_OTHER)
		SEND_SIGNAL(src, COMSIG_GUN_ENABLE_AUTOFIRE)
		SEND_SIGNAL(src, COMSIG_GUN_SET_AUTOFIRE_SPEED, secondary.fire_delay)
	else
		SEND_SIGNAL(src, COMSIG_GUN_SET_AUTOFIRE_SPEED, fire_delay)
	SEND_SIGNAL(src, COMSIG_UPDATE_AMMO_HUD)

/obj/item/gun/ballistic/automatic/assault/e40/examine(mob/user)
	. = ..()
	if(!secondary.internal_magazine)
		. += "The cell retainment latch is [secondary.latch_closed ? "<span class='green'>CLOSED</span>" : "<span class='red'>OPEN</span>"]. Alt-Click to toggle the latch."
	var/obj/item/ammo_casing/energy/shot = secondary.ammo_type[select]
	if(secondary.cell)
		. += "\The [name]'s cell has [secondary.cell.percent()]% charge remaining."
		. += "\The [name] has [round(secondary.cell.charge/shot.e_cost)] shots remaining on <b>[shot.select_name]</b> mode."
	else
		. += span_notice("\The [name] doesn't seem to have a cell!")

//laser

/obj/item/gun/energy/laser/e40_laser_secondary
	name = "secondary e40 laser gun"
	desc = "The laser component of a E-40 Hybrid Rifle. You probably shouldn't see this. If you can though, you should probably know lorewise, this is primary, the ballistic compontent in universe is secondary. Unfortunately, we cannot simulate this, So codewise this is secondary."
	fire_sound = 'sound/weapons/gun/laser/e40_las.ogg'
	w_class = WEIGHT_CLASS_NORMAL
	ammo_type = list(/obj/item/ammo_casing/energy/laser/assault)
	fire_delay = 0.2 SECONDS
	gun_firemodes = list(FIREMODE_FULLAUTO)
	default_firemode = FIREMODE_FULLAUTO
	latch_toggle_delay = 1.2 SECONDS
	valid_attachments = list()

	spread_unwielded = 20
