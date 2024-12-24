/mob/living/simple_animal/hostile/human/frontier
	name = "Frontiersman Shank"
	desc = "A member of the brutal Frontiersman terrorist fleet! This one clutches a wicked-looking knife in nimble fingers, eager to relieve you of your innards."
	icon_state = "frontiersmanmelee"
	icon = 'icons/mob/simple_frontiersman.dmi'
	icon_living = "frontiersmanmelee"
	icon_dead = "frontiersmanmelee_dead"
	speak_chance = 0
	melee_damage_lower = 15
	melee_damage_upper = 15
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier,
				/obj/item/melee/knife/survival)
	faction = list(FACTION_ANTAG_FRONTIERSMEN)
	footstep_type = FOOTSTEP_MOB_SHOE

/mob/living/simple_animal/hostile/human/frontier/internals
	icon_state = "frontiersmanmelee_mask"
	icon_living = "frontiersmanmelee_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier,
				/obj/item/clothing/mask/breath,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0


/mob/living/simple_animal/hostile/human/frontier/ranged
	name = "Frontiersman Quickdraw"
	desc = "A member of the brutal Frontiersman terrorist fleet! This one thumbs a slender revolver, stained chrome and a malicious smile glinting in the light."
	icon_state = "frontiersmanranged"
	icon_living = "frontiersmanranged"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged,
				/obj/item/gun/ballistic/revolver/shadow)
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	projectilesound = 'sound/weapons/gun/revolver/cattleman.ogg'
	casingtype = /obj/item/ammo_casing/a44roum

/mob/living/simple_animal/hostile/human/frontier/ranged/internals
	icon_state = "frontiersmanranged_mask"
	icon_living = "frontiersmanranged_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged,
				/obj/item/gun/ballistic/revolver/shadow,
				/obj/item/clothing/mask/breath,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0

/mob/living/simple_animal/hostile/human/frontier/ranged/internals/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged,
				/obj/item/clothing/mask/breath,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged)

/mob/living/simple_animal/hostile/human/frontier/ranged/surgeon
	name = "Frontiersman Sawbones"
	desc = "A member of the brutal Frontiersman terrorist fleet! They appear to be a \"doctor\" of some sort, nervously swinging about some kind of makeshift syringe launcher."
	icon_state = "frontiersmansurgeon"
	icon_living = "frontiersmansurgeon"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/surgeon,
				/obj/item/melee/knife/survival,
				/obj/item/gun/syringe)

	minimum_distance = 1
	retreat_distance = null
	projectiletype = /obj/projectile/bullet/dart/tranq
	projectilesound = 'sound/items/syringeproj.ogg'
	casingtype = null
	ranged_message = "fires the syringe gun at"
	ranged_cooldown_time = 30
	armor_base = /obj/item/clothing/suit/frontiersmen

/mob/living/simple_animal/hostile/human/frontier/ranged/surgeon/neuter
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/surgeon)

/mob/living/simple_animal/hostile/human/frontier/ranged/surgeon/internals
	icon_state = "frontiersmansurgeon_mask"
	icon_living = "frontiersmansurgeon_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/surgeon,
				/obj/item/melee/knife/survival,
				/obj/item/gun/syringe,
				/obj/item/clothing/mask/breath,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/surgeon/internals/neuter
	icon_state = "frontiersmansurgeon_mask"
	icon_living = "frontiersmansurgeon_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/surgeon,
				/obj/item/clothing/mask/breath,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/mosin
	name = "Frontiersman Sharpshot"
	desc = "A member of the brutal Frontiersman terrorist fleet! This one confidently mills about with a long rifle slung over their shoulder."
	icon_state = "frontiersmanrangedrifle"
	icon_living = "frontiersmanrangedrifle"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged,
				/obj/item/gun/ballistic/rifle/illestren)
	casingtype = /obj/item/ammo_casing/a8_50r
	projectilesound = 'sound/weapons/gun/rifle/mosin.ogg'

/mob/living/simple_animal/hostile/human/frontier/ranged/mosin/internals
	icon_state = "frontiersmanrangedrifle_mask"
	icon_living = "frontiersmanrangedrifle_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged,
				/obj/item/gun/ballistic/rifle/illestren,
				/obj/item/clothing/mask/breath,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0

/mob/living/simple_animal/hostile/human/frontier/ranged/mosin/internals/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged,
				/obj/item/clothing/mask/breath,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/mosin/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper
	name = "Frontiersman Doorkicker"
	desc = "A member of the brutal Frontiersman terrorist fleet! Bedecked in military-grade armor, they swagger their shotgun about with a boldness uncommon even among other Frontiersmen."
	icon_state = "frontiersmanrangedelite"
	icon_living = "frontiersmanrangedelite"
	projectilesound = 'sound/weapons/gun/shotgun/shot.ogg'
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/gun/ballistic/shotgun/brimstone)
	armor_base = /obj/item/clothing/suit/armor/vest/frontier

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/internals
	icon_state = "frontiersmanrangedelite_mask"
	icon_living = "frontiersmanrangedelite_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/gun/ballistic/shotgun/brimstone,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/internals/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/flame
	name = "Frontiersman Scorcher"
	desc = "An ashen revenant wades through a sea of flames, mummified under twenty pounds of blackened asbestos fabric. Mirrored lenses glare inscrutably as they swing their instrument of destruction towards you. You should probably run."
	icon_state = "frontiersmanflametrooper"
	icon_living = "frontiersmanflametrooper"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper/flame,
				/obj/item/flamethrower)
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1000

	minimum_distance = 1
	retreat_distance = null
	shoot_point_blank = TRUE
	projectiletype = null
	projectilesound = 'sound/weapons/gun/flamethrower/flamethrower1.ogg'
	casingtype = null
	armor_base = /obj/item/clothing/suit/armor/frontier/fireproof

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/flame/OpenFire()
	var/turf/T = get_ranged_target_turf_direct(src, target, 4)
	var/list/burn_turfs = getline(src, T) - get_turf(src)
	visible_message("<span class='danger'><b>[src]</b> [ranged_message] at [target.name]!</span>")
	playsound(src, projectilesound, 100, TRUE)
	fire_line(src, burn_turfs, "flamethrower", TRUE, 10)
	ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/flame/neuter
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper/flame)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/skm
	name = "Frontiersman Gunner"
	desc = "A member of the brutal Frontiersman terrorist fleet! This one could almost be mistaken for a real soldier by their assault rifle and armor, if it weren't for their swaggering demeanor."
	icon_state = "frontiersmanrangedak47"
	icon_living = "frontiersmanrangedak47"
	projectilesound = 'sound/weapons/gun/rifle/skm.ogg'
	rapid = 4
	rapid_fire_delay = 3
	casingtype = /obj/item/ammo_casing/a762_40
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/gun/ballistic/automatic/assault/skm)
	armor_base = /obj/item/clothing/suit/armor/vest/frontier

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/skm/internals
	icon_state = "frontiersmanrangedak47_mask"
	icon_living = "frontiersmanrangedak47_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/gun/ballistic/automatic/assault/skm,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/skm/internals/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/skm/neutured
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/rifle
	name = "Frontiersman Crackshot"
	desc = "A member of the brutal Frontiersman terrorist fleet! Compared to their allies, they stand a little straighter, laugh a little colder. Their long rifle has a regular series of scratches on the receiver."
	icon_state = "frontiersmanrangedmosin"
	icon_living = "frontiersmanrangedmosin"

	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/gun/ballistic/rifle/illestren)
	casingtype = /obj/item/ammo_casing/a8_50r
	projectilesound = 'sound/weapons/gun/rifle/mosin.ogg'
	armor_base = /obj/item/clothing/suit/armor/vest/frontier

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/rifle/internals
	icon_state = "frontiersmanrangedmosin_mask"
	icon_living = "frontiersmanrangedmosin_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/gun/ballistic/rifle/illestren,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/rifle/internals/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/rifle/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/heavy
	name = "Frontiersman Sweeper"
	desc = "Unseen behind the mirror-visor of this heavily plated hardsuit, flinty eyes dream of cruelty. A mass of chrome and photonics swings your way, the soft whine of its motor a harbinger of iridescent death."
	icon_state = "frontiersmanrangedminigun"
	icon_living = "frontiersmanrangedminigun"
	projectilesound = 'sound/weapons/laser4.ogg'
	rapid = 6
	rapid_fire_delay = 1.5
	casingtype = null
	projectiletype = /obj/projectile/beam/weak/penetrator
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper/heavy)
	armor_base = /obj/item/clothing/suit/space/hardsuit/security/independent/frontier

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/heavy/internals
	icon_state = "frontiersmanrangedminigun_mask"
	icon_living = "frontiersmanrangedminigun_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper/heavy,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0


/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/heavy/internals/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper/heavy/gunless,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/trooper/heavy/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/trooper/heavy/gunless)

/mob/living/simple_animal/hostile/human/frontier/ranged/officer
	name = "Frontiersman Boss"
	desc = "This Frontiersman moves with what could almost pass for discipline among the infamously ragtag terrorists. They leer at their underlings, one hand resting consciously over the machine pistol at their hip."
	icon_state = "frontiersmanofficer"
	icon_living = "frontiersmanofficer"
	rapid = 4
	projectilesound = 'sound/weapons/gun/pistol/mauler.ogg'
	casingtype = /obj/item/ammo_casing/c9mm
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/officer,
				/obj/item/gun/ballistic/automatic/pistol/mauler)
	armor_base = /obj/item/clothing/suit/armor/frontier

/mob/living/simple_animal/hostile/human/frontier/ranged/officer/internals
	icon_state = "frontiersmanofficer_mask"
	icon_living = "frontiersmanofficer_mask"
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/officer,
				/obj/item/gun/ballistic/automatic/pistol/mauler,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)
	atmos_requirements = IMMUNE_ATMOS_REQS
	minbodytemp = 0

/mob/living/simple_animal/hostile/human/frontier/ranged/officer/internals/neutered
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/officer,
				/obj/item/clothing/mask/gas,
				/obj/item/tank/internals/emergency_oxygen/engi)

/mob/living/simple_animal/hostile/human/frontier/ranged/officer/neutured
	loot = list(/obj/effect/mob_spawn/human/corpse/frontier/ranged/officer)
