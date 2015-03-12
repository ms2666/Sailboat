%% Draw a globe
drawGlobe()


%% Parameters for program
% some cities
NewYorkCity = [40.7, -74.0];
London = [51.5, -0.1];
Lisbon = [38.7, -9.1];
Paris = [48.9, 2.3];
Algiers = [36.8, 3.2];

% resolution is the number of degrees between each node
resolution = 3;

% bounding box for the atlantic ocean
bounds = round([-83.2,22.0,0.3,58.8]);


%% Calculate and plot shortest path
% get coordinates of each node
[coordinates, numNodes] = genCoord3D(bounds, resolution);
% show nodes (decreases performance)
% showPoints3D(coordinates);

% create a matrix: [ node_number, node_lat, node_lon ]
nodeMatrix = [(1:numNodes)' coordinates];
% fetch closest nodes to the nodes supplied
[sourceNode, destNode] = closestNodes3D(NewYorkCity, London, nodeMatrix);

% check create a new structure that determines if a point is on land or not
nodeMatrix = genLandmask(nodeMatrix, numNodes);

% calculate shortest path
[path, b] = genPath(nodeMatrix, sourceNode, destNode, resolution);

% plot the waypoints in the part
waypoints = nodeMatrix(path, 2:3);
plotWaypoints(waypoints);


%% Plot wind vectors
