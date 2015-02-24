% finds shortest path from source to destination

hold on
% bounding box for the atlantic ocean
step_size = 10;
bounds = round([-83.2,13.3,2.4,64.7]);
[coordinates, n] = genCoord(bounds, step_size);

% create adjacency matrix
nodeList = (1:n)';
nodeMatrix = [nodeList coordinates];

% generate labels for nodes
labels = cellstr(num2str(nodeList));
scatter(coordinates(:,1), coordinates(:,2))
text(coordinates(:,1), coordinates(:,2), labels, 'VerticalAlignment','bottom','HorizontalAlignment','right')

% graph path
graphPath(nodeMatrix, 52, 10);

% draw map
coast=load('coast');
plot(coast.long,coast.lat)