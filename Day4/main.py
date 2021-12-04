lines = open("input.txt", "r").read().split('\n')
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

isDone = False
score = 0
for i in range(0, len(numbers) + 1):
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