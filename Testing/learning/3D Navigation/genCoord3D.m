function [coordinates, n] = genCoord3D(bounds, step_size)

Xs = bounds(1):step_size:bounds(3);
Ys = bounds(2):step_size:bounds(4);

[~, xLen] = size(Xs);
[~, yLen] = size(Ys);

% generate coordinates based on bounding box
[p,q] = meshgrid(Xs, Ys);
% coordinates = [p(:) q(:)];
coordinates = [q(:) p(:)];

n = xLen * yLen;

end