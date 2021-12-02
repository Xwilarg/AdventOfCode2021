#include <stdio.h>

int main()
{
    int horizontal = 0;
    int depth = 0;

    FILE* file = fopen("input.txt", "r");
    char instruction[1];
    int dir;
    while (fread(instruction, 1, 1, file) > 0)
    {
        switch (instruction[0])
        {
            case 'f':
                fseek(file, 7, SEEK_CUR); // "orward "
                dir = 0;
                break;
            
            case 'd':
                fseek(file, 4, SEEK_CUR); // "own "
                dir = 1;
                break;
            
            case 'u':
                fseek(file, 2, SEEK_CUR); // "p "
                dir = 2;
                break;
        }

        fread(instruction, 1, 1, file);
        int value = instruction[0] - '0';
        if (dir == 0) {
            horizontal += value;
        } else if (dir == 1) {
            depth += value;
        } else {
            depth -= value;
        }

        // If we are on Windows, endlines are \r\n while on Linux it's just \n
        fread(instruction, 1, 1, file);
        if (instruction[0] == '\r')
        {
            fseek(file, 1, SEEK_CUR); // "\n"
        }
    }
    printf("%d\n", horizontal * depth);
    fclose(file);
    return 0;
}