function [weight] = calculateWeight(p1Coords, p1, p2Coords, p2, nodeMatrix, stepSize, land, rivers)

%% Distance between nodes
latDiff = p1Coords(1) - p2Coords(1);
lonDiff = p1Coords(2) - p2Coords(2);
weight = sqrt(lonDiff^2 + latDiff^2);


%% Check if path goes on land
% short circuit code if both nodes are on water
% if ~(nodeMatrix(p1, 4) && nodeMatrix(p2, 4))
%     weight = weight / 2.0;
%     return
% end

% check if there is an intersection between land and the line formed by p1
% and p2
lineLats = [p1Coords(1) p2Coords(1)];
lineLons = [p1Coords(2) p2Coords(2)];
if ~isempty(intersections([land.Lat],[land.Lon], lineLats, lineLons))
%     % if both nodes are on land, huge penalty
%     if nodeMatrix(p1, 4) && nodeMatrix(p2, 4)
%         weight = weight*(((stepSize+1)*10)^10);
%     % if one of them isn't, smaller penalty
%     elseif ~nodeMatrix(p1, 4) || ~nodeMatrix(p2, 4)
%         weight = weight*((stepSize+1)^1);
%     end
    weight = weight*((stepSize+1)^5);
    if ~isempty(intersections([rivers.Lat],[rivers.Lon], lineLats, lineLons))
        weight = weight*((stepSize+1)^5);
    end
end

end