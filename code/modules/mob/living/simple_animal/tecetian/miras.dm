/mob/living/simple_animal/hostile/miras
	name = "miras"
	desc = "A small game lizard native to Teceti. Under its somewhat fine scales are a succulent meat that has become a foundation of Tecetian cuisine. They're present in the Frontier as a part of assorted failed terraforming projects."
	icon = 'icons/mob/teceti/miras.dmi'
	icon_state = "miras"
	icon_living = "miras"
	icon_dead = "miras_dead"
	speak_emote = list("hisses")
	health = 25
	maxHealth = 25
	faction = list("Lizard")
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	melee_damage_lower = 3
	melee_damage_upper = 5
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "shoos"
	response_disarm_simple = "shoo"
	response_harm_continuous = "stomps on"
	response_harm_simple = "stomp on"
	ventcrawler = VENTCRAWLER_ALWAYS
	density = FALSE
	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST|MOB_REPTILE
	obj_damage = 0
	retreat_distance = 10
	minimum_distance = 10
	environment_smash = ENVIRONMENT_SMASH_NONE
	maxbodytemp = T20C + 80
	butcher_results = list(/obj/item/food/meat/slab/miras = 2)
	var/static/list/edibles = typecacheof(list(/mob/living/simple_animal/butterfly, /mob/living/basic/cockroach, /mob/living/basic/mouse)) //list of atoms, however turfs won't affect AI, but will affect consumption.


/mob/living/simple_animal/hostile/miras/CanAttack(atom/the_target)//Can we actually attack a possible target?
	if(see_invisible < the_target.invisibility)//Target's invisible to us, forget it
		return FALSE
	if(is_type_in_typecache(the_target,edibles))
		return TRUE
	return FALSE

/mob/living/simple_animal/hostile/miras/AttackingTarget()
	if(is_type_in_typecache(target,edibles)) //Makes sure player lizards only consume edibles.
		visible_message(span_notice("[name] consumes [target] in a single gulp."), span_notice("You consume [target] in a single gulp."))
		QDEL_NULL(target) //Nom
		adjustBruteLoss(-2)
		return TRUE
	else
		return ..()
