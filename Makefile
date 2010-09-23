all:graph.eps

graph.eps:rawspice.raw plot_graph.m
	octave -q plot_graph.m

rawspice.raw:output.net simulation.cmd
	ngspice -b output.net -r rawspice.raw

output.net:test.sch
	gnetlist -g spice-sdb test.sch

clean:
	rm -f rawspice.raw
