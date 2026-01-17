// Swift - 斐波那契数列
import Foundation

func fibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

do {
    let content = try String(contentsOfFile: "input.txt", encoding: .utf8)
    let lines = content.components(separatedBy: .newlines).filter { !$0.isEmpty }
    var output = "Swift斐波那契数列:\n"
    
    for (index, line) in lines.enumerated() {
        let numbers = line.components(separatedBy: .whitespaces).compactMap { Int($0) }
        if numbers.count >= 2 {
            let a = abs(numbers[0]) % 10 // 限制大小
            let b = abs(numbers[1]) % 10
            let fibA = fibonacci(a)
            let fibB = fibonacci(b)
            output += "行\(index + 1): F(\(a)) = \(fibA), F(\(b)) = \(fibB)\n"
        }
    }
    
    if let fileHandle = FileHandle(forWritingAtPath: "output.txt") {
        fileHandle.seekToEndOfFile()
        fileHandle.write((output + "\n").data(using: .utf8)!)
        fileHandle.closeFile()
    } else {
        try output.write(toFile: "output.txt", atomically: true, encoding: .utf8)
    }
    
    print("Swift斐波那契计算完成!")
} catch {
    print("Swift计算错误: \(error)")
}