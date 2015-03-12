function [] = plotWaypoints(waypoints)

% plot waypoints on a globe
[lttrk,lntrk] = track(waypoints);
plotm(lttrk,lntrk,'r', 'LineWidth',3)

for i=1:size(waypoints, 1)
    geoshow(waypoints(i, 1),waypoints(i, 2),'DisplayType','point','markeredgecolor','r','markerfacecolor','k','marker','o')
end

end