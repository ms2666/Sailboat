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

% bounding box for the atlantic ocean
step_size = 5;
bounds = round([-83.2,13.3,2.4,64.7]);
% get coordinates for each node to plot
[coordinates, num_nodes] = genCoord3D(bounds, step_size);

showPoints3D(coordinates);