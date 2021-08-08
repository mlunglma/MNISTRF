# MNISTRF

Matlab files for testing a Random Forest that directly operates on MNIST data (without any pre-processing) achieving 96% detection rate.

Requires the MNIST test data set from: http://yann.lecun.com/exdb/mnist/
and the functions: processImagesMNIST and processLabelsMNIST

from the Matlab example: "Train Variational Autoencoder (VAE) to Generate Images" 
https://de.mathworks.com/help/deeplearning/ug/train-a-variational-autoencoder-vae-to-generate-images.html

The mat-file: TreeData.mat contains the tree variables: TreeCoords and TreeSplit that are processed by DoTreeInference.
