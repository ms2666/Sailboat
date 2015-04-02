%% Initialization
close all
resolution = .25;
bounds = [-28.3,-39.9,162.0,47.8];
timeFactor = 1;

% round bounds to the resolution specified
res = 1/resolution;
bounds = round(bounds*res)/res;
% bounds = [lon]
bounds = [bounds(2), bounds(1), bounds(4), bounds(3)];

% add 360 to latitudes
bounds = bounds + [0 360 0 360];
bounds = [bounds(1), mod(bounds(2), 360), bounds(3), mod(bounds(4), 360)]

dataFile = 'uv20150102rt.nc';

drawGlobe()


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
quiverm(latData, lonData, u, v, 'w');
geoshow(0, 390, 'DisplayType','point','markeredgecolor','y','markerfacecolor','r','marker','o')
geoshow([bounds(1) bounds(3)], [bounds(2) bounds(4)], 'DisplayType','point','markeredgecolor','y','markerfacecolor','r','marker','o')