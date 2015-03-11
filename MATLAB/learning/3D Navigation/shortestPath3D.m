% Draw a globe
drawGlobe()


% some example waypoints
waypoints = [36 -5; 36 -2; 38 5; 38 11; 35 13; 33 30; 31.5 32];
plotWaypoints(waypoints)

% plot the great circle between two points
place1 = [37,-76];
place2 = [37, -9];
plotGreatCircle(place1, place2)

% a slightly different version of the above
plotWaypoints([place1; place2])


% some cities
NewYorkCity = [40.7, -74.0];
London = [51.5, -0.1];
Lisbon = [38.7, -9.1];
Paris = [48.9, 2.3];
Algiers = [36.8, 3.2];

% bounding box for the atlantic ocean
step_size = 5;
bounds = round([-83.2,13.3,2.4,64.7]);
% get coordinates of each node
[coordinates, numNodes] = genCoord3D(bounds, step_size);
% plot nodes
showPoints3D(coordinates);

% create a matrix: [ node_number, node_x, node_y ]
nodeMatrix = [(1:numNodes)' coordinates];
% fetch closest nodes to the nodes supplied
[sourceNode, destNode] = closestNodes3D(NewYorkCity, Lisbon, nodeMatrix);


