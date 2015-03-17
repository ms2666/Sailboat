function fromBoris(filename)
    close all;

    if nargin<1
        filename='uv20150102rt.nc';
    end
    
    flowData=readFile(filename);
    
    
    
    eastBndInd=find(flowData.lon>180,1,'first');
    lonBndInd=find(flowData.lon>=(flowData.lon(1)+360),1,'first')-1;
    flowData.lon=[flowData.lon(eastBndInd:lonBndInd)-360; flowData.lon(1:eastBndInd-1)];
    
    [x,y]=meshgrid(flowData.lon,(flowData.lat));
    
%     u=[flowData.u(eastBndInd:lonBndInd,:,1,1); flowData.u(1:eastBndInd-1,:,1,1)];
%     v=[flowData.v(eastBndInd:lonBndInd,:,1,1); flowData.v(1:eastBndInd-1,:,1,1)];
    
    u = flowData.u(:,:,1,1);
    v = flowData.v(:,:,1,1);
    
    u(find(isnan(u)))=0;
    v(find(isnan(v)))=0;
    
    x=x';
    y=y';
    
    figure
    
%     worldmap('World')
%     load coast
    coast=load('coast');
%     coast.long(find(coast.long<20))=coast.long(find(coast.long<20))+360;

    
    

	quiver(x,y,u,v);
    axis equal
    hold on
    plot(coast.long,coast.lat)
    
%     figure
%     streamslice(y,x,v,u,'linear')
    
    
end
