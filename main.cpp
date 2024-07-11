#include <iostream>
#include <string>
int add(int t1, int t2)
{
    int result =  t1 + t2;
    std::cout << t1 << " + " << t2 << " is: " << result << std::endl;
    return result;
}

int main()
{
    int ret_add;
    ret_add = add(1,2);
    std::cout << "hellp, this is my add sample " << ret_add << std::endl;
    return 0;
}
