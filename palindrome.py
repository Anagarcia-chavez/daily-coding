import sys
import re

def is_palindrome(text):
    cleaned = re.sub(r'[^a-zA-Z0-9]', '', text).lower()
    return cleaned == cleaned[::-1]

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python palindrome.py <text>")
        sys.exit(1)
    text = sys.argv[1]
    result = is_palindrome(text)
    print(f'"{text}" is {"a palindrome" if result else "not a palindrome"}')