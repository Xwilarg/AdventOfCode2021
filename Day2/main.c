#include <stdio.h>

static int horizontal;
static int depth;

// For part 2
static int aim;

static void part1(int dir, int value)
{
    if (dir == 'f') {
        horizontal += value;
    } else if (dir == 'd') {
        depth += value;
    } else {
        depth -= value;
    }
}

static void part2(int dir, int value)
{
    if (dir == 'd') {
        aim += value;
    } else if (dir == 'u') {
        aim -= value;
    } else {
        horizontal += value;
        depth += value * aim;
    }
}

static void exercice(void (*treatment)(int, int))
{
    horizontal = 0;
    depth = 0;
    aim = 0;

    FILE* file = fopen("input.txt", "r");
    char instruction[1];
    int dir;
    while (fread(instruction, 1, 1, file) > 0)
    {
        dir = instruction[0];
        switch (instruction[0])
        {
            case 'f':
                fseek(file, 7, SEEK_CUR); // "orward "
                break;
            
            case 'd':
                fseek(file, 4, SEEK_CUR); // "own "
                break;
            
            case 'u':
                fseek(file, 2, SEEK_CUR); // "p "
                break;
        }

        fread(instruction, 1, 1, file);
        int value = instruction[0] - '0';
        treatment(dir, value);

        // If we are on Windows, endlines are \r\n while on Linux it's just \n
        fread(instruction, 1, 1, file);
        if (instruction[0] == '\r')
        {
            fseek(file, 1, SEEK_CUR); // "\n"
        }
    }
    printf("%d\n", horizontal * depth);
    fclose(file);
}

int main(void)
{
    exercice(part1);
    exercice(part2);
    return 0;
}