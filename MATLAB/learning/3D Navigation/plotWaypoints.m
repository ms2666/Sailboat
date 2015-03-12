function [] = plotWaypoints(waypoints)

% plot waypoints on a globe
[lttrk,lntrk] = track(waypoints);
plotm(lttrk,lntrk,'r', 'LineWidth',2)

end