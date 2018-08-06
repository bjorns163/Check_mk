def perfometer_dell_n2000_cpu(row, check_command, perf_data):
	color = "#00ff00"
	#return repr(perf_data), ''
	cpu = saveint(float(perf_data[0][1]))
	warn = saveint(perf_data[0][3])
	crit = saveint(perf_data[0][4])
	if cpu >= warn:
        	color = "#ffff00"
	if cpu >= crit:
		color = "#ff0000"

	return "%.0f%%" % cpu, perfometer_linear(cpu, color)
	
perfometers["check_mk-dell_n2000_cpu"] = perfometer_dell_n2000_cpu
