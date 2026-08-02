import java.util.Scanner;

public class TempConverter {

    public static double celsiusToFahrenheit(double celsius) {
        return celsius * 9.0 / 5.0 + 32.0;
    }

    public static double fahrenheitToCelsius(double fahrenheit) {
        return (fahrenheit - 32.0) * 5.0 / 9.0;
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Temperature Converter");
        System.out.println("Type 'quit' anytime to stop.");

        while (true) {
            System.out.print("\nConvert c-to-f or f-to-c: ");
            String direction = scanner.nextLine().trim().toLowerCase();

            if (direction.equals("quit")) {
                break;
            }

            if (!direction.equals("c-to-f") && !direction.equals("f-to-c")) {
                System.out.println("Please enter 'c-to-f' or 'f-to-c'.");
                continue;
            }

            System.out.print("Enter the temperature: ");
            String input = scanner.nextLine().trim();

            if (input.equals("quit")) {
                break;
            }

            double value;
            try {
                value = Double.parseDouble(input);
            } catch (NumberFormatException e) {
                System.out.println("Please enter a valid number.");
                continue;
            }

            double result = direction.equals("c-to-f")
                ? celsiusToFahrenheit(value)
                : fahrenheitToCelsius(value);

            System.out.printf("Result: %.2f%n", result);
        }

        scanner.close();
    }
}