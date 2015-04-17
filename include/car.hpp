#pragma once

/*-----------------------------------------------------------*/

class Car
{
    private:
        int x;  // Position
        int vx; // Speed

    public:
        // Creates a car with the specified values
        Car(int vx);

        // Sets the position of the Car
        void setPosition(int x);

        // Returns the position of the Car
        int getPosition();
};
