function R = Binarystep(x)
    R = zeros(size(x));
    for i = 1:numel(x)
        if x(i)<0.5
            R(i) = 0;
        else 
            R(i) = 1;
        end
    end
end
    
