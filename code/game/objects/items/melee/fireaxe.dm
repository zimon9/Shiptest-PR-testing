/obj/item/melee/axe
	icon = 'icons/obj/weapon/axe.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/axes_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/axes_righthand.dmi'
	mob_overlay_icon = 'icons/mob/clothing/back.dmi'
	force = 5
	throwforce = 15
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharpness = IS_SHARP
	max_integrity = 200
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 30)
	resistance_flags = FIRE_PROOF

/obj/item/melee/axe/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 80, 0 , hitsound) //axes are not known for being precision butchering tools
	AddComponent(/datum/component/two_handed, force_unwielded=5, force_wielded=24, icon_wielded="[base_icon_state]_w")

/obj/item/melee/axe/update_icon_state()
	icon_state = "[base_icon_state]"
	return ..()

/obj/item/melee/axe/afterattack(atom/A, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(HAS_TRAIT(src, TRAIT_WIELDED)) //destroys windows and grilles in one hit
		if(istype(A, /obj/structure/window) || istype(A, /obj/structure/grille))
			var/obj/structure/W = A
			W.obj_destruction("axe")

/obj/item/melee/axe/fire  // DEM AXES MAN, marker -Agouri
	name = "fire axe"
	desc = "Truly, the weapon of a madman. Who would think to fight fire with an axe?"
	icon_state = "fireaxe"
	base_icon_state = "fireaxe"

/obj/item/melee/axe/bone  // Blatant imitation of the fireaxe, but made out of bone.
	name = "bone axe"
	desc = "A large, vicious axe crafted out of several sharpened bone plates and crudely tied together. Made of monsters, by killing monsters, for killing monsters."
	icon_state = "bone_axe"
	base_icon_state = "bone_axe"

/obj/item/melee/axe/scrap
	name = "scrap axe"
	desc = "Oversided and with a pretty dull blade, its decent against armour"
	armour_penetration = 10

/obj/item/melee/axe/scrap/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=5, force_wielded=22, icon_wielded="[base_icon_state]_w")

/*
Blunt
 */
/obj/item/melee/axe/sledgehammer
	icon_state = "sledgehammer"
	base_icon_state = "sledgehammer"
	name = "breaching sledgehammer"
	desc = "A large hammer used by the Gorlex Marauder splinters. As powerful as a weapon as it is a shipbreaking and mining tool."
	force = 5
	armour_penetration = 40
	attack_verb = list("bashed", "smashed", "crushed", "smacked")
	hitsound = list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg')
	slot_flags = ITEM_SLOT_BACK
	sharpness = IS_BLUNT
	toolspeed = 0.5
	wall_decon_damage = MINERAL_WALL_INTEGRITY
	usesound = list('sound/effects/picaxe1.ogg', 'sound/effects/picaxe2.ogg', 'sound/effects/picaxe3.ogg')
	var/wielded = FALSE

/obj/item/melee/axe/sledgehammer/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_unwielded=5, force_wielded=30, icon_wielded="[base_icon_state]_w")

/obj/item/melee/axe/sledgehammer/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(on_wield))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(on_unwield))

/obj/item/melee/axe/sledgehammer/proc/on_wield(obj/item/source, mob/user)
	SIGNAL_HANDLER

	tool_behaviour = TOOL_MINING
	wielded = TRUE

/obj/item/melee/axe/sledgehammer/proc/on_unwield(obj/item/source, mob/user)
	SIGNAL_HANDLER

	tool_behaviour = null
	wielded = FALSE

/obj/item/melee/axe/sledgehammer/attack(mob/living/target, mob/living/user)
	. = ..()
	var/atom/throw_target = get_edge_target_turf(target, user.dir)
	if(!target.anchored)
		target.throw_at(throw_target, rand(1,2), 2, user, gentle = TRUE)
