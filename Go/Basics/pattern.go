package main
import "fmt"
func main() {
	a:=10
	for i:=1; i<=a; i++ {
		for j:=1; j<=a-i; j++ {
			fmt.Print(" ")
		}
		for k:=1; k<=2*i-1; k++ {
			fmt.Print("*")
		}
	    fmt.Println()
	}
}