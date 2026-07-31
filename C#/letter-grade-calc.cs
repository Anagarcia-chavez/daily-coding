using System;

class Program
{
    static string GetLetterGrade(double score)
    {
        if (score >= 90)
        {
            return "A";
        }
        else if (score >= 80)
        {
            return "B";
        }
        else if (score >= 70)
        {
            return "C";
        }
        else if (score >= 60)
        {
            return "D";
        }
        else
        {
            return "F";
        }
    }

    static void Main(string[] args)
    {
        Console.WriteLine("Grade Calculator");
        Console.WriteLine("Type 'quit' to stop.\n");

        while (true)
        {
            Console.Write("Enter a score (0-100): ");
            string input = Console.ReadLine().Trim();

            if (input.ToLower() == "quit")
            {
                break;
            }

            if (!double.TryParse(input, out double score) || score < 0 || score > 100)
            {
                Console.WriteLine("Please enter a valid number between 0 and 100.\n");
                continue;
            }

            string letter = GetLetterGrade(score);
            Console.WriteLine($"Grade: {letter}\n");
        }
    }
}