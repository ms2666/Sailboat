function flowData=readFile(filename)
    flowData=struct;
    
    flowData.time=ncread(filename,'time');
    flowData.depth=ncread(filename,'zlev');
    flowData.lat=ncread(filename,'lat');
    flowData.lon=ncread(filename,'lon');
    flowData.u=ncread(filename,'u');
    flowData.v=ncread(filename,'v');
%     flowData.u_anom=ncread(filename,'u_anom');
%     flowData.v_anom=ncread(filename,'v_anom');
end