function [weight] = calculateWeight(nodeMatrix, r, c)
% just calculate distance for now
xDiff = nodeMatrix(r, 2) - nodeMatrix(c, 2);
yDiff = nodeMatrix(r, 3) - nodeMatrix(c, 3);
weight = sqrt(yDiff^2 + xDiff^2);

% weight = 100000*rand*weight;
end