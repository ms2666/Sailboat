function [a] = plotWind(dataFile, bounds, resolution, timeFactor)
%% Initialization

% round bounds to the resolution specified
res = 1/resolution;
bounds = round(bounds*res)/res;

% bounds transformations:
%   flip latitude and longitude
%   wrap longitudes from 0 to 360
bounds = [bounds(2), mod(bounds(1), 360), bounds(4), mod(bounds(3), 360)];


%% Fetch data from netCDF file
% read the netCDF file
flowData = readFile(dataFile);
% convert latitudes and longitudes to floats
lats = double(flowData.lat);
lons = double(flowData.lon);

% generate a meshgrid of lats and lons
[latData, lonData] = meshgrid(lats, lons);

% fetch u and v data and set NAN values to 0
u = flowData.u(:,:,1,timeFactor); u(isnan(u)) = 0;
v = flowData.v(:,:,1,timeFactor); v(isnan(v)) = 0;


%% Slice data
% remove vectors outside bounding box
a = logical(latData >= bounds(1) & latData <= bounds(3)); a = a(1, :);
if(bounds(2) > bounds(4))
    b = logical(lonData >= bounds(2) | lonData <= bounds(4));
else
    b = logical(lonData >= bounds(2) & lonData <= bounds(4));
end
b = b(:, 1);

% remove vectors that aren't on a node 
c = logical(mod(latData, resolution) == 0); c = c(1, :);
d = logical(mod(lonData, resolution) == 0); d = d(:, 1);

e = (a & c);
f = (b & d);

latData = latData(f, e);
lonData = lonData(f, e);
u = u(f, e);
v = v(f, e);


%% Display stuff
% display vector data
a = quiverm(latData, lonData, v, u, 'w');

end