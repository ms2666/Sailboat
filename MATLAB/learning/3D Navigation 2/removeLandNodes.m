function [ trimmedMatrix, numNodes ] = removeLandNodes(nodeMatrix)

% disp(source)
% disp(dest)

% conditions for keeping a node
condition1 = (nodeMatrix(:, 4) == 0);
% condition2 = (nodeMatrix(:, 1) == source);
% condition3 = (nodeMatrix(:, 1) == dest);
% combine the conditions
% target = condition1 | condition2 | condition3;
target = condition1;

trimmedMatrix = nodeMatrix(target, :);
numNodes = size(trimmedMatrix, 1);

end

