local f = io.open("input.txt")

fileData = f:read()

function lanternfish(dayCount)
    lifetime = {}
    -- lua arrays starts at 1 so we need to do + 1 everywhere
    newBorn = 8 + 1
    reset = 6 + 1
    for i = 1, newBorn do
        table.insert(lifetime, 0)
    end

    for nb in string.gmatch(fileData, "([^,]+)") do
        lifetime[tonumber(nb) + 1] = lifetime[tonumber(nb) + 1] + 1
    end

    for year = 1, dayCount do
        nextBorns = lifetime[1]
        for i = 1, newBorn - 1 do
            lifetime[i] = lifetime[i + 1]
        end
        lifetime[reset] = lifetime[reset] + nextBorns
        lifetime[newBorn] = nextBorns
    end

    sum = 0
    for i = 1, newBorn do
        sum = sum + lifetime[i]
    end

    print(sum)

end

lanternfish(80)
lanternfish(256)

f:close()