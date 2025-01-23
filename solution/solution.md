# Daily Challenge, but MoonBit

Back to [README](../README.md).

## 1. Find the Unique Number

Problem Link: https://oj.moonbitlang.com/problems/202412-001-find-the-unique-number

### Solution:

Due to the reflexivity of XOR operation, the result of any integer `x XOR x` is 0.

Thus, if we XOR all the numbers together, the result will exactly be the number which occurs only once in the array.

## 2. Supply Problem in Hiking

Problem Link: https://oj.moonbitlang.com/problems/202412-002-supply-problem-in-hiking

### Solution:

There is no greedy strategy to solve this problem. If you are familiar with the knapsack problem, you will soon notice that they are similar. Thus, let's use dynamic programming to solve it. (If you are not familiar with the knapsack problem, I recommend learning about it first, as the following content may be difficult to understand otherwise.)

First, we need to define the state. Let f(i, j) represent the minimum cost when you have j units of food in the i-th day after consuming the food for that day.

Next, consider how to transition between states:
* **We don't buy anything in the i-th day**: f(i, j) <- f(i - 1, j + 1). In this case, the number of food will decrease by 1 because we consume 1 unit of food in the -th day.
* **We buy only 1 unit of food**: f(i, j) <- f(i - 1, j) + price(i).
* **Enumerate x from 2 to k, we buy x units of food**: f(i, j) <- f(i - 1, j + x - 1) + x * price(i).

Notice that the time complexity for this algorithm is O(n^3), because the third transistion requires O(n) for all nxk states. However, We cannot execute an algorithm with O(n^3) complexity within 1 second when n = 1000. How to optimize it?

Observe that we can compute f(i, j) iteratively from f(i, j - 1) due to the relationship f(i, j) = f(i, j - 1) + price(i). This allow us to reduce the time complexity of the third transition from O(n) to O(1). Then, the overall complexity becomes O(n^2).

Btw, carefully check the boundary conditions! ^_^
