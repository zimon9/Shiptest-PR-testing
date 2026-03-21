/mob/living/basic/tiris
	name = "tiris"
	desc = "A herd animal native to Teceti. A very light fur coat protects it from dust and heat, but utterly fails when put against the cold. Tiris are commonly brought up for their milk, blood, and meat."
	icon_state = "tiris"
	icon_living = "tiris"
	icon_dead = "tiris_dead"
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC | MOB_BEAST
	speak_emote = list("bleats")
	speed = 1.1
	butcher_results = list(/obj/item/food/meat/slab/tiris = 6)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "kicks"
	attack_verb_simple = "kick"
	attack_vis_effect = ATTACK_EFFECT_KICK
	health = 50
	maxHealth = 50
	blood_volume = BLOOD_VOLUME_NORMAL
	ai_controller = /datum/ai_controller/basic_controller/tiris
	/// what this tiris munches on
	var/list/food_types = list(/obj/item/food/grown/wheat, /obj/item/food/grown/corn, /obj/item/food/grown/oat, /obj/item/food/grown/rice, /obj/item/food/grown/dote_berries, /obj/item/food/grown/dotu_fime, /obj/item/food/grown/fara_li, /obj/item/food/grown/sososi, /obj/item/food/grown/siti)
	/// message sent when tamed
	var/tame_message = "lets out a happy baa"
	/// singular version for player tiris
	var/self_tame_message = "let out a happy baa"
	/// What kind of milk do we produce?
	var/milked_reagent = /datum/reagent/consumable/tiris_milk

/mob/living/basic/tiris/Initialize(mapload)
	AddElement(/datum/element/pet_bonus, "bleats")
	setup_udder()
	setup_eating()
	. = ..()
	ai_controller.set_blackboard_key(BB_BASIC_FOODS, typecacheof(food_types))

///wrapper for the udder component addition so you can have uniquely uddered cow subtypes
/mob/living/basic/tiris/proc/setup_udder()
	AddComponent(/datum/component/udder, reagent_produced_typepath = milked_reagent)
	AddComponent(/datum/component/udder/tiris_vein, /obj/item/udder/tiris_vein)
/*
 * food related components and elements are set up here for a few reasons:
 *
 * * static list can be created per-subtype, since static lists cannot be inherited and then changed
 * * all eating-related components and elements share the same pool of food the mob likes
 */
/mob/living/basic/tiris/proc/setup_eating()
	var/static/list/food_types
	if(!food_types)
		food_types = src.food_types.Copy()
	AddComponent(/datum/component/tameable, food_types = food_types, tame_chance = 25, bonus_tame_chance = 15)

/mob/living/basic/tiris/tamed(mob/living/tamer, atom/food)
	visible_message("[src] [tame_message] as it seems to bond with [tamer].", "You [self_tame_message], recognizing [tamer] as your new pal.")
	//AddElement(/datum/element/ridable, /datum/component/riding/creature/cow)

