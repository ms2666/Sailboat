function [weight] = calculateWeight(p1, p2)
% just calculate distance for now
latDiff = p1(1) - p2(1);
lonDiff = p1(2) - p2(2);
weight = sqrt(lonDiff^2 + latDiff^2);

% weight = 100000*rand*weight;

end