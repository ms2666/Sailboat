function [ adjMatrix ] = adj_matrix(nodeMatrix)
% input: nodeMatrix is a matrix of three columns:
%   column 1 is the node number
%   column 2 is the x value of the node
%   column 3 is the y value of the node
% This function returns an (upper triangular) adjacency matrix.
%   adjMatrix(a,b) == 1 if nodes a and b are adjacent, 0 if not
%   A node is considered ajdacent to itself.
%   Diagonal nodes are also adjacent.


%stepSize = space between two adjacent nodes
%calculated using two nodes known to be adjacent -- nodes 1 and 2
%assumes nodes 1 and 2 are in the same column (same x, different y val)
stepSize = abs(nodeMatrix(1,3) - nodeMatrix(2,3));

numNodes = size(nodeMatrix, 1);          % number of nodes (rows of nodeArray)
adjMatrix = zeros(numNodes,numNodes);    % generate adjacency matrix of zeros

for r=1:numNodes
    
    for c=r:numNodes
        
        % adjacent if same x value, y value one step away (above/below)
        if (nodeMatrix(r,2) == nodeMatrix(c,2) && ...
                abs(nodeMatrix(r,3) - nodeMatrix(c,3)) == stepSize)
            adjMatrix(r,c) = calculateWeight(nodeMatrix,r,c);
            
            % adjacent if same y value, x value one step away (left/right)
        elseif (nodeMatrix(r,3) == nodeMatrix(c,3) && ...
                abs(nodeMatrix(r,2) - nodeMatrix(c,2)) == stepSize)
            adjMatrix(r,c) = calculateWeight(nodeMatrix,r,c);
            
            % adjacent if both x and y value one step away (diagonal)
            %         elseif ((abs(nodeMatrix(r,3) - nodeMatrix(c,3)) == stepSize) && ...
            %                 (abs(nodeMatrix(r,2) - nodeMatrix(c,2)) == stepSize))
            %             adjMatrix(r,c) = calculateWeight(nodeMatrix,r,c);
            
            %         try this one
        elseif ((abs(nodeMatrix(r,3) - nodeMatrix(c,3)) == stepSize) || (abs(nodeMatrix(r,3) - nodeMatrix(c,3)) == 2*stepSize) && ...
                (abs(nodeMatrix(r,2) - nodeMatrix(c,2)) == stepSize) || (abs(nodeMatrix(r,2) - nodeMatrix(c,2)) == 2*stepSize))
            adjMatrix(r,c) = calculateWeight(nodeMatrix,r,c);
        end
    end
end

end