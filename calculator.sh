#!/bin/bash
# Bash - 文件操作

echo "Bash文件处理开始..."

# 创建处理后的输入文件
if [ -f "input.txt" ]; then
    # 显示文件信息
    echo "输入文件信息:" > processed_input.txt
    echo "行数: $(wc -l < input.txt)" >> processed_input.txt
    echo "单词数: $(wc -w < input.txt)" >> processed_input.txt
    echo "字符数: $(wc -m < input.txt)" >> processed_input.txt
    echo "" >> processed_input.txt
    
    # 添加处理后的数据
    echo "处理后的数据:" >> processed_input.txt
    while IFS= read -r line; do
        # 每行数据加前缀
        echo "数据: $line" >> processed_input.txt
    done < input.txt
    
    echo "Bash文件处理完成!"
    echo "处理结果已保存到 processed_input.txt"
else
    echo "Bash: 输入文件不存在"
fi