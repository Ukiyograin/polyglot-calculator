// C# - 乘法计算
using System;
using System.IO;

class Calculator
{
    static double Multiply(double a, double b)
    {
        return a * b;
    }
    
    static void Main()
    {
        try
        {
            string[] lines = File.ReadAllLines("input.txt");
            string output = "C#乘法:\n";
            
            for (int i = 0; i < lines.Length; i++)
            {
                string[] numbers = lines[i].Split(' ');
                if (numbers.Length >= 2)
                {
                    double a = double.Parse(numbers[0]);
                    double b = double.Parse(numbers[1]);
                    double result = Multiply(a, b);
                    output += $"行{i+1}: {a} × {b} = {result}\n";
                }
            }
            
            File.AppendAllText("output.txt", output + "\n");
            Console.WriteLine("C#乘法计算完成!");
        }
        catch (Exception e)
        {
            Console.WriteLine($"C#计算错误: {e.Message}");
        }
    }
}