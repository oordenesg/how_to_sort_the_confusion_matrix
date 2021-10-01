# how_to_sort_the_confusion_matrix

A common question on any test when you are learning data science is "Order the confusion matrix using your own function." While the problem seems fairly straightforward, this is not entirely so. Functional programming can be an option, but personally, I prefer to use optimization to solve this problem. Using transport problem logic, creating a function to order a confusion matrix is a fairly straightforward task. In this repository the code is attached.

Currently my solution is in R. But soon I will upload the same solution using Python. In R, you only need the LpSolve library to be able to use this function. 

## The confusion matrix
In the field of artificial intelligence and machine learning, a confusion matrix is a tool that allows visualizing the performance of a supervised learning algorithm. Each column of the matrix represents the number of predictions of each class, while each row represents the instances in the real class. go through the learning process with data.

Let's think about an algorithm that allows us to classify covid19 patients as positive and negative:

In this example we have a group of 100 patients of which there are 45 who do have the virus and 55 who do not.
Our supervised classification algorithm will help us determine the% success rate of our tests.

We carry out the respective tests on the patients and in this way, we could compare the results of the real model with the predictive model:

The following 4 options are what make up what is known as the confusion matrix:

(in this case being only two possibilities: positive or negative or class 1 and class 2 we are talking about a binary matrix), therefore the four options derived from our example would be:

Person who has covid19 and the model classified it as covid19 (+). This would be a true positive or TP.
Person who does not have covid19 and the model classifies it as covid19 (-). This would be a true negative or a TN.
Person who has covid19 and the model classified it as covid19 (-). This would be a type II error or false negative or FN.
Person who does not have covid19 and the model classified it as covid19 (+). This is a type I error, or false positive, or FP.
