% MATLAB - 矩阵运算
try
    % 读取输入文件
    fid = fopen('input.txt', 'r');
    data = textscan(fid, '%f %f');
    fclose(fid);
    
    a = data{1};
    b = data{2};
    
    % 确保是列向量
    a = a(:);
    b = b(:);
    
    % 创建矩阵并计算
    if length(a) >= 2 && length(b) >= 2
        % 创建矩阵
        M = [a(1:2), b(1:2)];
        
        output = "MATLAB矩阵运算:\n";
        
        % 矩阵转置
        output = [output sprintf("矩阵M:\n")];
        for i = 1:size(M, 1)
            output = [output sprintf("  %.2f  %.2f\n", M(i,1), M(i,2))];
        end
        
        % 矩阵乘法
        if length(a) >= 4 && length(b) >= 4
            A = [a(1), a(2); a(3), a(4)];
            B = [b(1), b(2); b(3), b(4)];
            C = A * B;
            
            output = [output sprintf("\n矩阵乘法 A * B:\n")];
            for i = 1:2
                output = [output sprintf("  %.2f  %.2f\n", C(i,1), C(i,2))];
            end
        end
        
        % 行列式
        detM = det(M);
        output = [output sprintf("\n矩阵M的行列式: %.4f\n", detM)];
        
        % 写入输出文件
        fid = fopen('output.txt', 'a');
        fprintf(fid, '%s\n\n', output);
        fclose(fid);
        
        fprintf('MATLAB矩阵运算完成!\n');
    else
        fprintf('MATLAB: 数据不足进行矩阵运算\n');
    end
catch e
    fprintf('MATLAB错误: %s\n', e.message);
end