%% phase 1
% land = shaperead('landareas','UseGeoCoords',true);
% landLats = [land.Lat];
% landLons = [land.Lon];
% 
% % need to run shortestPath3D for waypoints
% waypointLats = waypoints(:, 1);
% waypointLons = waypoints(:, 2);
% 
% [x0, y0, iout, jout] = intersections(landLats, landLons, waypointLats, waypointLons);
% intersects = [x0 y0];
% 
% a = [nodeMatrix(1, 2) nodeMatrix(2, 2)];
% b = [nodeMatrix(1, 3) nodeMatrix(2, 3)];
% 
% isempty(intersections(a, b, landLats, landLons))

%% phase 2
fatty = scratchAdjMat(nodeMatrix, resolution);
graphshortestpath(fatty, sourceNode, destNode, 'Directed', false, 'method', 'Bellman-Ford')