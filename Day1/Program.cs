using System;
using System.IO;
using System.Linq;

var data = File.ReadAllLines("input.txt").Select(x => int.Parse(x)).ToArray();
int count = 0;
for (int i = 0; i < data.Length - 1; i++)
{
    if (data[i] < data[i + 1])
    {
        count++;
    }
}
Console.WriteLine(count);