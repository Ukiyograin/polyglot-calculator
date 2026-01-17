// PowerRust - 幂运算模块
// 专门处理各种幂运算：普通幂、整数幂、快速幂等
use std::fs;
use std::io::{self, Write};

// 普通幂运算
fn power(a: f64, b: f64) -> f64 {
    a.powf(b)
}

// 整数幂运算（快速幂算法）
fn int_power(base: i64, exponent: i64) -> i64 {
    let mut result = 1;
    let mut base = base;
    let mut exp = exponent.abs();
    
    while exp > 0 {
        if exp % 2 == 1 {
            result *= base;
        }
        base *= base;
        exp /= 2;
    }
    
    if exponent < 0 {
        1 / result
    } else {
        result
    }
}

// 平方和立方快捷函数
fn square(x: f64) -> f64 {
    x * x
}

fn cube(x: f64) -> f64 {
    x * x * x
}

// 计算并生成数学运算报告
fn generate_power_report(numbers: Vec<Vec<f64>>) -> String {
    let mut report = String::new();
    report.push_str("🦀 PowerRust 幂运算报告 🦀\n");
    report.push_str("=".repeat(40).as_str());
    report.push('\n');
    
    for (i, nums) in numbers.iter().enumerate() {
        if nums.len() >= 2 {
            let a = nums[0];
            let b = nums[1];
            
            report.push_str(&format!("\n📊 数据对 {}: ({}, {})\n", i + 1, a, b));
            report.push_str(&format!("  • {}^{} = {:.6}\n", a, b, power(a, b)));
            report.push_str(&format!("  • {}^{} = {:.6}\n", b, a, power(b, a)));
            report.push_str(&format!("  • {}² = {:.6}\n", a, square(a)));
            report.push_str(&format!("  • {}² = {:.6}\n", b, square(b)));
            report.push_str(&format!("  • {}³ = {:.6}\n", a, cube(a)));
            report.push_str(&format!("  • {}³ = {:.6}\n", b, cube(b)));
            
            // 整数幂（如果数据是整数）
            if a.fract() == 0.0 && b.fract() == 0.0 {
                let a_int = a as i64;
                let b_int = b as i64;
                report.push_str(&format!("  • {}^{} (快速幂) = {}\n", 
                    a_int, b_int, int_power(a_int, b_int)));
            }
        }
    }
    
    // 添加一些特殊幂运算示例
    report.push_str("\n✨ 特殊幂运算示例:\n");
    report.push_str(&format!("  • e² ≈ {:.6}\n", std::f64::consts::E.powi(2)));
    report.push_str(&format!("  • π³ ≈ {:.6}\n", std::f64::consts::PI.powi(3)));
    report.push_str(&format!("  • 2¹⁰ = {}\n", 2i64.pow(10)));
    
    report.push_str(&format!("\n{}", "=".repeat(40)));
    report.push_str("\n🦀 PowerRust 计算完成！内存安全，速度飞快！\n");
    
    report
}

fn main() -> io::Result<()> {
    println!("🚀 PowerRust 启动...");
    
    // 读取输入文件
    let content = match fs::read_to_string("input.txt") {
        Ok(content) => {
            println!("✅ 成功读取输入文件");
            content
        }
        Err(e) => {
            eprintln!("❌ 读取文件错误: {}", e);
            return Ok(());
        }
    };
    
    // 解析数据
    let numbers: Vec<Vec<f64>> = content
        .lines()
        .filter(|line| !line.trim().is_empty())
        .map(|line| {
            line.split_whitespace()
                .filter_map(|s| s.parse::<f64>().ok())
                .collect()
        })
        .filter(|nums: &Vec<f64>| nums.len() >= 2)
        .collect();
    
    if numbers.is_empty() {
        println!("⚠️  输入文件中没有找到有效数据");
        return Ok(());
    }
    
    println!("📈 找到 {} 组数据，开始幂运算...", numbers.len());
    
    // 生成报告
    let report = generate_power_report(numbers);
    
    // 输出到控制台
    println!("\n{}", report);
    
    // 保存到文件
    let mut output_file = fs::OpenOptions::new()
        .create(true)
        .append(true)
        .open("output.txt")?;
    
    writeln!(output_file, "{}", report)?;
    
    // 同时保存一份专门的幂运算报告
    fs::write("power_report.txt", &report)?;
    
    println!("💾 结果已保存到 output.txt 和 power_report.txt");
    println!("🎉 PowerRust 任务完成！");
    
    Ok(())
}

// 单元测试
#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_power() {
        assert!((power(2.0, 3.0) - 8.0).abs() < 1e-10);
        assert!((power(4.0, 0.5) - 2.0).abs() < 1e-10);
    }
    
    #[test]
    fn test_int_power() {
        assert_eq!(int_power(2, 10), 1024);
        assert_eq!(int_power(3, 4), 81);
    }
    
    #[test]
    fn test_square_and_cube() {
        assert!((square(5.0) - 25.0).abs() < 1e-10);
        assert!((cube(3.0) - 27.0).abs() < 1e-10);
    }
}