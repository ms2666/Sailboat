% bounding box for the atlantic ocean
step_size = 25;
bounds = round([-83.2,13.3,2.4,64.7]);
[coordinates, n] = genCoord(bounds, step_size);

% create adjacency matrix
nodeList = (1:n)';
nodeMatrix = [nodeList coordinates];
adjMat = adj_matrix(nodeMatrix);
sparseAdjMat = sparse(adjMat);
[dist, path, ~] = graphshortestpath(sparseAdjMat, 1, 193, 'Method', 'Dijkstra');

% generate labels for nodes
labels = cellstr(num2str(nodeList));
scatter(coordinates(:,1), coordinates(:,2))
text(coordinates(:,1), coordinates(:,2), labels, 'VerticalAlignment','bottom','HorizontalAlignment','right')
hold on
for r = 1:n
    for c = r:n
        if adjMat(r, c) ~= 0 || adjMat(c, r) ~= 0
            X = [nodeMatrix(c, 2) nodeMatrix(r, 2)];
            Y = [nodeMatrix(c, 3) nodeMatrix(r, 3)];
            plot(X,Y, 'k-', 'LineWidth', 1);
        end
    end
end

for i = 1:(size(path, 2)-1)
    X = [nodeMatrix(path(i), 2) nodeMatrix(path(i+1), 2)];
    Y = [nodeMatrix(path(i), 3) nodeMatrix(path(i+1), 3)];
    plot(X,Y, 'r-', 'LineWidth', 2);
end