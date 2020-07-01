#include <conio.h>

int fibo(int x)
{
	if (x<=1)
	{
		return 1;
	}

	else
	{
		return fibo(x-1)+fibo(x-2);
	}
}

int main()
{
        return fibo(6);
}
