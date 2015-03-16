function [ outBool ] = withinBounds( val1, val2, error)

if abs(1 - (val1/val2)) < error
    outBool = true;
else
    outBool = false;
end

end

