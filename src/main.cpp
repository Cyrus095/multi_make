#include <iostream>
#include "car.hpp"

/*-----------------------------------------------------------*/

int main(int argc, char const *argv[])
{
    Car ferrari{100};
    std::cout << "x = " << ferrari.getPosition() << std::endl;

    return 0;
}