close all
resolution = 10;
bounds = [22.0,-83.2,58.8,0.3];
bounds = bounds + [0, 180, 0, 180];

% bounds = [-83.2,22.0,0.3,58.8];

dataFile = 'uv20150102rt.nc';

drawGlobe()

% plots a quiver plot of wind vectors

% round bounds to the resolution specified
res = 1/resolution;
bounds = round(bounds*res)/res;


% read the netCDF file
flowData = readFile(dataFile);
% convert latitudes and longitudes to floats
lats = double(flowData.lat);
lons = double(flowData.lon);
% generate a meshgrid of lats and lons
[x, y] = meshgrid(lats, lons);

ind1=find(x>bounds(1) & x<bounds(3));
ind2=find(y(ind1)>bounds(2) & y(ind1)<bounds(4));
[I,J]=ind2sub(size(x),ind1(ind2));
x=x(min(I):max(I),min(J):max(J));
y=y(min(I):max(I),min(J):max(J));

% get vector data at 1st time of day
timeFactor = 1;
u = flowData.u(:,:,1,timeFactor); u(isnan(u)) = 0;
v = flowData.v(:,:,1,timeFactor); v(isnan(v)) = 0;

u=u(min(I):max(I),min(J):max(J));
v=v(min(I):max(I),min(J):max(J));


% u = u(ind1(ind2)); v = v(ind1(ind2));

% % as of now, x, y, u and v should have the same dimensions
% latInds = logical(x >= bounds(1) & x <= bounds(3));
% latInds = latInds(1, :);
% lonInds = logical(y >= bounds(2) & y <= bounds(4));
% lonInds = lonInds(:, 1);
% 
% [a, b] = size(x);
% 
% % trim x, y, u, and v
% % newX = x(latInds, lonInds);
% % newY = y(latInds, lonInds);
% % newU = u(latInds, lonInds);
% % newV = v(latInds, lonInds);
% 
% c = 2;
% newX = x(1:a/c, 1:b/c);
% newY = y(1:a/c, 1:b/c);
% newU = u(1:a/c, 1:b/c);
% newV = v(1:a/c, 1:b/c);



% display vector data
quiverm(x, y, u, v, 'y');

% geoshow(20, -80, 'DisplayType','point','markeredgecolor','y','markerfacecolor','k','marker','o')
