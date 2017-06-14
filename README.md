# SankeyTree

This is a Machine learning and visualization project that determines the legitimacy of German bank notes. My main goal of this project was to develope an intuitive way to view the results of a machine learning algorithm. This project was inspired by the [sankey diagram](http://blockbuilder.org/mbostock/ca9a0bb7ba204d12974bca90acc507c0) and based on the collapsible tree code from [Mike Stockton's block](https://bl.ocks.org/mbostock/4339083). 

### Dataset and Tree Construction

The dataset for this project was found on [CI's Machine Learning Respository](https://archive.ics.uci.edu/ml/datasets/banknote+authentication). Per UCI's description:

> Data were extracted from images that were taken from genuine and forged banknote-like specimens. For digitization, an industrial camera usually used for print inspection was used. The final images have 400x 400 pixels. Due to the object lens and distance to the investigated object gray-scale pictures with a resolution of about 660 dpi were gained. Wavelet Transform tool were used to extract features from images.

The attributes extracted for each banknote are:

1. **variance** of Wavelet Transformed image (continuous) 
2. **skewness** of Wavelet Transformed image (continuous) 
3. **curtosis** of Wavelet Transformed image (continuous) 
4. **entropy** of image (continuous) 
5. **class** (integer) 

Using the [ctree package](https://cran.r-project.org/web/packages/partykit/vignettes/ctree.pdf) in R predicts the targer class with an accuracy of 95% with virutally no preprocessing on my end. So my main task is to visualize this tree. I chose to prune this tree to only be 3 layers deep to make my visual less visually cluttered. Then, I extracted the pruned information from my decision tree to a JSON file. 

Additionally, for every non-leaf node, I made a histogram in R to show the distributions of both classes to the left and the right of the split. I thought that this supplementary image could show the reasoning behind why a split occurs. I uploaded this histograms as images online and added the URLs to the JSON file.

### Visualizing the Tree

I went into this project as a Javascript novice, so I spent a decent amount of time trying to create the sankey-inspired visual I imagined. Luckily, the underlying tree stucture was taken care of using 
`d3.layout.tree()`. For every node, I created a rectangle for each class with widths that scaled with the proporation of each class. 

The most difficult part of this project was creating paths that would link the nodes. The paths needed travel from the child to the parent, with the same width of the child. Since every parent node has 2 children, that means every parent node has (2 *children*)x(2 *classes per child*) = 4 *incoming paths*. These paths need to avoid overlap if possible and allign so that they fill up the two parent rectangles. I accomplished this through a bit of complicated arithmatic and the `d3.svg.line().interpolate('basis');` function. 




