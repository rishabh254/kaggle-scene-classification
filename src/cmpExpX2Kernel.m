% 3.4.4
function [trainK, testK] = cmpExpX2Kernel(trainD, testD, gamma)

    n = size(trainD,1);
    m = size(testD,1);
    testK  = compute(testD,trainD, gamma, m, n);
    trainK = compute(trainD,trainD, gamma, n, n);
end  

function dfK = compute(df,trainD,gamma,m,n)
    dfK = [];
    for i = 1:m
        %disp(i);
        x = df(i, :);
        kernel_i = zeros(1,n);
        for j = 1:n
            y = trainD(j, :);
            kernel_ij = chi_sq(x, y, gamma);
            kernel_i(j) = kernel_ij;
        end
        dfK = [dfK; kernel_i];
    end
    dfK = [(1:m)', dfK];
    dfK = double(dfK);
end

function kernel = chi_sq(x, y, gamma)
    d = length(x);
    kernel = 0;
    for i = 1:d
        kernel = kernel + (x(i)-y(i))^2/(x(i)+y(i)+eps('single'));
    end
    kernel = exp((-1/gamma)*kernel);
end
