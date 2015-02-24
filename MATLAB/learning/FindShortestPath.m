hold on
% bounding box for the atlantic ocean
step_size = 5;
bounds = round([-83.2,13.3,2.4,64.7]);
[coordinates, n] = genCoord(bounds, step_size);
clear bounds; clear step_size;

% create adjacency matrix
nodeList = (1:n)';
nodeMatrix = [nodeList coordinates];
adjMat = adj_matrix(nodeMatrix);
sparseAdjMat = sparse(adjMat);
[dist, path, ~] = graphshortestpath(sparseAdjMat, 1, 2, 'Method', 'Dijkstra');

% generate labels for nodes
labels = cellstr(num2str(nodeList));
scatter(coordinates(:,1), coordinates(:,2))
text(coordinates(:,1), coordinates(:,2), labels, 'VerticalAlignment','bottom','HorizontalAlignment','right')

for i = 1:(size(path, 2)-1)
    X = [nodeMatrix(path(i), 2) nodeMatrix(path(i+1), 2)];
    Y = [nodeMatrix(path(i), 3) nodeMatrix(path(i+1), 3)];
    plot(X,Y, 'r-', 'LineWidth', 2);
end
clear X; clear Y; clear n; clear i; clear c; clear r; clear dist;
clear labels; clear nodeList; clear adjMat; clear coordinates;