def perfometer_dell_n2000_memory(row, check_command, perf_data):
	color = "#00ff00"
	#return repr(perf_data), ''
	mem = saveint(float(perf_data[0][1]))
	warn = saveint(perf_data[0][3])
	crit = saveint(perf_data[0][4])
	if mem >= warn:
        	color = "#ffff00"
	if mem >= crit:
		color = "#ff0000"

	return "%.0f%%" % mem, perfometer_linear(mem, color)
	
perfometers["check_mk-dell_n2000_memory"] = perfometer_dell_n2000_memory
