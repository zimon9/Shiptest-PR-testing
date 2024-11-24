/datum/surgery/esophagojejunostomy
	name = "Esophagojejunostomy"
	desc = "A surgical procedure in which the stomach is bypassed and the intestines are rearranged such that one limb delivers bile and the other catches food."
	steps = list(/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/saw,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/incise,
		/datum/surgery_step/esophagojejunostomy,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/close)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)
	requires_real_bodypart = TRUE

/datum/surgery/esophagojejunostomy/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/stomach/L = target.getorganslot(ORGAN_SLOT_STOMACH)
	if(L?.damage > 50 && !(L.organ_flags & ORGAN_FAILING))
		return TRUE

//95% chance of success to be consistent with most organ-repairing surgeries.
/datum/surgery_step/esophagojejunostomy
	name = "bypass stomach and rearrange intestinal configuration"
	implements = list(
		TOOL_SCALPEL = 95,
		/obj/item/melee/energy/sword = 33,
		/obj/item/melee/knife = 40,
		/obj/item/shard = 10)
	time = 52
	experience_given = (MEDICAL_SKILL_ORGAN_FIX*0.8) //for consistency across organ surgeries

/datum/surgery_step/esophagojejunostomy/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(user, target, "<span class='notice'>You begin to change the way that [target]'s intestinal tract is arranged...</span>",
		"<span class='notice'>[user] begins to make an incision in [target].</span>",
		"<span class='notice'>[user] begins to make an incision in [target].</span>")

/datum/surgery_step/esophagojejunostomy/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
	var/mob/living/carbon/human/H = target
	H.setOrganLoss(ORGAN_SLOT_STOMACH, 15) // Stomachs have a threshold for being able to even digest food, so I might tweak this number
	display_results(user, target, "<span class='notice'>You successfully rearrange [target]'s intestinal tract.</span>",
		"<span class='notice'>[user] successfully rearranges [target]'s intestinal tract.</span>",
		"<span class='notice'>[user] successfully rearranges [target]'s intestinal tract.</span>")
	return ..()

/datum/surgery_step/esophagojejunostomy/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery)
	var/mob/living/carbon/human/H = target
	H.adjustOrganLoss(ORGAN_SLOT_STOMACH, 20)
	display_results(user, target, "<span class='warning'>You cut the wrong part of [target]'s intestines!</span>",
		"<span class='warning'>[user] cuts the wrong part of [target]'s intestines!</span>",
		"<span class='warning'>[user] cuts the wrong part of [target]'s intestines!</span>")
