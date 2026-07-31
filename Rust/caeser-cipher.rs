use std::io;
use std::io::Write;

fn shift_char(c: char, shift: i32) -> char {
    if c.is_ascii_lowercase() {
        let base = b'a' as i32;
        let shifted = (c as i32 - base + shift).rem_euclid(26) + base;
        shifted as u8 as char
    } else if c.is_ascii_uppercase() {
        let base = b'A' as i32;
        let shifted = (c as i32 - base + shift).rem_euclid(26) + base;
        shifted as u8 as char
    } else {
        c
    }
}

fn caesar_cipher(text: &str, shift: i32) -> String {
    text.chars().map(|c| shift_char(c, shift)).collect()
}

fn read_line(prompt: &str) -> String {
    print!("{}", prompt);
    io::stdout().flush().unwrap();

    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    input.trim().to_string()
}

fn main() {
    println!("Caesar Cipher");
    println!("Type 'quit' anytime to stop.\n");

    loop {
        let mode = read_line("Encrypt or decrypt (e/d): ");

        if mode == "quit" {
            break;
        }

        if mode != "e" && mode != "d" {
            println!("Please enter 'e' or 'd'.\n");
            continue;
        }

        let text = read_line("Enter text: ");

        if text == "quit" {
            break;
        }

        let shift_input = read_line("Enter shift amount (e.g. 3): ");

        if shift_input == "quit" {
            break;
        }

        let shift: i32 = match shift_input.parse() {
            Ok(n) => n,
            Err(_) => {
                println!("Please enter a valid number.\n");
                continue;
            }
        };

        let effective_shift = if mode == "e" { shift } else { -shift };
        let result = caesar_cipher(&text, effective_shift);

        println!("Result: {}\n", result);
    }
}