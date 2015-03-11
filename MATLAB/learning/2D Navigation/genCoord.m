function [coordinates, n] = genCoord(bounds, step_size)
% input a bounds vector and a step_size

if (nargin < 2)
    disp('idiot');
    disp('put suff in here moron');
    return
end
        

Xs = bounds(1):step_size:bounds(3);
Ys = bounds(2):step_size:bounds(4);

% Horizontal grid 
for k = 1:length(Ys)
  plot([Xs(1) Xs(end)], [Ys(k) Ys(k)], 'k-', 'LineWidth', 1)
end
% Vertical grid
for k = 1:length(Xs)
  plot([Xs(k) Xs(k)], [Ys(1) Ys(end)], 'k-', 'LineWidth', 1)
end

[~, xLen] = size(Xs);
[~, yLen] = size(Ys);

% generate coordinates based on bounding box
[p,q] = meshgrid(Xs, Ys);
coordinates = [p(:) q(:)];

n = xLen * yLen;
end