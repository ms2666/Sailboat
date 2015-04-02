function [ trimmedMatrix, numNodes ] = removeLandNodes(nodeMatrix, numNodes)

% initialize new column in nodeMatrix
nodeMatrix = [nodeMatrix (landmask(nodeMatrix(:, 2), nodeMatrix(:, 3)))];

% set 4th column to whether or not the node is on land
% nodeMatrix(:, 4) = landmask(nodeMatrix(:, 2), nodeMatrix(:, 3));

% conditions for keeping a node
target = (nodeMatrix(:, 4) == 0);
trimmedMatrix = nodeMatrix(target, :);

% set numNodes to a value
numNodes = size(trimmedMatrix, 1);

end

