package main
import "fmt"
func main() {
	var age int
	fmt.Println("Hello, How old are you?")
	_, err := fmt.Scanln(&age)
	if err != nil {
		fmt.Println("Wrong input")
		return
	}
	if age < 18 {
		fmt.Println("You are not an adult")
	} else {
		fmt.Println("You are adult!")
	}

}