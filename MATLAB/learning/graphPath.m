function [] = graphPath(nodeMatrix, source, destination)
% calculate and graph the shortest path

sparseAdjMat = sparse(adj_matrix(nodeMatrix));

% swap the source and destination if source > destination
if source > destination
    temp = source;
    source = destination;
    destination = temp;
end

% calculate shortest path
[~, path, ~] = graphshortestpath(sparseAdjMat, source, destination);

path

% plot shortest path
for i = 1:(size(path, 2)-1)
    X = [nodeMatrix(path(i), 2) nodeMatrix(path(i+1), 2)];
    Y = [nodeMatrix(path(i), 3) nodeMatrix(path(i+1), 3)];
    plot(X,Y, 'r-', 'LineWidth', 4);
end
axis equal

end