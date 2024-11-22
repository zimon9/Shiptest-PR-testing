/datum/surgery/advanced/bioware/cortex_repair
	name = "Cortex Repair"
	desc = "A surgical procedure which repairs trauma to the cerebral cortex."
	steps = list(/datum/surgery_step/incise,
				/datum/surgery_step/retract_skin,
				/datum/surgery_step/clamp_bleeders,
				/datum/surgery_step/incise,
				/datum/surgery_step/incise,
				/datum/surgery_step/repair_cortex,
				/datum/surgery_step/close)
	possible_locs = list(BODY_ZONE_HEAD)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	bioware_target = BIOWARE_LIGAMENTS

/datum/surgery/advanced/bioware/cortex_repair/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/brain/B = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(!B)
		return FALSE
	return ..()

/datum/surgery_step/repair_cortex
	name = "repair cortex"
	accept_hand = TRUE
	time = 125
	experience_given = MEDICAL_SKILL_ADVANCED

/datum/surgery_step/repair_cortex/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You start repairing [target]'s outer cerebral cortex.</span>",
		"<span class='notice'>[user] starts repairing [target]'s outer cerebral cortex.</span>",
		"<span class='notice'>[user] begins to perform surgery on [target]'s brain.</span>")

/datum/surgery_step/repair_cortex/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	display_results(user, target, "<span class='notice'>You repair [target]'s outer cerebral cortex!</span>",
		"<span class='notice'>[user] repairs [target]'s outer cerebral cortex!</span>",
		"<span class='notice'>[user] completes the surgery on [target]'s brain.</span>")
		target.cure_all_traumas(TRAUMA_RESILIENCE_BASIC)
		target.cure_all_traumas(TRAUMA_RESILIENCE_SURGERY)
		target.cure_all_traumas(TRAUMA_RESILIENCE_LOBOTOMY)
		target.adjustOrganLoss(ORGAN_SLOT_BRAIN, -60)
	return ..()

/datum/surgery_step/repair_cortex/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.getorganslot(ORGAN_SLOT_BRAIN))
		display_results(user, target, "<span class='warning'>You screw up, damaging the brain!</span>",
			"<span class='warning'>[user] screws up, damaging the brain!</span>",
			"<span class='notice'>[user] completes the surgery on [target]'s brain.</span>")
		target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 30)
	else
		user.visible_message("<span class='warning'>[user] suddenly notices that the brain [user.p_they()] [user.p_were()] working on is not there anymore.</span>", "<span class='warning'>You suddenly notice that the brain you were working on is not there anymore.</span>")
	return FALSE

