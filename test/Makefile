### TEST MAKEFILE ###

# -------------------------------------------------------------
# Bash Commands

MKDIR:= mkdir -p
RMDIR:= rm -rf

# -------------------------------------------------------------
# Directories

BINDIR:= bin
SRCDIR:= ../src
TESTDIR:= ./
INCDIR:= ../include
OBJDIR:= ../obj
LOGDIR:= log

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
OBJ_TEST:= $(patsubst $(TESTDIR)/%.cpp,$(OBJDIR)/%.o,$(TEST))

BIN_NAME:= $(patsubst $(TESTDIR)/%.cpp,$(BINDIR)/%,$(TEST))
BIN_EXEC:= $(wildcard $(BINDIR)/*)

# =============================================================

.PHONY: all run clean logclean

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
	@$(foreach bin,\
	   $(BIN_EXEC),\
	   ./$(bin) | tee $(LOGDIR)/`basename $(bin)`.log;)
	@echo "> Log files updated!"

logshow:
	@ls $(LOGDIR) | cat

clean:
	$(RMDIR) $(BINDIR)

logclean:
	$(RMDIR) $(LOGDIR)
