function [ path ] = genPath( nodeMatrix, points, resolution )
% adjMat is a sparse matrix, source and destination are nodes (they're just integers)

sourceNode = points(1);
destNode = points(2);

sparseAdjMat = genAdjMatrix(nodeMatrix, resolution);
% global x
% x = sparseAdjMat;

% swap the source and destination if source > destination
if sourceNode > destNode
    temp = sourceNode;
    sourceNode = destNode;
    destNode = temp;
end

% calculate shortest path
[~, path, ~] = graphshortestpath(sparseAdjMat, sourceNode, destNode);
end