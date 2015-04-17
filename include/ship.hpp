#pragma once

/*-----------------------------------------------------------*/

class Ship
{
    private:
        int x;  // Position
        int vx; // Speed

    public:
        // Creates a ship with the specified values
        Ship(int vx);

        // Sets the position of the Ship
        void setPosition(int x);

        // Returns the position of the Ship
        int getPosition();
};
