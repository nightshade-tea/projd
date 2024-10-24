int prime(int n)
{
    if (n <= 1)
        return 0;

    int p = 1;
    int m = n / 2;
    int i;
    for (i = 2; i <= m; i++) {
        if ((n % i) == 0) {
            p = 0;
            break;
        }
    }

    return p;
}
