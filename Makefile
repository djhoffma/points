CURR_PATH := $(shell pwd | sed 's/\//\\\//g')
SCRIPTS := display-points generate-members get-member-score give-out-prizes give-points.sh setup-system global-paths.sh
TEMPLATE_FILES := $(addprefix templates/,$(SCRIPTS))
EXECUTABLE_FILES := give-points
setup: setup-templates $(TEMPLATE_FILES)
	./setup-templates
	gcc give-points-outer.c -o give-points
	chmod 770 setup-system
	./setup-system
.PHONY : clean
clean:
	rm -f global-paths.sh scores members-list $(SCRIPTS) $(EXECUTABLE_FILES)
