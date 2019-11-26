function [p1, p2, p3] = pair_count_measure(Y, C)
    n = length(Y);
    pairs_class_same = 0;
    pairs_class_diff = 0;
    p1 = 0;
    p2 = 0;
    for i = 1:n
        for j = i+1:n
            if Y(i) == Y(j)
                pairs_class_same = pairs_class_same+1;
                if C(i) == C(j)
                    p1 = p1+1;
                end
            else
                pairs_class_diff = pairs_class_diff+1;
                if C(i) ~= C(j)
                    p2 = p2+1;
                end
            end
        end
    end
    p1 = p1/pairs_class_same;
    p2 = p2/pairs_class_diff;
    p3 = (p1+p2)/2;
end