function g = sigmoidFunction(z)
  g = zeros(size(z));
  g = 1.0 ./ ( 1.0 + exp(-z)); % For Matlab
end


