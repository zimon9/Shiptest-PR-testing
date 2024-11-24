/datum/surgery/tympanoplasty
	name = "Tympanoplasty"
	desc = "A surgical procedure which attempts to mend perforations to the tympanic membrane, and thus restore hearing."
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/repair_perforation,
		/datum/surgery_step/close)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_HEAD)
	requires_bodypart_type = 0

//fix ears
/datum/surgery_step/repair_perforation
	name = "repair perforation"
	implements = list(
		TOOL_HEMOSTAT = 100,
		TOOL_SCREWDRIVER = 40)
	time = 64
	experience_given = (MEDICAL_SKILL_ORGAN_FIX*0.6) //repeatable and can be done at any damage

/datum/surgery/repair_perforation/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/ears/E = target.getorganslot(ORGAN_SLOT_EARS)
	if(!E)
		to_chat(user, "<span class='warning'>It's hard to do surgery on someone's ears when [target.p_they()] [target.p_do()]n't have any.</span>")
		return FALSE
	return TRUE

/datum/surgery_step/repair_perforation/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to fix [target]'s eardrums...</span>",
		"<span class='notice'>[user] begins to fix [target]'s eardrums.</span>",
		"<span class='notice'>[user] begins to perform surgery on [target]'s eardrums.</span>")

/datum/surgery_step/repair_perforation/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/obj/item/organ/ears/E = target.getorganslot(ORGAN_SLOT_EARS)
	user.visible_message("<span class='notice'>[user] successfully fixes [target]'s ears!</span>", "<span class='notice'>You succeed in fixing [target]'s ears.</span>")
	display_results(user, target, "<span class='notice'>You succeed in fixing [target]'s ears.</span>",
		"<span class='notice'>[user] successfully fixes [target]'s ears!</span>",
		"<span class='notice'>[user] completes the surgery on [target]'s ears.</span>")
	E.setOrganDamage(0)
	return ..()

/datum/surgery_step/repair_perforation/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.getorgan(/obj/item/organ/ears))
		display_results(user, target, "<span class='warning'>You accidentally damage tissue in [target]'s ears!</span>",
			"<span class='warning'>[user] accidentally cuts into [target]'s ears!</span>",
			"<span class='warning'>[user] accidentally cuts into [target]'s ears!</span>")
		target.adjustOrganLoss(ORGAN_SLOT_EARS, 50)
	else
		display_results(user, target, "<span class='warning'>You accidentally damage tissue in [target]'s ears! Or you would have, if [target] had ears.</span>",
			"<span class='warning'>[user] accidentally cuts into [target]'s ears!</span>",
			"<span class='warning'>[user] accidentally cuts into [target]'s ears!</span>")
	return FALSE
