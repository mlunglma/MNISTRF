function y = DoTreeInference(x, TreeCoords, TreeSplit)
% function y = DoTreeInference(x, TreeCoords, TreeSplit)
% allows to perform tree inference of multiple samples as well as on multiple trees
% coordinates are in columns of x
% TreeCoords has to be of lenght 2^(integer)-1 and TreeSplit of lenght 2^(integer+1)-1

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

nSamples = size(x,1);
nTrees = size(TreeCoords,2);

TreeLen = size(TreeCoords,1);

TreeDepth = ceil(log2(TreeLen));

assert(TreeLen == 2^TreeDepth-1,'TreeLen != 2^TreeDepth-1!!!');
assert(size(TreeSplit,1)==2^(TreeDepth+1)-1,'length(TreeSplit)!=2^(TreeDepth+1)-1!!!');

NodeIdx = ones(nSamples,nTrees);
for i=0:TreeDepth-1
  NodeIdx = NodeIdx*2 + (x(sub2ind(size(x),(1:nSamples)'*ones(1,nTrees),TreeCoords(sub2ind(size(TreeCoords), NodeIdx,ones(nSamples,1)*(1:nTrees) )))) > TreeSplit(sub2ind(size(TreeSplit),NodeIdx,ones(nSamples,1)*(1:nTrees))));
end

y = TreeSplit(sub2ind(size(TreeSplit), NodeIdx,ones(nSamples,1)*(1:nTrees)));
