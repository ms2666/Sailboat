% bounding box for the atlantic ocean
step_size = 15;
bounds = round([-83.2,13.3,2.4,64.7]);

[coordinates, n] = genCoord(bounds, step_size);

scatter(coordinates(:,1), coordinates(:,2))
axis square

% create set of nodes
nodeList = (1:n)';
nodeMatrix = [nodeList coordinates];
adjMat = adj_matrix(nodeMatrix);

hold off

p = rand(10,2);
labels = cellstr( num2str((1:n)') );  %' # labels correspond to their order
scatter(coordinates(:,1), coordinates(:,2))
text(coordinates(:,1), coordinates(:,2), labels, 'VerticalAlignment','bottom','HorizontalAlignment','right')