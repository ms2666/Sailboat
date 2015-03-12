function [weight] = calculateWeight(p1Coords, p1, p2Coords, p2, nodeMatrix)
% just calculate distance for now
latDiff = p1Coords(1) - p2Coords(1);
lonDiff = p1Coords(2) - p2Coords(2);
weight = sqrt(lonDiff^2 + latDiff^2);

% if the path from p1 to p2 contains land, increase weight
if nodeMatrix(p1, 4) || nodeMatrix(p2, 4)
    weight = weight*weight;
end


end