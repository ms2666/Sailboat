function [ path ] = genPath( nodeMatrix, sourceNode, destNode, resolution )
% adjMat is a sparse matrix, source and destination are nodes (they're just integers)

sparseAdjMat = genAdjMatrix(nodeMatrix, resolution);

% swap the source and destination if source > destination
if sourceNode > destNode
    temp = sourceNode;
    sourceNode = destNode;
    destNode = temp;
end

% calculate shortest path
[~, path, ~] = graphshortestpath(sparseAdjMat, sourceNode, destNode);
end