function [] = plotWind(dataFile, bounds, resolution)
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
latInds = latInds(1, :)
lonInds = logical(y >= bounds(2) & y <= bounds(4));
lonInds = lonInds(:, 1)

% trim x, y, u, and v
x = x(latInds, lonInds);
y = y(latInds, lonInds);
u = u(latInds, lonInds);
v = v(latInds, lonInds);


% debug crap
disp(dataFile);
disp(bounds);
disp(size(x)); disp(size(y));
disp(size(u)); disp(size(v));

setVecData(x);

% display vector data
quiverm(x, y, u, v, 'y');
end