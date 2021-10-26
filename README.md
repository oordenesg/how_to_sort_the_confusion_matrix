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

## What technique can we use to solve this problem?

We can use the Hungarian method. The aim of this method is to find the minimum cost of a set of tasks that must be carried out by the most suitable people.
It uses linear programming (PL) to perform a series of steps that can be automated. Thus, tools such as the statistical software R (among others) have several very useful packages for these optimization problems.

The steps to follow allow to carry out the Hungarian method in a simple way using a spreadsheet. In addition, this scheme that we show will allow us to see in a global way the process that we will develop in detail in the final example.

- As preliminary steps, you have to assign people (rows) to a series of projects (columns). In addition, it is necessary to calculate the different costs of each project depending on who carries it out and build a matrix (C) with this information.
- In the matrix (C) we look for the minimum value of each row. We subtract this from all the elements in the row and perform the same operation with the columns. A new matrix (C) will appear with the results of the previous operations.
- Next we create the «graph of equalities», which allows us to choose the tasks and projects with the lowest cost. The optimum would be those elements whose result was zero. If it is true that there is no element with a zero value assigned to more than one row, the algorithm ends.
- If not, a new assignment must be made. A new matrix is made to which a series of modifications are applied, as we will see in the example. We recreate the graph and continue until we have a matrix that has at least one zero in each row and in non-repeating positions.
- With this information we already have the people and projects assigned (the zeros) that optimize the problem. If a task is already assigned in a previous row, it is discarded in the next. To calculate the minimum cost we add the costs of the initial matrix that appear in the position of these zeros.
