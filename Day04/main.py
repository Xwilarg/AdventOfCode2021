lines = open("input.txt", "r").read().split('\n')

def prepareGrids():
    numbers = lines[0].split(',')

    grids = []

    rowSize = 5
    for i in range(2, len(lines), rowSize + 1):
        current = []
        for y in range(0, rowSize):
            current.append(list(filter(None, lines[i + y].split(' '))))
            data = []
            for x in range(0, rowSize):
                data.append(list(filter(None, lines[i + x].split(' ')))[y])
            current.append(data)
        grids.append(current)
    return grids, numbers

def part1():
    grids, numbers = prepareGrids()
    isDone = False
    score = 0
    for i in range(0, len(numbers)):
        for g in grids:
            for arr in g:
                if numbers[i] in arr:
                    arr.remove(numbers[i])
                if len(arr) == 0:
                    added = []
                    for row in g:
                        for elem in row:
                            if elem not in numbers[:(i + 1)] and elem not in added:
                                added.append(elem)
                                score += int(elem)
                    score *= int(numbers[i])
                    isDone = True
                    break
            if isDone:
                break
        if isDone:
            break
    print(score)

def part2():
    grids, numbers = prepareGrids()
    isDone = False
    i = 0
    while i < len(numbers):
        g = len(grids) - 1
        while g >= 0:
            for arr in grids[g]:
                if numbers[i] in arr:
                    arr.remove(numbers[i])
                if (len(arr) == 0):
                    if (len(grids) == 1):
                        isDone = True
                    else:
                        grids.remove(grids[g])
                    break
            if isDone:
                break
            g -= 1
        if isDone:
            break
        i += 1
    score = 0
    added = []
    for row in grids[0]:
        for elem in row:
            if elem not in numbers[:(i + 1)] and elem not in added:
                added.append(elem)
                score += int(elem)
    score *= int(numbers[i])
    print(score)

part1()
part2()