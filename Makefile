# Makefile.starter — skeleton for Lab 02, Task 4 (ASSESSED).
#
# Rename this to  Makefile  and complete every TODO.
# Requirements are listed in Section 4.1 of the lab manual.
#
#     cp Makefile.starter Makefile
#     nano Makefile
#
# EVERY recipe line below must start with a real TAB, not spaces.
# Check yours with:  cat -A Makefile     (a tab shows as ^I)

SRC_DIR := src
OUT_DIR := out

# TODO 1: set SOURCES to every .txt file in $(SRC_DIR), using $(wildcard).
SOURCES := $(wildcard $(SRC_DIR)/*.txt)

# TODO 2: set OUTPUTS to the matching paths under $(OUT_DIR), using $(patsubst).
OUTPUTS := $(patsubst $(SRC_DIR)/%.txt,$(OUT_DIR)/%.txt,$(SOURCES))
REPORT := $(OUT_DIR)/report.txt
BUILD_OUTPUTS := $(filter-out $(REPORT),$(OUTPUTS))

# TODO 3: list every action target here so make never mistakes one for a file.
.PHONY: all check build test clean ci help

# The first target in the file is what a bare `make` runs.
all: test	## Build and Test everything

$(OUT_DIR):
	mkdir -p $(OUT_DIR)

# TODO 4: the pattern rule. Announce the file with @echo, then convert it.
#         Use $< for the input and $@ for the output — no filenames by hand.
#         Keep the order-only prerequisite  | $(OUT_DIR)  exactly as it is.
$(OUT_DIR)/%.txt: $(SRC_DIR)/%.txt | $(OUT_DIR)
	@echo "  BUILD $< -> $@"
	@tr '[:lower:]' '[:upper:]' < "$<" > "$@"

# TODO 5: check — exit non-zero with a clear message when $(SRC_DIR) is
#         missing or holds no .txt files; otherwise report how many were
#         found. Hint: `test -d`, `$(words $(SOURCES))`, and remember that
#         each recipe line runs in its own shell.
check:		## Check that source files exist
	@if [ ! -d "$(SRC_DIR)" ]; then \
		echo "ERROR: source directory $(SRC_DIR) is missing"; \
		exit 1; \
	elif [ -z "$(SOURCES)" ]; then \
		echo "ERROR: no .txt files found in $(SRC_DIR)"; \
		exit 1; \
	else \
		echo "CHECK: found $$(echo "$(SOURCES)" | wc -w) source file(s)"; \
	fi

# The whole build stage. Nothing to add here — this line is the lesson.
build: $(OUTPUTS)

# TODO 6: test — depend on build, then fail if any output still contains a
#         lowercase letter. A multi-line if needs a backslash on every line
#         but the last. Print TEST PASSED on success.
test: build	## Test generated files
	@if grep -l '[a-z]' $(BUILD_OUTPUTS) >/dev/null 2>&1; then \
		echo "TEST FAILED: lowercase characters remain"; \
		exit 1; \
	fi
	@echo "TEST PASSED"

# TODO 7: clean — remove $(OUT_DIR) entirely.
clean:		## Remove output directory
	rm -rf $(OUT_DIR)

# A build server's entry point: clean, verify, then build and test.
ci: clean check test 		## Run clean, check and test

help: ## Show available targets
	@grep -E '^[a-zA-Z0-9_-]+:.*##' $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*##"} {printf "  %-10s %s\n", $$1, $$2}'

$(REPORT): $(BUILD_OUTPUTS)
	@echo "Generating report..."
	@{ \
		echo "Build Report"; \
		echo "Generated: $$(date)"; \
		echo ""; \
		for file in $(OUTPUTS); do \
			echo "$$file: $$(wc -l < "$$file") lines"; \
		done; \
	} > "$@"

count: build  ## report source files and built words
	@ls -1 $(SRC_DIR)/*.txt | wc -l
	@wc -w $(OUTPUTS) | tail -1
# count: see section 5 of the README
# OUTPUTS is set by the wildcard above
# run 'make help' for all targets
