### ROOT MAKEFILE ###

# -------------------------------------------------------------
# Bash Commands

MKDIR:= mkdir -p
RMDIR:= rm -rf

# -------------------------------------------------------------
# Directories

BINDIR:= bin
SRCDIR:= src
INCDIR:= include
OBJDIR:= obj
TESTDIR:= test

# -------------------------------------------------------------
# Files

BIN:= Car

# =============================================================

.PHONY: all main test run install count count_test clean distclean libclean logclean

all: main run

main:
	@make -C $(SRCDIR)

test: main
	@make -C $(TESTDIR) run

run: main
	./$(BINDIR)/$(BIN)

install:
	@echo "Downloading Catch..."
	@wget 'https://raw.githubusercontent.com/philsquared/Catch/master/single_include/catch.hpp'
	@$(MKDIR) $(INCDIR)/Catch
	@mv catch.hpp $(INCDIR)/Catch
	@echo "Done!"

count:
	@wc -l $(SRCDIR)/*.cpp $(INCDIR)/*.hpp

count_test:
	@wc -l $(TESTDIR)/*.cpp

clean:
	$(RMDIR) $(OBJDIR)

distclean: clean
	$(RMDIR) $(BINDIR)
	@make -C $(TESTDIR) clean

libclean:
	$(RMDIR) catch.hpp $(INCDIR)/Catch

logshow:
	@make -C $(TESTDIR) logshow

logclean:
	@make -C $(TESTDIR) logclean
