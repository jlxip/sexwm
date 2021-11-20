export SRCPATH := src
export OBJPATH := obj
BINPATH := bin

export CXX := g++
export CXXFLAGS := -Isrc -O3 -Wall -Wextra -Werror

export LINKER := $(CXX)
export LINKERFLAGS := $(CXXFLAGS)

.PHONY: all clean
all: $(BINPATH) bin/sexwm

pretty = "\e[34m\e[1m--- "$(1)" ---\e[0m"

export OBJSMAKER = cd src && find . -type f -iname '*.cpp'
OBJSMAKER += | sed 's/\.\///g' | sed 's/\.cpp/\.o/g'
OBJSMAKER += | xargs -I {} echo $(OBJPATH)/{}

bin/%:
	@echo -e $(call pretty,Compiling $*)
	@$(MAKE) -C $* -j`nproc` --no-print-directory
	@cp -v $*/$* $@

$(BINPATH):
	@mkdir -p $(BINPATH)

clean:
	@$(MAKE) -C sexwm --no-print-directory clean
	@#$(MAKE) -C sexc --no-print-directory clean
	@if [ -z $(BINPATH) ]; then echo 'Careful!'; exit 1; fi
	rm -rf $(BINPATH)/
