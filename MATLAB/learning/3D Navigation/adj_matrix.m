function [ adjMatrix ] = adj_matrix( nodeMatrix, resolution )
% generates an adjacency matrix in the form of a sparse matrix

% initialize an adjacency matrix
numNodes = size(nodeMatrix, 1);
adjMatrix = zeros(numNodes,numNodes);
% determines angual resolution. 1*resolution means each node only connects to 8 around it 
stepSize = 3*resolution;
% adjusts tolerance. 1.0 is 0% tolerance, 1.1 is 10%, etc
tolerance = 1.1;

for r=1:numNodes
    rLat = nodeMatrix(r, 2);
    rLon = nodeMatrix(r, 3);
    
    for c=r:numNodes
        cLat = nodeMatrix(c, 2);
        cLon = nodeMatrix(c, 3);
        
        % if the nodes are within step sizes of each other, weight isn't 0
        if abs(rLat - cLat) <= stepSize*tolerance && abs(rLon - cLon) <= stepSize*tolerance
            adjMatrix(r, c) = calculateWeight(nodeMatrix, r, c);
        end
        
    end
end

adjMatrix = sparse(adjMatrix);

end