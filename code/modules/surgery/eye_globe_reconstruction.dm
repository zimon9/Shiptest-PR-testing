/datum/surgery/eye_globe_reconstruction
	name = "Eye globe reconstruction"
	desc = "A surgical procedure which attempts to repair damaged or ruptured eyes, and restore vision."
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/repair_eyes,
		/datum/surgery_step/close)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_PRECISE_EYES)
	requires_bodypart_type = 0

//fix eyes
/datum/surgery_step/repair_eyes
	name = "reconstruct damaged ocular globes"
	implements = list(
		TOOL_HEMOSTAT = 100,
		TOOL_SCREWDRIVER = 40)
	time = 64
	experience_given = (MEDICAL_SKILL_ORGAN_FIX*0.6)

/datum/surgery/repair_eyes/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/eyes/E = target.getorganslot(ORGAN_SLOT_EYES)
	if(!E)
		to_chat(user, "<span class='warning'>It's hard to do surgery on someone's eyes when [target.p_they()] [target.p_do()]n't have any.</span>")
		return FALSE
	return TRUE

/datum/surgery_step/repair_eyes/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to reconstruct the damaged globe of [target]'s eyes...</span>",
		"<span class='notice'>[user] begins to reconstruct the damaged globe of [target]'s eyes.</span>",
		"<span class='notice'>[user] begins to perform surgery on [target]'s eyes.</span>")

/datum/surgery_step/repair_eyes/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/obj/item/organ/eyes/E = target.getorganslot(ORGAN_SLOT_EYES)
	user.visible_message("<span class='notice'>[user] successfully fixes [target]'s eyes!</span>", "<span class='notice'>You succeed in fixing [target]'s eyes.</span>")
	display_results(user, target, "<span class='notice'>You succeed in repairing [target]'s eyes.</span>",
		"<span class='notice'>[user] successfully repairs [target]'s eyes!</span>",
		"<span class='notice'>[user] completes the surgery on [target]'s eyes.</span>")
	target.cure_blind(list(EYE_DAMAGE))
	target.set_blindness(0)
	target.cure_nearsighted(list(EYE_DAMAGE))
	target.blur_eyes(15)
	E.setOrganDamage(0)
	return ..()

/datum/surgery_step/repair_eyes/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.getorgan(/obj/item/organ/eyes))
		display_results(user, target, "<span class='warning'>You accidentally cut incorrectly into [target]'s eyes!</span>",
			"<span class='warning'>[user] accidentally cuts incorrectly into [target]'s eyes!</span>",
			"<span class='warning'>[user] accidentally cuts incorrectly into [target]'s eyes!</span>")
		target.adjustOrganLoss(ORGAN_SLOT_EYES, 50)
	else
		display_results(user, target, "<span class='warning'>You accidentally stab [target] right in the brain! Or would have, if [target] had a brain.</span>",
			"<span class='warning'>[user] accidentally cuts incorrectly into [target]'s eyes! Or would have, if [target] had eyes.</span>",
			"<span class='warning'>[user] accidentally cuts incorrectly into [target]'s eyes!</span>")
	return FALSE
