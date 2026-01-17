// Java - 减法计算
import java.io.*;
import java.nio.file.*;

public class Calculator {
    public static double subtract(double a, double b) {
        return a - b;
    }
    
    public static void main(String[] args) {
        try {
            // 读取输入文件
            Path inputPath = Paths.get("input.txt");
            String content = Files.readString(inputPath);
            String[] lines = content.trim().split("\n");
            
            StringBuilder results = new StringBuilder();
            results.append("Java减法:\n");
            
            for (int i = 0; i < lines.length; i++) {
                String[] numbers = lines[i].split(" ");
                if (numbers.length >= 2) {
                    double a = Double.parseDouble(numbers[0]);
                    double b = Double.parseDouble(numbers[1]);
                    double result = subtract(a, b);
                    results.append(String.format("行%d: %.2f - %.2f = %.2f\n", 
                        i + 1, a, b, result));
                }
            }
            
            // 将结果追加到输出文件
            Files.write(Paths.get("output.txt"), 
                results.toString().getBytes(), 
                StandardOpenOption.CREATE, 
                StandardOpenOption.APPEND);
                
            System.out.println("Java减法计算完成!");
        } catch (Exception e) {
            System.out.println("Java计算错误: " + e.getMessage());
        }
    }
}