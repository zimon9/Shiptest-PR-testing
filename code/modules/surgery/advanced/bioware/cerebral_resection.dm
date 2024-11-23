/datum/surgery/advanced/bioware/cerebral_resection
	name = "Cerebral Resection"
	desc = "A surgical procedure which attempts to repair trauma to the cerebral cortex by cutting away damaged tissue and regenerating neurons with a synaptizine paste."
	steps = list(/datum/surgery_step/incise,
				/datum/surgery_step/retract_skin,
				/datum/surgery_step/saw,
				/datum/surgery_step/clamp_bleeders,
				/datum/surgery_step/incise,
				/datum/surgery_step/resect_cerebrum,
				/datum/surgery_step/apply_synaptizine,
				/datum/surgery_step/close)
	possible_locs = list(BODY_ZONE_HEAD)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	bioware_target = BIOWARE_LIGAMENTS

/datum/surgery/advanced/bioware/cerebral_resection/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/brain/B = target.getorganslot(ORGAN_SLOT_BRAIN)
	if(!B)
		return FALSE
	return ..()

/datum/surgery_step/resect_cerebrum
	name = "resect cerebrum"
	implements = list(
		/obj/item/scalpel/augment = 75,
		/obj/item/scalpel/advanced = 60,
		TOOL_SCALPEL = 45,
		/obj/item/melee/knife = 30)
	time = 125
	experience_given = MEDICAL_SKILL_ADVANCED

/datum/surgery_step/apply_synaptizine
	name = "apply synaptizine"
	implements = list(/obj/item/reagent_containers)
	require_all_chems = list(/datum/reagent/medicine/synaptizine)
	time = 120

/datum/surgery_step/resect_cerebrum/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin resecting away [target]'s damaged cerebral tissue, attempting to salvage the injured cerebral cortex.</span>",
		"<span class='notice'>[user] starts resecting away [target]'s damaged tissue.</span>")

/datum/surgery_step/resect_cerebrum/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	display_results(user, target, "<span class='notice'>You finish resecting away the damaged portions of [target]'s cerebral cortex!</span>",
		"<span class='notice'>[user] finishes resecting away [target]'s damaged cerebral tissue!</span>")
	target.cure_all_traumas(TRAUMA_RESILIENCE_BASIC)
	target.cure_all_traumas(TRAUMA_RESILIENCE_SURGERY)
	target.cure_all_traumas(TRAUMA_RESILIENCE_LOBOTOMY)
	return ..()

/datum/surgery_step/resect_cerebrum/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.getorganslot(ORGAN_SLOT_BRAIN))
		display_results(user, target, "<span class='warning'>You screw up, damaging the brain!</span>",
			"<span class='warning'>[user] screws up, damaging the brain!</span>")
		target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 30)
	else
		user.visible_message("<span class='warning'>[user] suddenly notices that the brain [user.p_they()] [user.p_were()] working on is not there anymore.</span>", "<span class='warning'>You suddenly notice that the brain you were working on is not there anymore.</span>")
	return FALSE

/datum/surgery_step/apply_synaptizine/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	for(var/datum/reagent/A in tool.reagents.reagent_list)
		if (istype(A, /datum/reagent/medicine/synaptizine) && !(A.volume < 5))
			A.volume -= 5
		else
			display_results(user, target, "<span class='warning'>You do not have enough synaptizine to complete this procedure!</span>")
			return ..()

	display_results(user, target, "<span class='notice'>You start applying a neurogenic paste of synaptizine on [target]'s resected cerebral cortex.</span>",
		"<span class='notice'>[user] starts applying a paste to [target]'s resected cerebral tissue.</span>")

/datum/surgery_step/apply_synaptizine/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	display_results(user, target, "<span class='notice'>You finish applying synaptizine to [target]'s cerebral cortex. The cortex starts looking healthier before your eyes. The patient's prognosis has improved.</span>",
		"<span class='notice'>[user] finishes applying a paste to [target]'s resected cerebral tissue!</span>")
	target.adjustOrganLoss(ORGAN_SLOT_BRAIN, -60)
	return ..()

/datum/surgery_step/apply_synaptizine/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.getorganslot(ORGAN_SLOT_BRAIN))
		display_results(user, target, "<span class='warning'>You screw up, damaging the brain!</span>",
			"<span class='warning'>[user] screws up, damaging the brain!</span>")
		target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 30)
	else
		user.visible_message("<span class='warning'>[user] suddenly notices that the brain [user.p_they()] [user.p_were()] working on is not there anymore.</span>", "<span class='warning'>You suddenly notice that the brain you were working on is not there anymore.</span>")
	return FALSE
