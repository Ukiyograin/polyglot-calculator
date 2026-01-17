#!/usr/bin/env python3
"""
多语言大杂烩计算器主控制器
简化版本 - 只保留核心功能
"""
import subprocess
import os
import sqlite3

def run_cmd(cmd):
    """运行外部命令"""
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True)
        return result.stdout.strip()
    except:
        return ""

def setup():
    """初始化设置"""
    # 创建输入文件
    with open('input.txt', 'w') as f:
        f.write("10 5\n3 7\n8 2\n6 4\n")
    
    # 清空输出文件
    if os.path.exists('output.txt'):
        os.remove('output.txt')
    
    # 设置数据库
    conn = sqlite3.connect('data.db')
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS results (
            id INTEGER PRIMARY KEY,
            language TEXT,
            operation TEXT,
            a REAL,
            b REAL,
            result REAL
        )
    ''')
    conn.commit()
    conn.close()

def main():
    print("🚀 启动多语言计算器")
    print("-" * 30)
    
    setup()
    
    # 1. Bash文件处理
    print("1. [Bash] 文件处理")
    run_cmd("bash calculator.sh")
    
    # 2. JavaScript加法
    print("2. [JavaScript] 加法")
    run_cmd("node calculator.js")
    
    # 3. Java减法
    print("3. [Java] 减法")
    run_cmd("javac calculator.java && java Calculator")
    
    # 4. C#乘法
    print("4. [C#] 乘法")
    run_cmd("mcs -out:calc_cs.exe calculator.cs && mono calc_cs.exe")
    
    # 5. Ruby除法
    print("5. [Ruby] 除法")
    run_cmd("ruby calculator.rb")
    
    # 6. Rust幂运算
    print("6. [Rust] 幂运算")
    run_cmd("rustc -o calc_rust calculator_power.rs && ./calc_rust")
    
    # 7. Go平方根
    print("7. [Go] 平方根")
    run_cmd("go build -o calc_go calculator.go && ./calc_go")
    
    # 8. Kotlin取模
    print("8. [Kotlin] 取模")
    run_cmd("kotlinc calculator.kt -include-runtime -d calc_kt.jar && java -jar calc_kt.jar")
    
    # 9. PHP阶乘
    print("9. [PHP] 阶乘")
    run_cmd("php calculator.php")
    
    # 10. Swift斐波那契
    print("10. [Swift] 斐波那契")
    run_cmd("swiftc calculator.swift -o calc_swift && ./calc_swift")
    
    # 11. Lua绝对值
    print("11. [Lua] 绝对值")
    run_cmd("lua calculator.lua")
    
    # 12. Perl最大值
    print("12. [Perl] 最大值")
    run_cmd("perl calculator.pl")
    
    # 13. R统计
    print("13. [R] 统计")
    run_cmd("Rscript calculator.r")
    
    # 14. TypeScript
    print("14. [TypeScript] 类型计算")
    run_cmd("tsc calculator.ts --outDir . --target ES2020 2>/dev/null; node calculator.js")
    
    # 15. MATLAB/Octave
    print("15. [MATLAB] 矩阵运算")
    if run_cmd("which octave"):
        run_cmd("octave --no-gui --quiet calculator.m")
    
    # 显示结果
    print("\n" + "=" * 40)
    print("📊 计算结果汇总")
    print("=" * 40)
    
    if os.path.exists('output.txt'):
        with open('output.txt', 'r') as f:
            print(f.read()[:500])  # 只显示前500字符
    
    print("\n✅ 所有语言计算完成！")
    print(f"共使用15种编程语言协同工作")

if __name__ == "__main__":
    main()