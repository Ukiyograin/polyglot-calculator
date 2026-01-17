<?php
// PHP - 阶乘计算
function factorial($n) {
    if ($n <= 1) return 1;
    return $n * factorial($n - 1);
}

try {
    $lines = file('input.txt', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    $output = "PHP阶乘计算:\n";
    
    foreach ($lines as $index => $line) {
        $numbers = array_map('intval', explode(' ', trim($line)));
        if (count($numbers) >= 2) {
            $a = abs($numbers[0]) % 10; // 限制大小避免溢出
            $b = abs($numbers[1]) % 10;
            $factA = factorial($a);
            $factB = factorial($b);
            $output .= sprintf("行%d: %d! = %d, %d! = %d\n", 
                $index + 1, $a, $factA, $b, $factB);
        }
    }
    
    file_put_contents('output.txt', $output . "\n", FILE_APPEND);
    echo "PHP阶乘计算完成!\n";
} catch (Exception $e) {
    echo "PHP计算错误: " . $e->getMessage() . "\n";
}
?>