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

# -------------------------------------------------------------
# Compiler

CC:= g++
CFLAGS:= -Wall -O3 -std=c++11 -pedantic -Wno-unused-result
LIBS:=
INC:= -I$(INCDIR)

# -------------------------------------------------------------
# Files

BIN:= test
SCRIPT:= catchManager.sh

SRC:= $(filter-out $(SRCDIR)/main.cpp, $(wildcard $(SRCDIR)/*.cpp))
OBJ_SRC:= $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRC))

TEST:= $(wildcard $(TESTDIR)/*.cpp)
OBJ_TEST:= $(patsubst $(TESTDIR)/%.cpp,$(OBJDIR)/%.o,$(TEST))

# =============================================================

.PHONY: all run clean logclean

# Don't erase any intermediate file
.SECONDARY:

all: $(BINDIR)/$(BIN)

$(BINDIR)/$(BIN): $(OBJ_SRC) $(OBJ_TEST) | $(BINDIR)
	$(CC) $^ $(LIBS) -o $@
	@echo "Generating C++ testing binary \033[1;33m"$@"\033[0m"

$(OBJ_SRC) $(OBJ_TEST): | $(OBJDIR)

$(OBJDIR)/%.o: $(TESTDIR)/%.cpp
	$(CC) $(CFLAGS) $(INC) -c $< -o $@

$(OBJDIR) $(BINDIR) $(LOGDIR):
	$(MKDIR) $@

run: all $(LOGDIR)
	@echo "Running tests..."
	@./$(SCRIPT) $(BINDIR)/$(BIN) $(LOGDIR)/`date +'%d-%m-%Y--%H:%M:%S'`.log

logshow:
	@ls $(LOGDIR)

clean:
	$(RMDIR) $(BINDIR)

logclean:
	$(RMDIR) $(LOGDIR)
