function [C_new, mu, iterations] = kmeans(X, k, rand_init)
    if(rand_init)
        %Step 1 Taking k random centers
        perm = randperm(size(X,1), k);
        mu = X(perm,:);
    else
       %Step 1 Taking first k points in dataset as centers
       mu = X(1:k, :);
    end
    
    max_iterations = 20;
    C_old  = [];
    for iterations = 1:max_iterations
        %fprintf('Iteration : %d\n', iterations);
        C_new = assignClusters(X, mu);  
        mu    = recenter(X, C_new); 
        % convergence reached if C doesn't update
        if (isequal(C_old, C_new))
            return
        else
            C_old = C_new;
        end
    end
end

%Step 2. Assign each data point to the cluster 
%associated with the nearest of the k center points
function C = assignClusters(X, mu)
    k = size(mu,1);
    n = size(X,1);
    C = ones(n,1);
    for i = 1:n
        min_dist = inf;
        label = 1;
        for j = 1:k
            diff = X(i, :) - mu(j, :);
            dist = sqrt(diff*diff');
            %dist1 = pdist([X(i,:);mu(j,:)],'euclidean');
            if dist < min_dist
                min_dist = dist;
                label = j;
            end
        end
        C(i) = label;
    end
end

%Step 3. Re-calculate the centers as the
%mean vector of each cluster from (2).
function mu = recenter(X, C)
    k = length(unique(C));
    [n, d] = size(X);
    mu = zeros(k,d);
    mu_freq = zeros(k,1);
    for i = 1:n
        mu(C(i),:) = mu(C(i),:) + X(i,:);
        mu_freq(C(i)) = mu_freq(C(i)) +1;
    end
    for i = 1:k
        mu(i,:) = mu(i,:)/mu_freq(i);
    end
end