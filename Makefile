#   -------------------------------------------------------------
#   Salt configuration for Woods Cloud servers
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
#   Project:        Woods Cloud
#   Created:        2018-11-30
#   -------------------------------------------------------------

RM=rm

#   -------------------------------------------------------------
#   Main targets
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

all: pillar/nodes/instances.sls

clean:
	${RM} pillar/nodes/instances.sls

#   -------------------------------------------------------------
#   Individual targets
#   - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

pillar/nodes/instances.sls:
	utils/generate-pillar-instances.py > pillar/nodes/instances.sls
