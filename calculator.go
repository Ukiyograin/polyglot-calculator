// Go - 平方根计算
package main

import (
	"fmt"
	"io/ioutil"
	"math"
	"strconv"
	"strings"
)

func squareRoot(x float64) float64 {
	if x < 0 {
		return math.NaN()
	}
	return math.Sqrt(x)
}

func main() {
	data, err := ioutil.ReadFile("input.txt")
	if err != nil {
		fmt.Printf("Go读取错误: %v\n", err)
		return
	}

	lines := strings.Split(strings.TrimSpace(string(data)), "\n")
	output := "Go平方根:\n"

	for i, line := range lines {
		parts := strings.Fields(line)
		if len(parts) >= 2 {
			a, err1 := strconv.ParseFloat(parts[0], 64)
			b, err2 := strconv.ParseFloat(parts[1], 64)
			if err1 == nil && err2 == nil {
				result1 := squareRoot(a)
				result2 := squareRoot(b)
				output += fmt.Sprintf("行%d: √%.2f = %.4f, √%.2f = %.4f\n",
					i+1, a, result1, b, result2)
			}
		}
	}

	// 读取现有输出并追加
	existingOutput, _ := ioutil.ReadFile("output.txt")
	finalOutput := string(existingOutput) + output + "\n"
	ioutil.WriteFile("output.txt", []byte(finalOutput), 0644)

	fmt.Println("Go平方根计算完成!")
}