resolution = 10;
bounds = [-83.2,22.0,0.3,58.8];

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

% get vector data at 1st time of day
timeFactor = 1;
u = flowData.u(:,:,1,timeFactor); u(isnan(u)) = 0;
v = flowData.v(:,:,1,timeFactor); v(isnan(v)) = 0;

% as of now, x, y, u and v should have the same dimensions
latInds = logical(x >= bounds(1) & x <= bounds(3));
latInds = latInds(1, :);
lonInds = logical(y >= bounds(2) & y <= bounds(4));
lonInds = lonInds(:, 1);

[a, b] = size(x);

% trim x, y, u, and v
% newX = x(latInds, lonInds);
% newY = y(latInds, lonInds);
% newU = u(latInds, lonInds);
% newV = v(latInds, lonInds);

c = 2;
newX = x(1:a/c, 1:b/c);
newY = y(1:a/c, 1:b/c);
newU = u(1:a/c, 1:b/c);
newV = v(1:a/c, 1:b/c);



% display vector data
quiverm(newX, newY, newU, newV, 'y');

% geoshow(20, -80, 'DisplayType','point','markeredgecolor','y','markerfacecolor','k','marker','o')