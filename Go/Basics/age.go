package main
import "fmt"
func main() {
	var age int
	var name string
	fmt.Println("Hello, what is your good name:")
	_, err := fmt.Scanln(&name)
	if err != nil {
		fmt.Println("Error on reading the name:", err)
		return
	}
	fmt.Println("How old are you:")
	_, err = fmt.Scanln(&age)
	if err != nil {
		fmt.Println ("Erron on reading the age:", err)
		return
	}
	fmt.Printf("Hello,%s! you are %d years old.\n", name, age)
}