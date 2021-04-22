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

AGENTS=$(shell find agents/* -type d)

.PHONY: build $(AGENTS)
build: $(AGENTS) ## Build the Jenkins agents

$(AGENTS): ## Build each Jenkins agent
	cd $@ && docker build -t $@ .