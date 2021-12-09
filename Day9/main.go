package main

import(
    "bufio"
	"os"
	"fmt"
)

func loadData() [][]int {
	dir, _ := os.Getwd()
	f, _ := os.Open(dir + "/input.txt")
	defer f.Close()

	data := [][]int{}

    scanner := bufio.NewScanner(f)
    for scanner.Scan() {
		arr := []int{}
		for _, e := range scanner.Text() {
			arr = append(arr, (int)(e - '0'))
		}
		data = append(data, [][]int{arr}...)
    }

	return data
}

func part1() {
	data := loadData()

	sum := 0
	for y := 0; y < len(data); y++ {
		for x := 0; x < len(data[y]); x++ {
			c := data[y][x]
			if (x > 0 && data[y][x - 1] <= c) ||
				(x < len(data[y]) - 1 && data[y][x + 1] <= c) ||
				(y > 0 && data[y - 1][x] <= c) ||
				(y < len(data) - 1 && data[y + 1][x] <= c) {
				continue
			}
			sum += c + 1
		}
	}

	fmt.Println(sum)
}

func fillZone(x, y int, data [][]int) ([][]int, int) {
	data[y][x] = 9
	size := 1
	if x > 0 && data[y][x - 1] != 9 {
		v := 0
		data, v = fillZone(x - 1, y, data)
		size += v
	}
	if x < len(data[y]) - 1 && data[y][x + 1] != 9 {
		v := 0
		data, v = fillZone(x + 1, y, data)
		size += v
	}
	if y > 0 && data[y - 1][x] != 9 {
		v := 0
		data, v = fillZone(x, y - 1, data)
		size += v
	}
	if y < len(data) - 1 && data[y + 1][x] != 9 {
		v := 0
		data, v = fillZone(x, y + 1, data)
		size += v
	}
	return data, size
}

func part2() {
	data := loadData()
	size := 0
	for y := 0; y < len(data); y++ {
		for x := 0; x < len(data[y]); x++ {
			if data[y][x] != 9 {
				data, size = fillZone(x, y, data)
				fmt.Println(size)
			}
		}
	}
}

func main() {
	part1()
	part2()
}