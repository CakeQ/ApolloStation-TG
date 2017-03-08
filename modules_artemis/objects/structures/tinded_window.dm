//In this file: Polarized windows and tint control buttons from Baystation.
//Polarized windows
/obj/structure/window/reinforced/polarized
	icon_state = "twindow"
	name = "electrochromic window"
	desc = "Adjusts its tint with voltage. Might take a few good hits to shatter it."
	var/id

/obj/structure/window/reinforced/polarized/fulltile
	icon = 'icons/obj/smooth_structures/tinted_window.dmi'
	icon_state = "tinted_window"
	dir = FULLTILE_WINDOW_DIR
	fulltile = 1
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/window/reinforced/polarized/fulltile, /obj/structure/window/fulltile, /obj/structure/window/reinforced/fulltile, /obj/structure/window/reinforced/tinted/fulltile/)
	level = 3
	glass_amount = 2

/obj/structure/window/reinforced/polarized/proc/toggle()
	if(opacity)
		animate(src, color="#FFFFFF", time=5)
		opacity = 0
	else
		animate(src, color="#222222", time=5)
		opacity = 1

//Window tint controls
/obj/machinery/button/windowtint
	name = "window tint control"
	icon = 'icons/obj/power.dmi'
	icon_state = "light0"
	desc = "A remote control switch for electrochromic windows."
	var/range = 7
	var/active = FALSE

/obj/machinery/button/windowtint/attack_hand(mob/user as mob)
	if(..())
		return 1

	toggle_tint()

/obj/machinery/button/windowtint/proc/toggle_tint()
	active = !active
	update_icon()

	for(var/obj/structure/window/reinforced/polarized/W in range(src,range))
		if (W.id == src.id || !W.id)
			spawn(0)
				W.toggle()
				return

/obj/machinery/button/windowtint/power_change()
	. = ..()
	if(active && !powered(power_channel))
		toggle_tint()

/obj/machinery/button/windowtint/update_icon()
	icon_state = "light[active]"

