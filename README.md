# MNISTRF

Matlab files for testing a Random Forest that directly operates on MNIST data (without any pre-processing) achieving 96% detection rate. The random forest was learned with a CART-like procedure without any pruning and growing binary trees up to a pre-defined height. At each split only square root of the number of available coordinates have been allowed to be used (selected at random). 

Requires the MNIST test data set from: http://yann.lecun.com/exdb/mnist/
and the functions: processImagesMNIST and processLabelsMNIST from the Matlab example: "Train Variational Autoencoder (VAE) to Generate Images" https://de.mathworks.com/help/deeplearning/ug/train-a-variational-autoencoder-vae-to-generate-images.html

The mat-file: TreeData.mat contains the tree variables: TreeCoords and TreeSplit that are processed by DoTreeInference.

The testing process is started by running TestMNISTRF.m
