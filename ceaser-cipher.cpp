#include <iostream>
#include <string>

std::string caesarCipher(const std::string& text, int shift) {
    std::string result = "";
    for (char c : text) {
        if (isupper(c)) {
            result += char(int(c + shift - 'A') % 26 + 'A');
        } else if (islower(c)) {
            result += char(int(c + shift - 'a') % 26 + 'a');
        } else {
            result += c;
        }
    }
    return result;
}

int main(int argc, char* argv[]) {
    if (argc < 3) {
        std::cout << "Usage: ./caesar <text> <shift>\n";
        return 1;
    }

    std::string text = argv[1];
    int shift = std::stoi(argv[2]);

    std::string encoded = caesarCipher(text, shift);
    std::cout << "Encoded: " << encoded << "\n";

    std::string decoded = caesarCipher(encoded, 26 - (shift % 26));
    std::cout << "Decoded: " << decoded << "\n";

    return 0;
}