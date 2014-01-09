CURR_PATH := $(shell pwd | sed 's/\//\\\//g')
setup: global-paths.template setup-system
	sed "s/\%ROOT\%/$(CURR_PATH)/g" ./global-paths.template > global-paths.sh
	chmod 664 global-paths.sh
	./setup-system
.PHONY : clean
clean:
	rm -f global-paths.sh scores members-list
