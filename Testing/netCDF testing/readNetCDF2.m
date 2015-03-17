% quiver
% streamslice

flowData = readFile('uv20150102rt.nc');
[x,y] = meshgrid(flowData.lon,flowData.lat);
x = x';
y = y';

u = flowData.u(:,:,1,1); u(isnan(u)) = 0;
v = flowData.v(:,:,1,1); v(isnan(v)) = 0;

latData = ncread('uv20150102rt.nc', 'lat');
lonData = ncread('uv20150102rt.nc', 'lon');

% quiver(x, y, u, v);

% streamline(U,V,startx,starty) assumes the arrays X and Y are defined as ...
%     [X,Y] = meshgrid(1:N,1:M), where [M,N] = size(U).

% streamline(X,Y,U,V,startx,starty) draws streamlines from 2-D vector data U, V.

[vertices, arrowvertices] = streamslice(latData,lonData,u,v);