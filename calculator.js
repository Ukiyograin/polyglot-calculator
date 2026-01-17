// JavaScript - 加法计算
const fs = require('fs');

function addNumbers(a, b) {
    return a + b;
}

// 读取输入文件
fs.readFile('input.txt', 'utf8', (err, data) => {
    if (err) {
        console.log("JavaScript加法计算错误:", err);
        return;
    }
    
    const lines = data.trim().split('\n');
    let results = [];
    
    lines.forEach((line, index) => {
        const [a, b] = line.split(' ').map(Number);
        if (!isNaN(a) && !isNaN(b)) {
            const sum = addNumbers(a, b);
            results.push(`行${index + 1}: ${a} + ${b} = ${sum}`);
        }
    });
    
    // 将结果追加到输出文件
    const output = "JavaScript加法:\n" + results.join('\n') + '\n\n';
    fs.appendFileSync('output.txt', output);
    console.log("JavaScript加法计算完成!");
});