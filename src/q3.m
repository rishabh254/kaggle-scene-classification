% Call this for first execution to calculate trD and tstD feature vectors
%[trD,tstD] = HW5_BoW.main();

[trIds, trLbs] = ml_load('hw5data/bigbangtheory_v3/train.mat',  'imIds', 'lbs');
% Used saved variables in further executions
load('trD');
load('tstD');

%3.4.2 Using SVM with RBF kernel, report the 5-fold cross-validation 
% accuracy for the default kernel parameters for C and ?
cv_accuracy_default = svmtrain(trLbs, trD, '-v 5');

%3.4.3 Tune C and ? for SVM with RBF kernel using 5-fold cross validation
% Soln doing a binary search over exponents of 2 for both C and G.
C = [1, 2, 4, 8, 16, 32, 64, 128, 256];
G = [1, 2, 4, 8, 16, 32, 64, 128, 256];
%C = [10:5:300];
%G = [15];

cv_results = zeros(size(C));

for i = 1:length(C)
    for j = 1:length(G)
        options = sprintf('-c %d -g %d -v 5 -q', C(i), G(j));
        cv_accuracy = svmtrain(trLbs, trD, options);
        cv_results(i,j) = cv_accuracy;
        fprintf(' options = %s', options);
    end
end

load('3.3.mat');
%--------------------------------------------------------------
%--------------------------------------------------------------

%3.4.5
C = [1, 2, 4, 8, 16, 32, 64, 128, 256];
G = [1, 2, 4, 8, 16, 32, 64, 128, 256];
cv_results1 = zeros(size(C));


for j = 1:length(G)
    disp(j);
    [trainK] = cmpExpX2Kernel(trD,'skiptest', G(j));
    for i = 1:length(C)
        options = sprintf('-c %d -g %d -t 4 -v 10 -q', C(i), G(j));
        cv_accuracy = svmtrain(trLbs, trainK, options);
        cv_results(i,j) = cv_accuracy;
        fprintf(' options = %s', options);
    end
end



%3.4.6 Use your model to predict on the test set
tstIds = ml_load('hw5data/bigbangtheory_v3/test.mat', 'imIds'); 
tstLbs = rand(size(tstIds'));

C = 100;
gamma = 5;

%[trainK, testK] = cmpExpX2Kernel(trD, tstD, gamma);
load('trainK');
load('testK');

% use this to get model
options = sprintf('-c %d -g %d -t 4',C,gamma);

% use this to check accuracy
options = sprintf('-c %d -g %d -t 4 -v 5',C, gamma);

model = svmtrain(trLbs, trainK, options);
[preds] = svmpredict(tstLbs, testK, model);