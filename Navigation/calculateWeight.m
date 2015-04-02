function [weight] = calculateWeight(p1Coords, p2Coords, stepSize, land, rivers)

%% Distance between nodes
latDiff = p1Coords(1) - p2Coords(1);
lonDiff = p1Coords(2) - p2Coords(2);
weight = sqrt(lonDiff^2 + latDiff^2);


%% Check if path goes on land
% check if there is an intersection between land and the line formed by p1
% and p2
lineLats = [p1Coords(1) p2Coords(1)];
lineLons = [p1Coords(2) p2Coords(2)];
% if the there is an intersection
if ~isempty(intersections([land.Lat],[land.Lon], lineLats, lineLons))
    weight = weight + 10000;
    
%     % checks for rivers (there are no rivers on the ocean)
%     if ~isempty(intersections([rivers.Lat],[rivers.Lon], lineLats, lineLons))
%         weight = weight*((stepSize+1)^5);
%     end
end

end