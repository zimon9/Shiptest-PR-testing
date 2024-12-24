/datum/surgery/pulmonary_resection
	name = "Pulmonary Resection"
	desc = "A surgical procedure where damaged lung tissue is resected away, so as to promote proper function."
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/saw,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/pulmonary_resection,
		/datum/surgery_step/close)
	possible_locs = list(BODY_ZONE_CHEST)

/datum/surgery/pulmonary_resection/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/lungs/L = target.getorganslot(ORGAN_SLOT_LUNGS)
	if(L)
		if(L.damage > 60 && !L.operated)
			return TRUE
	return FALSE

/datum/surgery_step/incise/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to make a longitudinal incision in [target]’s midline axilla...</span>",
		"<span class='notice'>[user] begins to make a longitudinal incision in [target]’s midline axilla.</span>", //assuming a layman looks, should they be able to see this? This is a test case.
		"<span class='notice'>[user] begins to make an incision in [target].</span>") //or should they instead look at this?

/datum/surgery_step/pulmonary_resection
	name = "excise damaged pulmonary tissue"
	implements = list(
		TOOL_SCALPEL = 95,
		/obj/item/melee/energy/sword = 33,
		/obj/item/melee/knife = 40,
		/obj/item/shard = 25)
	time = 4.2 SECONDS
	preop_sound = 'sound/surgery/scalpel1.ogg'
	success_sound = 'sound/surgery/organ1.ogg'
	failure_sound = 'sound/surgery/organ2.ogg'
	experience_given = MEDICAL_SKILL_ORGAN_FIX

/datum/surgery_step/pulmonary_resection/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to make an incision in [target]'s pulmonary tissue...</span>",
		"<span class='notice'>[user] begins to make an incision in [target].</span>",
		"<span class='notice'>[user] begins to make an incision in [target].</span>")

/datum/surgery_step/pulmonary_resection/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		var/obj/item/organ/lungs/L = H.getorganslot(ORGAN_SLOT_LUNGS)
		L.operated = TRUE
		H.setOrganLoss(ORGAN_SLOT_LUNGS, 15)
		display_results(user, target, "<span class='notice'>You successfully excise [H]’s necrotic tissue. The surrounding region is slowly returning to a healthy color</span>",
			"<span class='notice'>Successfully removes [H]'s damaged pulmonary tissue.</span>",
			"")
	return ..()

/datum/surgery_step/pulmonary_resection/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		display_results(user, target, "<span class='warning'>You screw up, severing an artery and causing hemorrhagic damage to the tissue!</span>",
			"<span class='warning'>[user] screws up!</span>",
			"<span class='warning'>[user] screws up!</span>")
		var/obj/item/bodypart/BP = H.get_bodypart(check_zone(surgery.location))
		BP.adjust_bleeding(20)
		H.losebreath += 10
		H.adjustOrganLoss(ORGAN_SLOT_LUNGS, 20)
	return FALSE
