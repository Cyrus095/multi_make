#include <iostream>
#include "car.hpp"
#include "ship.hpp"

/*-----------------------------------------------------------*/

int main(int argc, char const *argv[])
{
    Car  ferrari{100};
    Ship titanic{80};

    std::cout << "Car  = " << ferrari.getPosition() <<std::endl;
    std::cout << "Ship = " << titanic.getPosition() <<std::endl;

    return 0;
}
