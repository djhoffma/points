CURR_PATH := $(shell pwd | sed 's/\//\\\//g')
SCRIPTS := display-points generate-members get-member-score give-out-prizes give-points setup-system
TEMPLATE_FILES := $(addprefix templates/,$(SCRIPTS))
setup: global-paths.template setup-templates $(TEMPLATE_FILES)
	sed "s/\%ROOT\%/$(CURR_PATH)/g" ./global-paths.template > global-paths.sh
	chmod 664 global-paths.sh
	./setup-templates
	chmod 770 setup-system
	./setup-system
.PHONY : clean
clean:
	rm -f global-paths.sh scores members-list $(SCRIPTS)
