# how_to_sort_the_confusion_matrix

A common question on any test when you are learning data science is "Order the confusion matrix using your own function." While the problem seems fairly straightforward, this is not entirely so. Functional programming can be an option, but personally, I prefer to use optimization to solve this problem. Using transport problem logic, creating a function to order a confusion matrix is a fairly straightforward task. In this repository the code is attached.

Currently my solution is in R. But soon I will upload the same solution using Python. In R, you only need the LpSolve library to be able to use this function. 

## The confusion matrix
In the field of artificial intelligence and machine learning, a confusion matrix is a tool that allows visualizing the performance of a supervised learning algorithm. Each column of the matrix represents the number of predictions of each class, while each row represents the instances in the real class. go through the learning process with data.
