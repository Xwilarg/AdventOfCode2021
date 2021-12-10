using System;
using System.IO;
using System.Linq;

var data = File.ReadAllLines("input.txt").Select(x => int.Parse(x)).ToArray();

#region part 1
{
    int count = 0;
    for (int i = 0; i < data.Length - 1; i++)
    {
        if (data[i] < data[i + 1])
        {
            count++;
        }
    }
    Console.WriteLine(count);
}
#endregion

#region part 2
{
    int count = 0;
    for (int i = 0; i < data.Length - 3; i++)
    {
        if (data[i..(i + 3)].Sum() < data[(i + 1)..(i + 4)].Sum())
        {
            count++;
        }
    }
    Console.WriteLine(count);
}
#endregion