function [ finalS, finalD ] = closestNodes3D( trueSource, trueDest, nodeMatrix )
% estimates node locations

% get list of possible latitudes and longitudes
possibleLats = nodeMatrix(:, 2);
possibleLons = nodeMatrix(:, 3);
% get list of current latitudes and longitudes
lats = [trueSource(1) trueDest(1)];
lons = [trueSource(2) trueDest(2)];

% get index of closest matches in possible latitudes and longitudes
latInd = knnsearch(possibleLats, lats');
lonInd = knnsearch(possibleLons, lons');

% get actual latitudes and longitudes
targetLats = [possibleLats(latInd(1)) possibleLats(latInd(2))];
targetLons = [possibleLons(lonInd(1)) possibleLons(lonInd(2))];

% search for latitudes and longitudes in nodeMatrix
for i = 1:size(nodeMatrix, 1)
    if (nodeMatrix(i, 2) == targetLats(1) && nodeMatrix(i, 3) == targetLons(1))
        finalS = i;
    end
    
    if (nodeMatrix(i, 2) == targetLats(2) && nodeMatrix(i, 3) == targetLons(2))
        finalD = i;
    end
end
end