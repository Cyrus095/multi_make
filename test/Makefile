### TEST MAKEFILE ###

# -------------------------------------------------------------
# Bash Commands

MKDIR:= mkdir -p
RMDIR:= rm -rf
RM:= rm -f

# -------------------------------------------------------------
# Directories and Scripts

BINDIR:= bin
SRCDIR:= ../src
TESTDIR:= ./
INCDIR:= ../include
OBJDIR:= ../obj
LOGDIR:= log

SCRIPT:= catchManager.sh

# -------------------------------------------------------------
# Compiler

CC:= g++
CFLAGS:= -Wall -O3 -std=c++11 -pedantic -Wno-unused-result
LIBS:=
INC:= -I$(INCDIR)

# -------------------------------------------------------------
# Files

SRC:= $(filter-out $(SRCDIR)/main.cpp, $(wildcard $(SRCDIR)/*.cpp))
OBJ_SRC:= $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRC))

TEST:= $(wildcard $(TESTDIR)/*.cpp)
BIN_NAME:= $(patsubst $(TESTDIR)/%.cpp,$(BINDIR)/%,$(TEST))

# =============================================================

.PHONY: all run clean logclean

# Don't erase any intermediate file
.SECONDARY:

all: $(BIN_NAME)

$(BINDIR)/%: $(OBJ_SRC) $(OBJDIR)/%.o | $(BINDIR)
	$(CC) $^ $(LIBS) -o $@
	@echo "Generating C++ testing binary \033[1;33m"$@"\033[0m"

$(OBJ_SRC) $(OBJ_TEST): | $(OBJDIR)

$(OBJDIR)/%.o: $(TESTDIR)/%.cpp
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

$(OBJDIR) $(BINDIR) $(LOGDIR):
	$(MKDIR) $@

run: all $(LOGDIR)
	@echo "Running tests..."
	@$(foreach bin,\
	   $(BIN_NAME),\
	   ./$(SCRIPT) $(bin) $(LOGDIR)/`basename $(bin)`.log;)
	@echo "Done!"

# Checks if $(LOGDIR) exists and isn't empty before displaying text
logshow:
	@if [ -d $(LOGDIR) ] && [ $$(ls -A $(LOGDIR)) ]; then cat $(LOGDIR)/*; fi

clean:
	$(RMDIR) $(BINDIR)

logclean:
	$(RMDIR) $(LOGDIR)
