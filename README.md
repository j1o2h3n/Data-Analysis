# Data-Analysis
Data analysis experiment (R realization).

We preprocess the data first to clean dirty data. Then analyze the data. The analysis methods include: regression analysis, principal component analysis, factor analysis, and cluster analysis. The programming code is implemented in R.

<p align="center">
  <img width="922" height="494" src=./fig/picture.jpg>
</p>

## Data Set Information:
This data comes from a water quality study where samples were taken from sites on different European rivers of a period of approximately one year. These samples were analyzed for various chemical substances including: nitrogen in the form of nitrates, nitrites and ammonia, phosphate, pH, oxygen, chloride. In parallel, algae samples were collected to determine the algae population distributions.

The competition involved the prediction of algal frequency distributions on the basis of the measured concentrations of the chemical substances and the global information concerning the season when the sample was taken, the river size and its flow velocity. 

There are a total of 340 examples each containing 17 values. The first 11 values of each data set are the season, the river size, the fluid velocity and 8 chemical concentrations which should be relevant for the algae population distribution. The last 8 values of each example are the distribution of different kinds of algae.

This data set was used in the COIL International Data Analysis Competition in 1999. The detailed information of this data set can be obtained from the UCI Machine Learning Database (http://archive.ics.uci.edu/ml/datasets/Coil+1999+Competition+Data).

## Lsit
- Analysis.txt (Data set)
- test_2.R (Preprocessing code)
- test_3.R (Regression analysis code)
- test_4.R (Principal component analysis code)
- test_5.R (Factor analysis code)
- test_6.R (Cluster analysis code)
