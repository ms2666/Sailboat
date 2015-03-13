%% Parameters for program
% some cities
NewYorkCity = [40.7, -74.0];
London = [51.5, -0.1];
Lisbon = [38.7, -9.1];
Paris = [48.9, 2.3];
Algiers = [36.8, 3.2];
MexicoCity = [19.4, -99.1];
Houston = [31.0, -100];

% resolution is the number of degrees between each node
resolution = 2;

% bounding box for the atlantic ocean
bounds = round([-100,10,0.3,58.8]);


%% Calculate shortest path
% get coordinates of each node
[coordinates, numNodes] = genCoord3D(bounds, resolution);

% create a matrix: [ node_number, node_lat, node_lon ]
nodeMatrix = [(1:numNodes)' coordinates];

% check if each node is on land or water
nodeMatrix = genLandmask(nodeMatrix, numNodes);

% remove land nodes
[nodeMatrix, numNodes] = removeLandNodes(nodeMatrix);

% fetch closest nodes to the nodes supplied
[sourceNode, destNode] = closestNodes3D(Houston, London, nodeMatrix);

% calculate shortest path
[path] = genPath(nodeMatrix, sourceNode, destNode, resolution);


%% Plot shortest path
drawGlobe()
% show nodes (decreases performance)
showPoints3D([nodeMatrix(:, 2) nodeMatrix(:, 3)]);

% plot the waypoints in the part
waypoints = nodeMatrix(path, 2:3);
plotWaypoints(waypoints);


%% Plot wind vectors
