function [weight] = calculateWeight(p1, p2)
% just calculate distance for now
latDiff = p1(1) - p2(1);
lonDiff = p1(2) - p2(2);
weight = sqrt(lonDiff^2 + latDiff^2);

% if the path from p1 to p2 contains land, increase weight
if landmask(p2(1), p2(2)) || landmask (p1(1), p1(2))
    weight = weight*weight;
end


end