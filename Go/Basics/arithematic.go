package main
import "fmt"
func main() {
	var result,num1,num2,quo int
	fmt.Println("Enter the first number:" )
	_, err := fmt.Scanln(&num1)
	if err != nil {
		fmt.Println("error on reading the first nymber")
		return
	}
	fmt.Println("Enter the second number:")
	_, err = fmt.Scanln(&num2)
	if err != nil {
		fmt.Println("Error on reading the second number")
		return
	}
	result = num1 + num2
    fmt.Println("Addition:", result)
	result = num1 - num2
	fmt.Println("Subtraction:", result)
	result = num1 * num2
	fmt.Println("Multiplication:", result)
	if num2 != 0 {
		quo = num1 % num2
		result = num1 / num2
		fmt.Println("Division:", result)
		fmt.Println("Quotient:", quo)
	} else {
		fmt.Println("Second number is zero, Cannot devide by zero")
	}
}