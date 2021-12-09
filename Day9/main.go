package main

import(
    "bufio"
	"os"
	"fmt"
)
  
func main() {
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