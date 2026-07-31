/obj/structure/manual_core_sampler
	name = "Geological Core Sampler"
	desc = "Allows a user to core out a sample of rock."
	icon = 'icons/obj/objects.dmi'
	icon_state = "water"
	density = TRUE
	anchored = FALSE
	pressure_resistance = 2 * ONE_ATMOSPHERE
	max_integrity = 300
	var/tank_volume = 500 //In units, how much the dispenser can hold
	var/reagent_id = /datum/reagent/water //The ID of the reagent that the dispenser uses
	var/anchorable = TRUE //whether you can unwrench this thing
	var/cell_override = /obj/item/stock_parts/cell/high
	var/power_use_amount = POWER_CELL_USE_HIGH //ideally, this should be able to core out three structures reliably before needing a recharge. Will need tweaking before setting its final value

/obj/structure/manual_core_sampler/Initialize()
	AddComponent(/datum/component/cell, cell_override, CALLBACK(src, PROC_REF(switched_off)))
	create_reagents(tank_volume, REFILLABLE | DRAINABLE | AMOUNT_VISIBLE)
	if(reagent_id)
		reagents.add_reagent(reagent_id, tank_volume)
	. = ..()

/obj/structure/manual_core_sampler/proc/make_drill()
	return new /obj/item/core_drill_bore(src)

/obj/item/core_drill_bore
	name = "Geological Coring Bore Sampler"
	desc = "A bore drill. This one has inset diamond coated carbide inserts, designed to be able to drill through the hardest of materials. To aid in this, water is pumped from the connected sampler holder, both to lubricate the cutting head, as well as to help cool it down as the teeth grind through."
	icon = 'icons/obj/hydroponics/equipment.dmi'
	icon_state = "misterop"
	item_state = "misterop"
	lefthand_file = 'icons/mob/inhands/equipment/mister_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/mister_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	item_flags = NOBLUDGEON | ABSTRACT  // don't put in storage
	slot_flags = 0
	var/obj/item/watertank/tank

/obj/item/reagent_containers/spray/mister/Initialize()
	. = ..()
	tank = loc
	if(!istype(tank))
		return INITIALIZE_HINT_QDEL
	reagents = tank.reagents	//This mister is really just a proxy for the tank's reagents

/obj/item/reagent_containers/spray/mister/attack_self()
	return

/obj/item/reagent_containers/spray/mister/doMove(atom/destination)
	if(destination && (destination != tank.loc || !ismob(destination)))
		if (loc != tank)
			to_chat(tank.loc, span_notice("The mister snaps back onto the watertank."))
		destination = tank
	..()

/obj/item/reagent_containers/spray/mister/afterattack(obj/target, mob/user, proximity)
	if(target.loc == loc) //Safety check so you don't fill your mister with mutagen or something and then blast yourself in the face with it
		return
	..()
