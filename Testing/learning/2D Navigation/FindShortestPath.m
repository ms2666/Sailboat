% finds shortest path from source to destination

hold on
% some cities
NewYorkCity = [40.7, -74.0];
London = [51.5, -0.1];
Lisbon = [38.7, -9.1];
Paris = [48.9, 2.3];
Algiers = [36.8, 3.2];

% bounding box for the atlantic ocean
step_size = 2;
bounds = round([-83.2,13.3,2.4,64.7]);
[coordinates, n] = genCoord(bounds, step_size);


% create adjacency matrix
nodeList = (1:n)';
nodeMatrix = [nodeList coordinates];


% generate labels for nodes
labels = cellstr(num2str(nodeList));
scatter(coordinates(:,1), coordinates(:,2))
text(coordinates(:,1), coordinates(:,2), labels, 'VerticalAlignment','bottom','HorizontalAlignment','right')


% graph path(s) and draw map
[a, b] = getNodes(NewYorkCity, London, nodeMatrix);
path = graphPath(nodeMatrix, a, b);