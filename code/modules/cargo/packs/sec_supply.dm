/datum/supply_pack/sec_supply
	group = "Security Supplies"
	crate_type = /obj/structure/closet/crate/secure/gear

/*
		Standard supplies
*/
/datum/supply_pack/sec_supply/holster
	name = "Shoulder Holster Crate"
	desc = "Contains a shoulder holster, capable of holding a single pistol or revolver and your ammo."
	cost = 600
	contains = list(/obj/item/clothing/accessory/holster)
	crate_name = "holster crate"

/datum/supply_pack/sec_supply/chemimp
	name = "Chemical Implants Crate"
	desc = "Contains five remote chemical implants."
	cost = 1000
	contains = list(/obj/item/storage/box/chemimp)
	crate_name = "chemical implant crate"

/datum/supply_pack/sec_supply/trackingimp
	name = "Tracking Implants Crate"
	desc = "Contains four tracking implants."
	cost = 2000
	contains = list(/obj/item/storage/box/trackimp)
	crate_name = "tracking implant crate"

/datum/supply_pack/sec_supply/securitybarriers
	name = "Security Barrier Grenades"
	desc = "Stem the tide with four Security Barrier grenades."
	contains = list(/obj/item/grenade/barrier,
					/obj/item/grenade/barrier,
					/obj/item/grenade/barrier,
					/obj/item/grenade/barrier)
	cost = 2000
	crate_name = "security barriers crate"

/datum/supply_pack/sec_supply/empty_sandbags
	name = "Empty Sandbags"
	desc = "Contains one box of seven empty sandbags for deployable cover in the field. Sand not included."
	contains = list(/obj/item/storage/box/emptysandbags)
	cost = 150
	crate_name = "sandbag crate"

/datum/supply_pack/sec_supply/wall_flash
	name = "Wall-Mounted Flash Crate"
	desc = "Contains four wall-mounted flashes."
	cost = 3000
	contains = list(/obj/item/storage/box/wall_flash,
					/obj/item/storage/box/wall_flash,
					/obj/item/storage/box/wall_flash,
					/obj/item/storage/box/wall_flash)
	crate_name = "wall-mounted flash crate"

/datum/supply_pack/sec_supply/supplies
	name = "Security Supplies Crate"
	desc = "Contains seven flashbangs, seven teargas grenades, six flashes, and seven handcuffs."
	cost = 5000
	contains = list(/obj/item/storage/box/flashbangs,
					/obj/item/storage/box/teargas,
					/obj/item/storage/box/flashes,
					/obj/item/storage/box/handcuffs)
	crate_name = "security supply crate"

/*
		Misc. weapons / protection
*/

/datum/supply_pack/sec_supply/riotshields
	name = "Riot Shields Crate"
	desc = "Contains a riot shield, effective at holding back hostile fauna, xenofauna, or large crowds."
	cost = 600
	contains = list(/obj/item/shield/riot)
	crate_name = "riot shields crate"

/datum/supply_pack/sec_supply/survknives
	name = "Survival Knives Crate"
	desc = "Contains three sharpened survival knives. Each knife guaranteed to fit snugly inside any galactic-standard boot."
	cost = 500
	contains = list(/obj/item/melee/knife/survival,
					/obj/item/melee/knife/survival,
					/obj/item/melee/knife/survival)
	crate_name = "combat knife crate"

/datum/supply_pack/sec_supply/machete
	name = "Stampted Steel Machete Crate"
	desc = "Contains five mass produced machetes. A perfect choice for crews on a budget."
	cost = 500
	contains = list(/obj/item/melee/sword/mass,
					/obj/item/melee/sword/mass)
	crate_name = "combat knife crate"

/datum/supply_pack/sec_supply/flamethrower
	name = "Flamethrower Crate"
	desc = "Contains one flamethrower. Point the nozzle away from anything important."
	cost = 1250
	contains = list(/obj/item/flamethrower/full)
	crate_name = "flamethrower crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

	faction = /datum/faction/syndicate/ngr
	faction_discount = 20

/datum/supply_pack/sec_supply/incendiary_grenade
	name = "Incendiary Grenade Crate"
	desc = "Contains one incendiary grenade. Better not let it go off in your hands."
	cost = 750
	contains = list(/obj/item/grenade/chem_grenade/incendiary)
	crate_name = "incendiary grenade crate"
	crate_type = /obj/structure/closet/crate/secure/plasma
	faction = /datum/faction/syndicate/ngr
	faction_discount = 20

/datum/supply_pack/sec_supply/halberd
	name = "Energy Halberd Crate"
	desc = "Contains one Solarian Energy Halberd, for issue to your local Sonnensoldner battalion."
	cost = 1500
	contains = list(/obj/item/energyhalberd)
	crate_name = "energy halberd crate"
	faction = /datum/faction/solgov
	faction_discount = 0
	faction_locked = TRUE

/*
		Stamina / PVP weapons (intentionally overpriced due to odd balance position of stamina weapons)
*/

/datum/supply_pack/sec_supply/stingpack
	name = "Stingbang Grenade Pack"
	desc = "Contains five \"stingbang\" grenades, perfect for stopping riots and playing morally unthinkable pranks."
	cost = 7500
	contains = list(/obj/item/storage/box/stingbangs)
	crate_name = "stingbang grenade pack crate"

/datum/supply_pack/sec_supply/syringegun
	name = "Syringe Gun Crate"
	desc = "Contains a single syringe gun."
	cost = 8000
	contains = list(/obj/item/gun/syringe)
	crate_name = "syringe gun crate"

/datum/supply_pack/sec_supply/baton
	name = "Stun Batons Crate"
	desc = "Arm your vessel security with a stun baton. Batteries included."
	cost = 3000
	contains = list(/obj/item/melee/baton/loaded)
	crate_name = "stun baton crate"

/datum/supply_pack/sec_supply/dragnet
	name = "DRAGnet Crate"
	desc = "Contains one \"Dynamic Rapid-Apprehension of the Guilty\" netting device, a recent breakthrough in law enforcement prisoner management technology."
	cost = 2000
	contains = list(/obj/item/gun/energy/e_gun/dragnet)
	crate_name = "\improper DRAGnet crate"

/datum/supply_pack/sec_supply/claymore
	name = "C-10 Claymore Crate"
	desc = "Four motion-activated directional mines, perfect for ambushing enemy infantry. Still debatably legal to sell!"
	cost = 3000
	contains = list(/obj/item/paper/fluff/claymore,
					/obj/item/mine/directional/claymore,
					/obj/item/mine/directional/claymore,
					/obj/item/mine/directional/claymore,
					/obj/item/mine/directional/claymore)
	crate_name = "C-10 Claymore crate"

/obj/item/paper/fluff/claymore
	name = "PRODUCT USAGE GUIDE"
	desc = "A dusty memo stamped with the Scarborough Arms logo."
	default_raw_text = "<b>ASSEMBLY:</b><br><br>\
	-Deploy mounting legs and emplace device. Front should be placed in direction of enemy egress, no more then three meters from intended target area.<br><br> \
	-<b>INFORM ALLIES OF PLACEMENT LOCATION.</b><br><br> \
	-Wait for arming sequence to complete.<br><br> \
	-Enjoy hands-free area denial, courtesy of Scarborough Arms.<br><br><br> \
	<b>DISASSEMBLY & STORAGE:</b><br><br>\
	-Insert screwdriver into arming pin access and turn 180 degrees. There will be considerable resistance. <b>DO NOT Step onto or in front of device.</b><br><br> \
	-When pressure releases, reach below device and lift via underside in one clean motion. Mounting legs will automatically retract. <br><br> \
	-The device is now safe to handle. <br><br> \
	-Safely stow device in secure, moisture-free location, away from fire and blunt force. "
