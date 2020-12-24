function [grad] = Filter_1(I,operator,option)
% Kirsch算子初始化
Kirsch(:, :, 1) = [-5 3 3; -5 0 3; -5 3 3];
Kirsch(:, :, 2) = [3 3 3; -5 0 3; -5 -5 3];
Kirsch(:, :, 3) = [3 3 3; 3 0 3; -5 -5 -5];
Kirsch(:, :, 4) = [3 3 3; 3 0 -5; 3 -5 -5];
Kirsch(:, :, 5) = Kirsch(:, :, 3)';
Kirsch(:, :, 6) = Kirsch(:, :, 2)';
Kirsch(:, :, 7) = Kirsch(:, :, 1)';
Kirsch(:, :, 8) = [-5 -5 3; -5 0 3; 3 3 3];
% Sobel算子初始化
Sobel(:, :, 1) = [-1, -2, -1; 0, 0, 0; 1, 2, 1];%第一个分量
Sobel(:, :, 2) = Sobel(:, :, 1)';%第二个分量(第一个转置)

if operator == 0
    gradx = conv2(I, Sobel(:, :, 1), 'same');  %二维矩阵卷积运算 
    gradx = abs(gradx); %absolute，取绝对值
    grady = conv2(I, Sobel(:, :, 2), 'same');   
    grady = abs(grady); 
    if option == 0
        grad = max(gradx, grady);
    else
        grad = gradx + grady;
    end
    grad = mat2gray(grad);        % 归一化，不至于超出范围
else
    grad = zeros(size(I));
    for i=1:8
    gradi = conv2(I, Kirsch(:, :, i), 'same'); 
    gradi = abs(gradi);  
    grad = max(grad, gradi);
    end
    grad = mat2gray(grad);
end

end
