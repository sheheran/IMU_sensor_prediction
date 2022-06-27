function R = ReLuFunction(x)
    R = zeros(size(x));
    for i = 1:numel(x)
        if x(i)<0
            R(i) = 0;
        else 
            R(i) = x(i);
        end
    end
end
    