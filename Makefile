COMPILER = gcc
COMPILER_FLAGS = -fPIC -O2 -Wall -Wconversion -Werror
OUTPUT_FOLDER = ./output

SHARED_LIB_TARGET = $(OUTPUT_FOLDER)/strkit.so
SHARED_LIB_COMPILER_FLAGS = -shared

STATIC_LIB_OBJ_FILES = $(OUTPUT_FOLDER)/*.o
STATIC_LIB_TARGET = $(OUTPUT_FOLDER)/strkit.a
STATIC_LIB_COMPILER_FLAGS = -c -O2

SOURCE_CODE = ./src/hamming_distance.c
PATH_TO_HEADERS = -I./include/

SOURCE_CODE_OF_TESTS = ./src/hamming_distance.c ./test_src/assert.c ./main.c
TEST_FILE_TARGET = $(OUTPUT_FOLDER)/tests

all: $(OUTPUT_FOLDER) $(SHARED_LIB_TARGET) $(STATIC_LIB_TARGET)

	@printf "\n Location of files: ./output"
	@printf "\n Starting clean of unecessary files\n\n"
	@rm $(OUTPUT_FOLDER)/*.o

$(OUTPUT_FOLDER):
	@clear
	@printf "\n Creating ouput folder... "
	@mkdir -p $(OUTPUT_FOLDER)
	@printf "Done"

$(SHARED_LIB_TARGET): $(SOURCE_CODE)
	@printf "\n Starting shared library creation process..."
	@$(COMPILER) $(PATH_TO_HEADERS) $(COMPILER_FLAGS) -o $@ $^ $(SHARED_LIB_COMPILER_FLAGS)
	@printf " Done"

$(STATIC_LIB_TARGET): $(SOURCE_CODE)
	@printf "\n Starting static library creation process..."
	@$(COMPILER) $(PATH_TO_HEADERS) $(STATIC_LIB_COMPILER_FLAGS) -o ./output/hamming_distance.o ./src/hamming_distance.c
	@ar rcs $@ $(STATIC_LIB_OBJ_FILES)
	@printf " Done"

clean:
	@clear
	@printf "\n Starting cleaning process"
	@rm -rf $(OUTPUT_FOLDER)
	@printf "\n All files from output folder have been removed!\n\n"

check:
	@clear
	@printf "\n Checking environment..."
	@printf "\n  -> GCC version: %s" $$(gcc -dumpversion)
	@printf "\n  -> Environment: %s %s\n\n" $$(uname -o) $$(uname -m)

tests: $(TEST_FILE_TARGET)
$(TEST_FILE_TARGET): $(SOURCE_CODE_OF_TESTS)
	@clear
	@printf "\n Compiling tests..."
	@mkdir -p $(OUTPUT_FOLDER)
	@$(COMPILER) $(COMPILER_FLAGS_FOR_TESTS) $(PATH_TO_HEADERS) -o $@ $^
	@printf "\n Running tests...\n\n"
	@./output/tests
	@printf "\n Tests ended!\n\n"
