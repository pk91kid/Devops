package main
import (
	"fmt"
	"math/rand"
	"time"
)
func main() {
	source := rand.NewSource(time.Now().UnixNano())
	random := rand.New(source)
	target := random.Intn(100) +1
	fmt.Println("Hello, Welcome to the game!")
	fmt.Println("I have chosen a random number between 1 and 100")
	fmt.Println("Can you guess the number?")
	var guess int
	for {
		fmt.Println("Enter your guess")
		fmt.Scanln(&guess)
		if guess == target {
			fmt.Println("Congratulations!!!, You have guessed the correct number")
			break
		} else if guess < target {
			fmt.Println("Too low! Try to guess a higher number")
		}else {
			fmt.Println("Too high! Try to guess a lower number")
		}
		
	}
}