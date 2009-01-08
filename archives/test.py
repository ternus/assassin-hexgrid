#!/usr/bin/env python
#
#  This is a file which demonstrates the grid generation routine.
#
#######################

import gridmaps, random, os

gridMap = gridmaps.grid()

## Set up the parameters.

gridMap.setType('hex')
gridMap.setGrid(.6)


## First, we'll generate the full map (gridfull.png)

gridMap.setDrawAll(1)
gridMap.setNodes({})

filename = "tmp" + str(random.Random().random()) + ".svg"
gridMap.save(filename)

os.spawnlp(os.P_WAIT, "convert", "",  filename, "gridfull.png");
os.remove("./" + filename)

## Next, we'll generate an example user-visible map (gridtest.png)

gridMap.setDrawAll(0)
nodes = {215:"Achmed",214:"Bob",113:"Joe",112:"Fred",217:"Alice",314:"Quux"}
gridMap.setNodes(nodes)


filename = "tmp" + str(random.Random().random()) + ".svg"
gridMap.save(filename)

os.spawnlp(os.P_WAIT, "convert", "", filename , "gridtest.png");
os.remove("./" + filename)
