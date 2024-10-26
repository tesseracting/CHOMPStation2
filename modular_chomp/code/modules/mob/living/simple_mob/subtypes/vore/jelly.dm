/mob/living/simple_mob/vore/jelly
	swallowTime = 1 SECONDS
	vore_active = 1
	vore_capacity = 3
	vore_default_mode = DM_DIGEST
	vore_icons = SA_ICON_LIVING
	vore_bump_chance = 100 //Don't want to be eaten, just don't get eaten.
	vore_bump_emote	= "lunges"
	vore_standing_too = TRUE
	vore_pounce_chance = 75
	vore_pounce_maxhealth = 80

/mob/living/simple_mob/vore/jelly/init_vore()
	if(!voremob_loaded)
		return
	. = ..()
	var/obj/belly/B = vore_selected
	B.name = "stomach"
	B.desc = "The yawning flesh orifice leans over you from above. Its throat dribbles with oozing slick globs of saliva, or maybe it's more like mucus. Then you realize that's not its throat; that's its whole stomach! You're swallowed right into the fleshy sack, and the sphincter above seals you inside. The unthinking [name] goes back to jiggling about its own mindless business. Such a creature isn't even sentient enough to be aware of what it ate. You also realize that the chamber you're in only has one way in or out. Yet the simplicity of \the [name]'s gut won't mean you'll have it easy. If you stay here for long enough, you'll be broken down until there's nothing left but scraps."
	B.mode_flags = DM_FLAG_THICKBELLY
	B.digest_brute = 0.3
	B.digest_burn = 0.3
	B.escapechance = 10 // You were dumb enough to walk into it or stand still, now good luck escaping.
	B.contaminates = 1
	B.contamination_flavor = "Slimy"
	B.contamination_color = "green"
	B.item_digest_mode = IM_HOLD
	B.belly_fullscreen = "anim_belly"
	B.belly_fullscreen_color = "#823232"
	B.belly_fullscreen_color2 = "#823232"
	B.fancy_vore = 1
	B.vore_verb = "slurps"

	B.emote_lists[DM_DIGEST] = list(
		"The constantly undulating walls of \the [name] work stinging acid into your form.",
		"Slimy gastric juices and constant jiggling serve to disorient you as you are digested by \the [name].",
		"You're pummeled to the floor of \the [name]'s [B.name] and held in a pool of sizzling liquids.",
		"You're being drenched in a viscous, slippery slime. It doesn't just burn you; it makes it impossible to hold onto anything.",
		"Rippling flesh squeezes you over and over and over again. Your body burns all over as you are soaked in a corrosive mucus.",
		"Somehow, all of your belongings are being stripped off one by one. If you're not already naked, you soon will be.",
		"The continuing peristalsis has nowhere left to push you, so you're just squashed to the floor of the soupy wet chamber.")
	B.emote_lists[DM_HOLD] = list(
		"The constantly undulating walls of \the [name] work you over with a lubricating slime.",
		"Slimy fluids and constant jiggling serve to disorient you as you are held captive by \the [name].",
		"You're pummeled to the floor of \the [name]'s [B.name] and held in a pool of gooey liquids.",
		"You're being drenched in a viscous, slippery slime that makes it impossible to hold onto anything.", // Stripping still works even if digestion is off.
		"Rippling flesh squeezes you over and over and over again.",
		"Somehow, all of your belongings are being stripped off one by one. If you're not already naked, you soon will be.",
		"The continuing peristalsis has nowhere left to push you, so you're just squashed to the floor of the soupy wet chamber.")
	B.struggle_messages_inside = list(
		"You jam your limbs against the squashy thick walls in an effort to get some leverage.",
		"You try to grab hold of the pulsating walls to force yourself to freedom.",
		"You pry at the clenched sphincter at the top of the chamber in a bid to escape.",
		"You thrash around \the [name]'s quivering [B.name].")
	B.struggle_messages_outside = list(
		"\the [name] jostles around as something inside of it fights to escape.",
		"\the [name]'s squishy body jiggles with the movement of a trapped victim.")
	B.examine_messages = list(
		"\the [name] is swollen fat with the sloshing contents of a recent meal.")
	B.digest_messages_prey = list(
		"Your lifeless form dissolves into a slurry that \the [name]'s [B.name] soaks up as nourishment.",
		"No one came to save you, and you couldn't escape with your life. Now you're just another meal to this mindless, wiggling creature.",
		"You meet a humiliating demise as \the [name] digests what's left of you into nothing but a sloshing pulp. Everything usable is absorbed by the [B.name] walls. Whatever it can't process is just left to jumble around in the chamber until it gets spat up somewhere later.",
		"The soggy lump of your body finally breaks down into mush. That mush is further liquefied until it can be absorbed by the fleshy walls.",
		"Somehow you've been bested by a creature with no brain. Maybe it's for the best that nobody rescued you before it churned you into slush. What's left of you is slobbered up by the twitching walls until there's nothing left but undigested clumps of whatever you left behind.")
