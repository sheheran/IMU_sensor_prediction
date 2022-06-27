function g = tanH(x)
g = zeros(size(x));
g = (exp(x) - exp(-x)) ./ (exp(x) + exp(-x));
end

