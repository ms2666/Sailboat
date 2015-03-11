function [finalS, finalD] = getNodes(trueSource, trueDestination, nodeMatrix)
% estimates node locations

possibleXs = nodeMatrix(:, 2);
possibleYs = nodeMatrix(:, 3);

Xs = [trueSource(2) trueDestination(2)];
Ys = [trueSource(1) trueDestination(1)];

xInd = knnsearch(possibleXs, Xs');
yInd = knnsearch(possibleYs, Ys');

Xs = nodeMatrix(xInd, 2);
Ys = nodeMatrix(yInd, 3);

for i = 1:size(nodeMatrix, 1)
    if (nodeMatrix(i, 2) == Xs(2)) && (nodeMatrix(i, 3) == Ys(2))
        finalD = i;
    end
    
    if (nodeMatrix(i, 2) == Xs(1)) && (nodeMatrix(i, 3) == Ys(1))
        finalS = i;
    end
end
    
end