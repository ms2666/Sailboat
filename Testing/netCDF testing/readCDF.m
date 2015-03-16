function flowData = readCDF(filename)
if nargin ~= 1
    disp('Insufficient input')
    return
end

flowData=struct;

flowData.time=ncread(filename,'time');
flowData.depth=ncread(filename,'zlev');
flowData.lat=ncread(filename,'lat');
flowData.lon=ncread(filename,'lon');
flowData.u=ncread(filename,'u');
flowData.v=ncread(filename,'v');
end