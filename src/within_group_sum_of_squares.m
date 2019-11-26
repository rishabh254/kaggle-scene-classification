function sos = within_group_sum_of_squares(X, C, mu)
    n   = size(X,1);
    sos = 0;
    for i = 1:n
        diff = X(i,:) - mu(C(i),:);
        sos = sos + (diff*diff');
    end
end

