// TypeScript - 类型安全计算
interface Calculation {
    a: number;
    b: number;
    operation: string;
    result: number;
}

function calculate(a: number, b: number, op: string): number {
    switch(op) {
        case '+': return a + b;
        case '-': return a - b;
        case '*': return a * b;
        case '/': return b !== 0 ? a / b : NaN;
        default: return NaN;
    }
}

const fs = require('fs');

try {
    const data: string = fs.readFileSync('input.txt', 'utf8');
    const lines: string[] = data.trim().split('\n');
    const calculations: Calculation[] = [];
    
    lines.forEach((line: string, index: number) => {
        const [aStr, bStr] = line.trim().split(/\s+/);
        const a: number = parseFloat(aStr);
        const b: number = parseFloat(bStr);
        
        if (!isNaN(a) && !isNaN(b)) {
            const operations = ['+', '-', '*', '/'];
            operations.forEach(op => {
                const result = calculate(a, b, op);
                calculations.push({ a, b, operation: op, result });
            });
        }
    });
    
    let output = "TypeScript类型安全计算:\n";
    calculations.forEach((calc, index) => {
        if (index < 4) { // 只显示前几个结果
            output += `${calc.a} ${calc.operation} ${calc.b} = ${calc.result.toFixed(2)}\n`;
        }
    });
    
    fs.appendFileSync('output.txt', output + "\n");
    console.log("TypeScript计算完成!");
} catch (error) {
    console.error("TypeScript错误:", error);
}