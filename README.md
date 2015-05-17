Shiny application illustrating the k-means clustering method

author: Renaud DUFOUR
Date: May 2015

* Acess the application [here](https://duf59.shinyapps.io/shiny-kmeans/)
* A short slidify presentation of the project [here](http://rpubs.com/duf59/kmeansShinyApp)

## What is k-means clustering ?

* K-means is a distance-based method for cluster analysis in data mining
* It enables partitioning a set of data points into groups which are as similar as possible
* Each group, called cluster, is represented by its center

# Algorithm  
  
Given K, the number of clusters, k-means clustering works as follows:

* Select K points as initial centroids
* __Repeat__
    * Form K clusters by assigning each point to its closest centroid
    * Re-compute the centroids of each cluster
* __Until__ convergence criterion is satisfied
* Different kinds of measures can be used (L1 norm, L2 norm, cosine similarity, ...)

## The Shiny App

* Illustrates K-mean clustering based on 2 datasets:
    * the R built in __iris__ dataset
    * a dataset __dat1__ involving embedded clusters
* Enables to change the following parameters:
    * dataset to be used
    * variables on which the clustering is to be performed (note: 2D clustering only)
    * number of clusters
    * type of kernel : linear or radial (RBF)
* When using a non-linear kernel, the datapoints are first projected into the kernel space before clustering is performed.

## Further improvements

* More informations on the K-means algorithm on [wikipedia](http://en.wikipedia.org/wiki/K-means_clustering). I also recommend the [Cluster Analysis In Data Mining](https://www.coursera.org/course/clusteranalysis) class on Coursera, which actually inspired me this app.
* Potential improvements include :
    * using interactive graphics (rchart, googleVis)
    * computing clustering validation measures such as purity or normalized mutual information. Note that such external measures require knowing the true classes of the data points, which is the case for the 2 implemented datasets but not in general. Instead one could also consider internal measures such as Beta CV.
    * Implementing other kernels and allow user to tune kernel parameters (actually parameter of RBF kernel is internally determined using an heuristic approach)
    * Implementing alternative clustering techniques like k-medians or k-medoids
* Feel free to [contact](renaud.dufour59@gmail.com) me for any question or suggestion !