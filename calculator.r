# R - 统计计算
input_data <- readLines("input.txt")
input_data <- input_data[input_data != ""]  # 移除空行

if (length(input_data) > 0) {
  numbers <- as.numeric(unlist(strsplit(input_data, "\\s+")))
  numbers <- numbers[!is.na(numbers)]
  
  if (length(numbers) > 0) {
    stats_summary <- paste(
      "R统计分析:\n",
      "  数据个数: ", length(numbers), "\n",
      "  总和: ", sum(numbers), "\n",
      "  平均值: ", mean(numbers), "\n",
      "  中位数: ", median(numbers), "\n",
      "  标准差: ", sd(numbers), "\n",
      "  最小值: ", min(numbers), "\n",
      "  最大值: ", max(numbers), "\n",
      sep = ""
    )
    
    # 追加到输出文件
    write(stats_summary, file = "output.txt", append = TRUE)
    write("\n", file = "output.txt", append = TRUE)
    
    cat("R统计分析完成!\n")
  } else {
    cat("R: 没有有效数据\n")
  }
} else {
  cat("R: 输入文件为空\n")
}