#!/usr/bin/perl
# Perl - 最大值查找
use strict;
use warnings;

sub max {
    my ($a, $b) = @_;
    return $a > $b ? $a : $b;
}

open(my $in, '<', 'input.txt') or die "无法打开输入文件: $!";
my @lines = <$in>;
close($in);

my $output = "Perl最大值查找:\n";
my $line_num = 1;

foreach my $line (@lines) {
    chomp $line;
    my @numbers = split(/\s+/, $line);
    if (@numbers >= 2) {
        my $max_val = max($numbers[0], $numbers[1]);
        $output .= "行$line_num: max($numbers[0], $numbers[1]) = $max_val\n";
    }
    $line_num++;
}

open(my $out, '>>', 'output.txt') or die "无法打开输出文件: $!";
print $out $output . "\n";
close($out);

print "Perl最大值查找完成!\n";