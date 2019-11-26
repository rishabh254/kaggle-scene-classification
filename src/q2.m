trainX = load('hw5data/digit/digit.txt');
trainY = load('hw5data/digit/labels.txt');


% Question 2.5.1 - 2.5.2
iter_6=0;
fprintf('\n---------------\nQuestion 2.5.1\n---------------\n');
for k = 2:2:6
    [C, mu, i]   = kmeans(trainX, k, false);
    sos          = within_group_sum_of_squares(trainX, C, mu);
    [p1, p2, p3] = pair_count_measure(trainY, C);
    fprintf('k : %d \n total within group sum of squares : %d \n(p1,p2,p3)=(%d,%d,%d)\n\n',k,sos,p1,p2,p3);
    iter_6       = i;
end

fprintf('\n---------------\nQuestion 2.5.2\n---------------\n');
fprintf('No of iterations for k=6 : %d\n',iter_6);


% Question 2.5.3 - 2.5.4
% for k = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
% A plot of the total within group sum of squares versus k
% A plot of p1, p2, p3 versus k
no_runs = 10;
sos_avg = zeros(1,10);
p1_avg  = zeros(1,10);
p2_avg  = zeros(1,10);
p3_avg  = zeros(1,10);
for k = 1:10
    for i = 1:no_runs
        [C, mu, iter] = kmeans(trainX, k,true);
        sos = within_group_sum_of_squares(trainX, C, mu);
        [p1, p2, p3] = pair_count_measure(trainY, C);
        sos_avg(k) = sos_avg(k) + sos;
        p1_avg(k)  = p1_avg(k)  + p1;
        p2_avg(k)  = p2_avg(k)  + p2;
        p3_avg(k)  = p3_avg(k)  + p3;
    end
end
sos_avg = sos_avg/no_runs;
p1_avg  = p1_avg/no_runs;
p2_avg  = p2_avg/no_runs;
p3_avg  = p3_avg/no_runs;


%plot(sos_avg,'-o');
plot(p1_avg,'r-v');
%title('Total within group sum of squares')
xlabel('k')
xlim([1 10])
hold on;
plot(p2_avg,'g-^');
plot(p3_avg,'b-*');
legend('p1','p2','p3');
grid on
hold off;