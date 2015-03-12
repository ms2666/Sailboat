function [ path, sparseAdjMat ] = genPath( nodeMatrix, source, destination, resolution )
% adjMat is a sparse matrix, source and destination are nodes (they're just integers)

sparseAdjMat = genAdjMatrix(nodeMatrix, resolution);

% swap the source and destination if source > destination
if source > destination
    temp = source;
    source = destination;
    destination = temp;
end

% calculate shortest path
[~, path, ~] = graphshortestpath(sparseAdjMat, source, destination);
end