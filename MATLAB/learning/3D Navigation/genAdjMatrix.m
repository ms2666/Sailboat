function [ adjMatrix ] = genAdjMatrix( nodeMatrix, resolution )
% generates an adjacency matrix in the form of a sparse matrix

% initialize an adjacency matrix
numNodes = size(nodeMatrix, 1);
adjMatrix = zeros(numNodes,numNodes);
% determines angual resolution. 1*resolution means each node only connects to 8 around it 
stepSize = 6*resolution;
% adjusts tolerance. 1.0 is 0% tolerance, 1.1 is 10%, etc
tolerance = 1.1;

for r=1:numNodes
    rLat = nodeMatrix(r, 2);
    rLon = nodeMatrix(r, 3);
    
    for c=r:numNodes
        cLat = nodeMatrix(c, 2);
        cLon = nodeMatrix(c, 3);
        
        % if the nodes are within step sizes of each other, nodes are
        % connected
        if abs(rLat - cLat) <= stepSize*tolerance && abs(rLon - cLon) <= stepSize*tolerance
            adjMatrix(r, c) = calculateWeight([rLat rLon], r, [cLat cLon], c, nodeMatrix);
        end
        
    end
end

% turn into sparse matrix because 0 weight means no connection
adjMatrix = sparse(adjMatrix);

end