function [] = showPoints3D(coordList)
% takes in a 2D array of coordinates 

for i=1:size(coordList, 1)
    geoshow(coordList(i, 1),coordList(i, 2),'DisplayType','point','markeredgecolor','y','markerfacecolor','y','marker','o')
end

end

