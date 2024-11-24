/datum/surgery/lobotomy
	name = "Lobotomy"
	desc = "An invasive procedure that does nothing but cause brain damage and give a permanent trauma."
	steps = list(
	/datum/surgery_step/incise,
	/datum/surgery_step/retract_skin,
	/datum/surgery_step/saw,
	/datum/surgery_step/clamp_bleeders,
	/datum/surgery_step/lobotomize,
	/datum/surgery_step/close)

	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_HEAD)
	requires_bodypart_type = 0

/datum/surgery/lobotomy/can_start(mob/user, mob/living/carbon/target)
	if(!..())
		return FALSE
	var/obj/item/organ/brain/B = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(!B)
		return FALSE
	return TRUE

/datum/surgery_step/lobotomize
	name = "perform lobotomy"
	implements = list(
		TOOL_SCALPEL = 85, // there is no way this should be reasonable to do basically at all without a real surgery. ghetto lobotomy, for real?
		/obj/item/melee/energy/sword = 25,
		/obj/item/melee/knife = 15,
		/obj/item/shard = 10,
		/obj/item = 5)
	time = 10 SECONDS
	preop_sound = 'sound/surgery/scalpel1.ogg'
	success_sound = 'sound/surgery/scalpel2.ogg'
	failure_sound = 'sound/surgery/organ2.ogg'
	experience_given = MEDICAL_SKILL_ADVANCED //lose XP if you end up giving them bad traumas

/datum/surgery_step/lobotomize/tool_check(mob/user, obj/item/tool)
	if(implement_type == /obj/item && !tool.get_sharpness())
		return FALSE
	return TRUE

/datum/surgery_step/lobotomize/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to perform a lobotomy on [target]'s brain...</span>",
		"<span class='notice'>[user] begins to perform a lobotomy on [target]'s brain.</span>",
		"<span class='notice'>[user] begins to perform surgery on [target]'s brain.</span>")

/datum/surgery_step/lobotomize/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	display_results(user, target, "<span class='notice'>You succeed in lobotomizing [target].</span>",
			"<span class='notice'>[user] successfully lobotomizes [target]!</span>",
			"<span class='notice'>[user] completes the surgery on [target]'s brain.</span>")
	var/obj/item/organ/brain/B = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		B.applyOrganDamage(80)
	switch(rand(1,3))//Now let's see what hopefully-not-important part of the brain we cut off
		if(1)
			target.gain_trauma_type(BRAIN_TRAUMA_MILD, TRAUMA_RESILIENCE_MAGIC)
			experience_given = MEDICAL_SKILL_ADVANCED*0.9
		if(2)
			if(HAS_TRAIT(target, TRAIT_SPECIAL_TRAUMA_BOOST) && prob(50))
				target.gain_trauma_type(BRAIN_TRAUMA_SPECIAL, TRAUMA_RESILIENCE_MAGIC)
			else
				target.gain_trauma_type(BRAIN_TRAUMA_SEVERE, TRAUMA_RESILIENCE_MAGIC)
			experience_given = MEDICAL_SKILL_ADVANCED*0.8
		if(3)
			target.gain_trauma_type(BRAIN_TRAUMA_SPECIAL, TRAUMA_RESILIENCE_MAGIC)
			experience_given = MEDICAL_SKILL_ADVANCED*0.5
	return ..()

/datum/surgery_step/lobotomize/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	var/obj/item/organ/brain/B = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(B)
		display_results(user, target, "<span class='warning'>You remove the wrong part, causing more damage!</span>",
			"<span class='notice'>[user] successfully lobotomizes [target]!</span>",
			"<span class='notice'>[user] completes the surgery on [target]'s brain.</span>")
		B.applyOrganDamage(80)
		switch(rand(1,3))
			if(1)
				target.gain_trauma_type(BRAIN_TRAUMA_MILD, TRAUMA_RESILIENCE_MAGIC)
			if(2)
				if(HAS_TRAIT(target, TRAIT_SPECIAL_TRAUMA_BOOST) && prob(50))
					target.gain_trauma_type(BRAIN_TRAUMA_SPECIAL, TRAUMA_RESILIENCE_MAGIC)
				else
					target.gain_trauma_type(BRAIN_TRAUMA_SEVERE, TRAUMA_RESILIENCE_MAGIC)
			if(3)
				target.gain_trauma_type(BRAIN_TRAUMA_SPECIAL, TRAUMA_RESILIENCE_MAGIC)
	else
		user.visible_message("<span class='warning'>[user] suddenly notices that the brain [user.p_they()] [user.p_were()] working on is not there anymore.</span>", "<span class='warning'>You suddenly notice that the brain you were working on is not there anymore.</span>")
	return FALSE
