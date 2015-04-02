%% Parameters for program
% some cities
NYC = [40.7, -74.0];
London = [51.5, -0.1];
Lisbon = [38.7, -9.1];
Paris = [48.9, 2.3];
Algiers = [36.8, 3.2];
MexicoCity = [19.4, -99.1];
Houston = [31.0, -100];
TelAviv = [32.1, 34.8];
Barcelona = [41.2, 2.2];
Osaka = [34.6, 135.5];

% bounding box for the atlantic ocean
NorthAtlantic = [-83.2,22.0,0.3,58.8];
Mediterranean = [-11.4,28.1,45.8,49.9];
Custom = [-100,10,0.3,58.8];
Custom2 = [-104.1,12.2,45.6,55.2];
Israel2Japan = [-28.3,-39.9,162.0,47.8];

%% Inputs to program
% resolution is the number of degrees between each node
resolution = 10;
% bounding box for nodes. smaller = faster
bounds = Israel2Japan;
% source and destination cities
source = TelAviv; dest = Osaka;

%% Calculate shortest path
% get coordinates of each node
[coordinates, numNodes] = genCoord3D(bounds, resolution);

% remove land nodes
[nodeMatrix, numNodes] = removeLandNodes([(1:numNodes)' coordinates], numNodes);

% calculate shortest path after calculating closest nodes to input cities
[p1, p2] = closestNodes3D(source, dest, nodeMatrix);
[path] = genPath(nodeMatrix, [p1 p2], resolution);


%% Plot shortest path
drawGlobe()
% show nodes (decreases performance)
% showPoints3D([nodeMatrix(:, 2) nodeMatrix(:, 3)]);

% plot the waypoints in the part
waypoints = nodeMatrix(path, 2:3);
plotWaypoints(waypoints);


%% Plot wind vectors

% 4 times of day available
timeFactor = 2;

% plots wind data for ONE time of the day
plotWind('uv20150102rt.nc', bounds, resolution, timeFactor)