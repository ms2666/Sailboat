%% Initialization
close all
resolution = .25;
bounds = [-83.2,22.0,0.3,58.8];
timeFactor = 2;

% round bounds to the resolution specified
res = 1/resolution;
bounds = round(bounds*res)/res;
bounds = [bounds(2), bounds(1), bounds(4), bounds(3)];

% add 360 to latitudes
bounds = bounds + [0, 360, 0, 360];

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
f = logical(latData >= bounds(1) & latData <= bounds(3));
g = logical(lonData >= bounds(2) & lonData <= bounds(4));
ind1 = find(latData>bounds(1) & latData<bounds(3));
ind2 = find(lonData(ind1)>bounds(2) & lonData(ind1)<bounds(4));
[I,J] = ind2sub(size(latData),ind1(ind2));

% slice x, y, u and v
latData = latData(min(I):max(I),min(J):max(J));
lonData = lonData(min(I):max(I),min(J):max(J));
u = u(min(I):max(I),min(J):max(J));
v = v(min(I):max(I),min(J):max(J));

% remove vectors that aren't on a node 
f = logical(mod(latData, resolution) == 0); f = f(1, :);
g = logical(mod(lonData, resolution) == 0); g = g(:, 1);

latData = latData(g, f);
lonData = lonData(g, f);
u = u(g, f);
v = v(g, f);

%% Display stuff
% display vector data
quiverm(latData, lonData, u, v, 'w');