hold on
% bounding box for the atlantic ocean
step_size = 3;
bounds = round([-83.2,13.3,2.4,64.7]);
[coordinates, n] = genCoord(bounds, step_size);

% create adjacency matrix
nodeList = (1:n)';
nodeMatrix = [nodeList coordinates];
sparseAdjMat = sparse(adj_matrix(nodeMatrix));
[dist, path, ~] = graphshortestpath(sparseAdjMat, 64, 464);

% generate labels for nodes
labels = cellstr(num2str(nodeList));
scatter(coordinates(:,1), coordinates(:,2))
text(coordinates(:,1), coordinates(:,2), labels, 'VerticalAlignment','bottom','HorizontalAlignment','right')
% plot shortest path
for i = 1:(size(path, 2)-1)
    X = [nodeMatrix(path(i), 2) nodeMatrix(path(i+1), 2)];
    Y = [nodeMatrix(path(i), 3) nodeMatrix(path(i+1), 3)];
    plot(X,Y, 'r-', 'LineWidth', 4);
end
axis equal

coast=load('coast');
plot(coast.long,coast.lat)