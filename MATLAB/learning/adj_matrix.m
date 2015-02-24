function [ adjMatrix ] = adj_matrix(nodeMatrix)
% input: nodeMatrix is a matrix of three columns:
%   column 1 is the node number
%   column 2 is the x value of the node
%   column 3 is the y value of the node
% function returns an adjacency matrix

%stepSize = space between two adjacent nodes
%calculated using two nodes known to be adjacent -- nodes 1 and 2
stepSize = abs(nodeMatrix(1,3) - nodeMatrix(2,3));  

numNodes = size(nodeMatrix, 1);          % number of nodes (rows of nodeArray)
adjMatrix = zeros(numNodes,numNodes);    % generate adjacency matrix of zeros

for r=1:numNodes
    adjMatrix(r,r) = 0;   % a node is considered ajdacent to itself
    
    for c=r:numNodes
        
        %if adjacent, put 1 in adjacent matrix
        if (nodeMatrix(r,2) == nodeMatrix(c,2) && abs(nodeMatrix(r,3) - nodeMatrix(c,3)) == stepSize)
            %same x value, adjacent y
            adjMatrix(r,c) = 1;
%             adjMatrix(c,r) = 1;
        elseif (nodeMatrix(r,3) == nodeMatrix(c,3) && abs(nodeMatrix(r,2) - nodeMatrix(c,2)) == stepSize) 
            %same y value, adjacent x
            adjMatrix(r,c) = 1;
%             adjMatrix(c,r) = 1;
        end
        
    end
end 

end