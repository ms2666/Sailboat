function [ finalS, finalD ] = closestNodes3D( trueSource, trueDest, nodeMatrix )
% estimates node locations

% possible latitudes and longitudes
possibleCoords = nodeMatrix(:, 2:3);
% current latitudes and longitudes
currentCoords = [trueSource; trueDest];

% perform k nearest members search on coordinates
answer = knnsearch(possibleCoords, currentCoords);

% compute final source and destination
finalS = answer(1); finalD = answer(2);
end