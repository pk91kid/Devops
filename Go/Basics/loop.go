package main
import (
	"bufio"
	"fmt"
	"os"
)
var num int
func main(){
	fmt.Println("Enter the limit value:")
	_, err := fmt.Scanln(&num)
	if err != nil {
		fmt.Println("Erron on reading the limit value")
		return
	}
	file, err := os.Create("result.txt")
	if err != nil {
		fmt.Println("Error on creating the result file", err)
		return
	}
	defer file.Close()
	writer := bufio.NewWriter(file)
	writer.WriteString("---------------------------------------------------\n")
	for i := 0; i <= num; i++ {
		fmt.Fprintln(writer, i)
	}
	writer.Flush()
	fmt.Println("Output is written to result.txt")

}