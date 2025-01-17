/obj/item/attachment/gun/energy
	name = "underbarrel e-gun"
	desc = "Pew pew laser beam. You probably shouldnt be seeing this."
	underbarrel_prefix = "laser_"
	icon_state = "energy"
	weapon_type = /obj/item/gun/energy/e_gun
	var/automatic_charge_overlays = TRUE

/obj/item/attachment/gun/energy/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/stock_parts/cell/gun))
		attached_gun.attackby(I, user)
		update_appearance()
	else
		return ..()

/obj/item/attachment/gun/energy/on_examine(obj/item/gun/gun, mob/user, list/examine_list)
	var/obj/item/gun/energy/e_gun = attached_gun
	var/obj/item/ammo_casing/energy/shot = e_gun.ammo_type[e_gun.select]
	var/obj/item/stock_parts/cell/gun/gun_cell = get_cell()
	if(e_gun.ammo_type.len > 1)
		examine_list += span_notice("- You can switch firemodes on the [name] by pressing the <b>unique action</b> key. By default, this is <b>space</b>")
	if(e_gun.cell)
		examine_list += span_notice("- \The [name]'s cell has [gun_cell.percent()]% charge remaining.")
		examine_list += span_notice("- \The [name] has [round(gun_cell.charge/shot.e_cost)] shots remaining on <b>[shot.select_name]</b> mode.")
	else
		. += span_notice("- \The [name] doesn't seem to have a cell!")
	if(!e_gun.internal_magazine)
		examine_list += span_notice("- The cell retainment latch is [e_gun.latch_closed ? "<span class='green'>CLOSED</span>" : "<span class='red'>OPEN</span>"]. Alt-Click to toggle the latch.")
	return examine_list

/obj/item/attachment/gun/energy/AltClick(mob/user)
	. = ..()
	attached_gun.AltClick(user)

/obj/item/attachment/gun/energy/get_cell()
	return attached_gun.cell

/obj/item/attachment/gun/energy/e_gun
	name = "underbarrel energy gun"
	desc = "A compact underbarrel energy gun. The reduction in size makes it less power effiecent per shot than the standard model."
	weapon_type = /obj/item/gun/energy/e_gun/underbarrel

/obj/item/gun/energy/e_gun/underbarrel
	name = "underbarrel energy gun"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/underbarrel, /obj/item/ammo_casing/energy/laser/underbarrel)
	spawn_no_ammo = TRUE

