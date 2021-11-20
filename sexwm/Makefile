TARGET := sexwm
OBJS := $(shell $(OBJSMAKER))

.PHONY: all clean
all: $(TARGET)

$(TARGET): $(OBJPATH) $(OBJS)
	@echo "[$(TARGET)] Linking..."
	@$(LINKER) $(LINKER_FLAGS) $(OBJS) -o $@
	@echo "[$(TARGET)] Stripping..."
	@strip $(TARGET)

$(OBJPATH)/%.o: $(SRCPATH)/%.cpp
	@echo "[$(TARGET)] ===> $<"
	@$(CXX) -c -o $@ $< $(CXXFLAGS)
	@$(CXX) -MM $< -o $@.d.tmp $(CXXFLAGS)
	@sed -e 's|.*:|$@:|' < $@.d.tmp > $@.d
	@rm -f $@.d.tmp

$(OBJPATH):
	@echo "[$(TARGET)] Creating $(OBJPATH)/ hierarchy..."
	@cd src && find . -type d -exec mkdir -p ../$(OBJPATH)/{} \;

clean:
	@if [ -z $(TARGET) ]; then echo 'Careful!'; exit 1; fi
	@if [ -z $(OBJPATH) ]; then echo 'Careful!'; exit 1; fi
	rm -rf $(TARGET) $(OBJPATH)/
