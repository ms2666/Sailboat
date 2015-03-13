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
resolution = 20;

% bounding box for the atlantic ocean
bounds = [-100,10,0.3,58.8];


%% Calculate shortest path
% get coordinates of each node
[coordinates, numNodes] = genCoord3D(round(bounds), resolution);

% remove land nodes
[nodeMatrix, numNodes] = removeLandNodes([(1:numNodes)' coordinates], numNodes);

% calculate shortest path after calculating closest nodes to input cities
[p1, p2] = closestNodes3D(Houston, London, nodeMatrix);
[path] = genPath(nodeMatrix, [p1 p2], resolution);


%% Plot shortest path
drawGlobe()
% show nodes (decreases performance)
% showPoints3D([nodeMatrix(:, 2) nodeMatrix(:, 3)]);

% plot the waypoints in the part
waypoints = nodeMatrix(path, 2:3);
plotWaypoints(waypoints);


%% Plot wind vectors
