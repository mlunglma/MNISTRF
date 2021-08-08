%Testing a learned random forest on MNIST test data
% This is free and unencumbered software released into the public domain.

% Anyone is free to copy, modify, publish, use, compile, sell, or
% distribute this software, either in source code form or as a compiled
% binary, for any purpose, commercial or non-commercial, and by any
% means.

% In jurisdictions that recognize copyright laws, the author or authors
% of this software dedicate any and all copyright interest in the
% software to the public domain. We make this dedication for the benefit
% of the public at large and to the detriment of our heirs and
% successors. We intend this dedication to be an overt act of
% relinquishment in perpetuity of all present and future rights to this
% software under copyright law.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
% MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
% IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
% OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
% ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
% OTHER DEALINGS IN THE SOFTWARE.

% For more information, please refer to <http://unlicense.org/>

filenameImagesTest  = './mnist/t10k-images.idx3-ubyte';
filenameLabelsTest  = './mnist/t10k-labels.idx1-ubyte';

XTest  = processImagesMNIST(filenameImagesTest);
YTest  = processLabelsMNIST(filenameLabelsTest);

VectorizedXTest = reshape(XTest,28*28,10000);

clear XTest;      % VectorizedXTest will be used further, no need to keep this in memory

% load Tree - variables: TreeCoords, TreeSplit
load('TreeData.mat')

disp('Testing...')
YTreeAll = DoTreeInference(VectorizedXTest', TreeCoords, TreeSplit);
YTree = mode(round(YTreeAll),2); % mode returns element that appears most
YTree = YTree-1; % compensate for +1 (such that classes start from 0 now)

PercTruePos = sum(YTree == YTest)/UseNDataForTesting
