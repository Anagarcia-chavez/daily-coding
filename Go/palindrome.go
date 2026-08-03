package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func cleanString(s string) string {
	var builder strings.Builder
	for _, r := range strings.ToLower(s) {
		if (r >= 'a' && r <= 'z') || (r >= '0' && r <= '9') {
			builder.WriteRune(r)
		}
	}
	return builder.String()
}

func reverseString(s string) string {
	runes := []rune(s)
	for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
		runes[i], runes[j] = runes[j], runes[i]
	}
	return string(runes)
}

func isPalindrome(s string) bool {
	cleaned := cleanString(s)
	return cleaned == reverseString(cleaned)
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)

	fmt.Println("Palindrome Checker")
	fmt.Println("Type 'quit' to stop.")

	for {
		fmt.Print("\nEnter text: ")
		scanner.Scan()
		input := scanner.Text()

		if strings.ToLower(strings.TrimSpace(input)) == "quit" {
			break
		}

		reversed := reverseString(input)
		fmt.Printf("Reversed: %s\n", reversed)

		if isPalindrome(input) {
			fmt.Println("That's a palindrome!")
		} else {
			fmt.Println("Not a palindrome.")
		}
	}
}