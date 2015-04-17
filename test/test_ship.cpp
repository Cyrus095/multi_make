#include "Catch/catch.hpp"
#include "ship.hpp"

/*-----------------------------------------------------------*/

TEST_CASE( "Ship's position is correctly set", "[Ship::getPosition]" ) {
    Ship ship{50};

    REQUIRE( ship.getPosition() == 0 );
}
