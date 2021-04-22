# Lets have a variable to define where our agents are defined
AGENT_PATH=agents

# What should we call the agents
AGENT_NAME=jenkins-agent

# A default explain menu for Make.
.PHONY: explain
explain:
	###
	#
	#    ___            _    _
	#   |_  |          | |  (_)
	#     | | ___ _ __ | | ___ _ __  ___
	#     | |/ _ \ '_ \| |/ / | '_ \/ __|
	# /\__/ /  __/ | | |   <| | | | \__
	# \____/ \___|_| |_|_|\_\_|_| |_|___/
	#
	#
	#                                  _
	#                                 | |
	#    _____  ____ _ _ __ ___  _ __ | | ___  ___
	#   / _ \ \/ / _` | '_ ` _ \| '_ \| |/ _ \/ __|
	#  |  __/>  < (_| | | | | | | |_) | |  __/\__
	#   \___/_/\_\__,_|_| |_| |_| .__/|_|\___||___/
	#                           | |
	#                           |_|
	###
	### Targets
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Find all the agents
AGENTS=$(shell cd ${AGENT_PATH} && find * -type d)

.PHONY: build $(AGENTS)
build: $(AGENTS) ## Build the Jenkins agents

$(AGENTS): ## Build each Jenkins agent
	cd ${AGENT_PATH}/${@} && docker build -t ${AGENT_NAME}:${@} .
