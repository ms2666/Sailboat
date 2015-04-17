function [time] = calcTime(nodes,windVectMat,polarPlot)
%nodes is a 2x2 where the first row is the starting node and the second
%row is the goal node.  the first column is the x coord the second column
%is the y coord


time = 0;
tdiv = 0.01;
n=1000;
%initial conditions

x0=nodes(1,1); y0=nodes(1,1); th0=atan2((nodes(2,2)-nodes(1,2)),(nodes(2,1)-nodes(1,1)));
th0 = wrapTo2Pi(th0);
xdot0=0; ydot0=0; thdot0=0; 
z0=[x0,y0,th0,xdot0,ydot0,thdot0]';

%parameters
p=setBoatParam;

%calculate polar plot

stateVar = zeros(n,6);
stateVar(1,:) = z0';
thetaDesired = zeros(n,1);
thetaDesired(1) = nan;
command = zeros(n,1);
command(1) = nan;
rudderPos = zeros(n,1);
rudderPos(1) = p.angle_rRelb;
error = zeros(n,1);
error(1) = nan;
prevError = 0;

f = @rhs;
thetaWind = atan2(p.v_a(2),p.v_a(1))+pi;
thetaWind = wrapTo2Pi(thetaWind);

%Target position for robot
p.T = nodes(2,:); %[x;y], should probably be large compared to boat
closeEnough = 2;

for i = 2: n
    
        poseBoat = stateVar(i-1,(1:3))';
        thetaBoat = wrapTo2Pi(stateVar(i-1,3));
    
        time = time + tdiv;
        
        windx = interp2(X,Y,u,poseBoat(1),poseBoat(2));
        windy = interp2(X,Y,v,poseBoat(1),poseBoat(2));
        
        thetaWind = atan2(windy,windx)+pi;
        thetaWind = wrapTo2Pi(thetaWind);
        
        r = norm(poseBoat(1:2)-p.T);
        
        [thetaDesired(i)] = findBestHeading(poseBoat,p.T,thetaWind,polarPlot);
        [error(i)] = calcError(thetaDesired(i),thetaBoat,thetaWind);
        [p.angle_rRelb,command(i),prevError] = setRudder(error(i),prevError);
        rudderPos(i) = p.angle_rRelb;
        stateVar(i,:) = EulerIntegration(tdiv,stateVar(i-1,:),f,p);
        stateVar(i,3) = wrapTo2Pi(stateVar(i,3));
        if r < closeEnough
            break;
        end
    disp(n-i)
end


end
