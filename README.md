# kaggle-scene-classification
Implementing k-means algorithm from scratch, testing it on digit data. Further, using it to learn visual vocabulary for scene representation and then using LibSVM with RBF kernel to classify scenes from the popular Tv Series- The Big Bang Theory

To know more about the competition please follow the link: 
https://www.kaggle.com/c/cse512-hw5

# Data:
1. There are two files with the data. The first digit.txt contains the 1000 observations of 157 pixels
(a subset of the original 785) from images containing handwritten digits. The second file labels.txt
contains the true digit label (either 1, 3, 5, or 7).
Please note that there aren’t IDs for the digits. Please assume the first line is ID 1, the second line is ID
2, and so on. The labels correspond to the digit file, so the first line of labels.txt is the label for the digit in
the first line of digit.txt.

2. Training and test images are to be included in the subdirectory bigbangtheory (Due to constraints, I haven't uploaded them here, feel free to email me if you need the images). The training image ids and
labels are given in train.mat. This file contains two variables: imgIds and lbs. imgIds is a column
vector and each row has a name of image in the training set. lbs is a matrix denoting the label for the
image with the corresponding index. There are total 8 classes for the dataset: living room (1), kitchen (2),
hallway (3), Penny’s living room (4), cafeteria (5), Cheesecake factory (6), laundry room (7), and comic
bookstore (8). <br>
Validation set is not provided for this question. You have to do cross validation to find the parameter for
the best performance. You can implement cross validation by yourself, or you can use LibSVM functionality.
Image ids for test set are given in test.mat.

# Install:

# Dependencies:
Download LibSVM [https://www.csie.ntu.edu.tw/˜cjlin/libsvm/]. Follow the instruction in README to install LibSVM for Matlab. Two main functions of LibSVM that you should
pay attention to are: svmtrain and svmpredict. Note that Matlab also has a machine learning toolbox
that comes with these two functions with exactly the same names. However, Matlab’s SVM implementation is not as good as LibSVM, so you need to make sure that you are using svmtrain and svmpredict from
LibSVM. To check if you have installed the program correctly, in Matlab do: <br>
* which svmtrain
* which svmpredict
Matlab should return the paths to the svmtrain and svmpredict of LibSVM. To learn how to use these
functions, type the names of the function in Matlab: <br>
* svmtrain
* svmpredict

# Code:
[HW5_BoW.m](https://github.com/rishabh254/kaggle-scene-classification/blob/master/src/HW5_BoW.m) : contains helper functions to learn visual vocabulary for scene representation and to compute feature vectors. <br />
[cmpExpX2Kernel.m](https://github.com/rishabh254/kaggle-scene-classification/blob/master/src/cmpExpX2Kernel.m) : takes train and test data and the kernel parameter gamma and return the train and test kernels. <br />
[kmeans.m](https://github.com/rishabh254/kaggle-scene-classification/blob/master/src/kmeans.m) : contains implementation of k-means algorithm. <br />
[pair_count_measure.m](https://github.com/rishabh254/kaggle-scene-classification/blob/master/src/pair_count_measure.m) : contains evaluation metric for how well the clusters are formed. <br />
[within_group_sum_of_squares.m](https://github.com/rishabh254/kaggle-scene-classification/blob/master/src/within_group_sum_of_squares.m) : contains evaluation metric for how well the clusters are formed. <br />
