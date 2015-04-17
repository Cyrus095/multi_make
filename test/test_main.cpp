#define CATCH_CONFIG_RUNNER
#include "Catch/catch.hpp"

int main(int argc, char* const argv[])
{
    int result = Catch::Session().run(argc, argv);

    return result;
}
