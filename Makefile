PAGES=$(wildcard *.mustache)
STYLES=$(wildcard *.css)
BUILD=build
MUSTACHE=node_modules/.bin/mustache
PARTIALS=$(wildcard partials/*.mustache)

all: $(addprefix $(BUILD)/,$(PAGES:.mustache=.html)) $(addprefix $(BUILD)/,$(STYLES))

$(BUILD)/%.html: %.mustache %.json $(PARTIALS) | $(MUSTACHE) $(BUILD)
	$(MUSTACHE) $(addprefix -p ,$(PARTIALS)) $*.json $< > $@

$(BUILD)/%.css: %.css
	cp $< $@

$(BUILD):
	mkdir -p $(BUILD)

$(MUSTACHE):
	npm install

.PHONY: clean

clean:
	rm -rf $(BUILD)
