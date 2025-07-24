#include <iostream>
#include "guc/add.hh"

int main() {
    int x = 5, y = 7;
    int result = guc::add(x, y);
    std::cout << x << " + " << y << " = " << result << std::endl;
    return 0;
}