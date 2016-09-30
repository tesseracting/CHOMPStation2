//These circuits convert one variable to another.
/obj/item/integrated_circuit/converter
	complexity = 2
	inputs = list("input")
	outputs = list("output")
	activators = list("convert")
	category = /obj/item/integrated_circuit/converter

/obj/item/integrated_circuit/converter/num2text
	name = "number to string"
	desc = "This circuit can convert a number variable into a string."
	icon_state = "num-string"

/obj/item/integrated_circuit/converter/num2text/do_work()
	var/result = null
	var/datum/integrated_io/incoming = inputs[1]
	var/datum/integrated_io/outgoing = outputs[1]
	if(incoming.data && isnum(incoming.data))
		result = num2text(incoming.data)

	outgoing.data = result
	outgoing.push_data()

/obj/item/integrated_circuit/converter/text2num
	name = "string to number"
	desc = "This circuit can convert a string variable into a number."
	icon_state = "string-num"

/obj/item/integrated_circuit/converter/text2num/do_work()
	var/result = null
	var/datum/integrated_io/incoming = inputs[1]
	var/datum/integrated_io/outgoing = outputs[1]
	if(incoming.data && istext(incoming.data))
		result = text2num(incoming.data)

	outgoing.data = result
	outgoing.push_data()

/obj/item/integrated_circuit/converter/ref2text
	name = "reference to string"
	desc = "This circuit can convert a reference to something else to a string, specifically the name of that reference."
	icon_state = "ref-string"

/obj/item/integrated_circuit/converter/ref2text/do_work()
	var/result = null
	var/datum/integrated_io/incoming = inputs[1]
	var/datum/integrated_io/outgoing = outputs[1]
	var/atom/A = incoming.data_as_type(/atom)
	result = A && A.name

	outgoing.data = result
	outgoing.push_data()

/obj/item/integrated_circuit/converter/lowercase
	name = "lowercase string converter"
	desc = "this will cause a string to come out in all lowercase."
	icon_state = "lowercase"

/obj/item/integrated_circuit/converter/lowercase/do_work()
	var/result = null
	var/datum/integrated_io/incoming = inputs[1]
	var/datum/integrated_io/outgoing = outputs[1]
	if(incoming.data && istext(incoming.data))
		result = lowertext(incoming.data)

	outgoing.data = result
	outgoing.push_data()

/obj/item/integrated_circuit/converter/uppercase
	name = "uppercase string converter"
	desc = "THIS WILL CAUSE A STRING TO COME OUT IN ALL UPPERCASE."
	icon_state = "uppercase"

/obj/item/integrated_circuit/converter/uppercase/do_work()
	var/result = null
	var/datum/integrated_io/incoming = inputs[1]
	var/datum/integrated_io/outgoing = outputs[1]
	if(incoming.data && istext(incoming.data))
		result = uppertext(incoming.data)

	outgoing.data = result
	outgoing.push_data()

/obj/item/integrated_circuit/converter/concatenatior
	name = "concatenatior"
	desc = "This joins many strings together to get one big string."
	complexity = 4
	inputs = list("A","B","C","D","E","F","G","H")
	outputs = list("result")
	activators = list("concatenate")

/obj/item/integrated_circuit/converter/concatenatior/do_work()
	var/result = null
	for(var/datum/integrated_io/input/I in inputs)
		I.pull_data()
		if(istext(I.data))
			result = result + I.data

	var/datum/integrated_io/outgoing = outputs[1]
	outgoing.data = result
	outgoing.push_data()