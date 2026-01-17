// Kotlin - 取模运算
import java.io.File

fun modulo(a: Int, b: Int): Int {
    return if (b != 0) a % b else 0
}

fun main() {
    try {
        val lines = File("input.txt").readLines()
        val output = StringBuilder("Kotlin取模运算:\n")
        
        lines.forEachIndexed { index, line ->
            val numbers = line.trim().split("\\s+".toRegex())
            if (numbers.size >= 2) {
                val a = numbers[0].toIntOrNull()
                val b = numbers[1].toIntOrNull()
                if (a != null && b != null && b != 0) {
                    val result = modulo(a, b)
                    output.append("行${index + 1}: $a % $b = $result\n")
                }
            }
        }
        
        File("output.txt").appendText(output.toString() + "\n")
        println("Kotlin取模运算完成!")
    } catch (e: Exception) {
        println("Kotlin计算错误: ${e.message}")
    }
}