% bounding box for the atlantic ocean
step_size = 10;
bounds = round([-83.2,13.3,2.4,64.7]);

Xs = bounds(1):step_size:bounds(3);
Ys = bounds(2):step_size:bounds(4);
clear step_size; clear bounds;
[~, xLen] = size(Xs);
[~, yLen] = size(Ys);

% generate coordinates based on bounding box
[p,q] = meshgrid(Xs, Ys);
coordinates = [p(:) q(:)];
% clear p; clear q;

scatter(coordinates(:,1), coordinates(:,2))
axis square

% create set of nodes
n = xLen * yLen;
nodeList = (1:n)';
nodeMatrix = [nodeList coordinates];
adjMat = adj_matrix(nodeMatrix);

hold off

p = rand(10,2);
labels = cellstr( num2str((1:n)') );  %' # labels correspond to their order
scatter(coordinates(:,1), coordinates(:,2))
text(coordinates(:,1), coordinates(:,2), labels, 'VerticalAlignment','bottom','HorizontalAlignment','right')