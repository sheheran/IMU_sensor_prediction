clear all; close all; clc;

%Creating the data set
load('Forward.mat');
load('Reverse.mat');
%Seperate test set
forward_test_set = Forward(1:10,:);
reverse_test_set = Reverse(1:10,:);
%Seperate training set
Forward(1:10,:) = [];
Reverse(1:10,:) = [];
%Seperate input and output from trainng set
X = [Forward;Reverse];
Y = X(:,7);
X(:,7) = [];
[N,M] = size(X);

itr = 5;
J = zeros(1,itr);
predict = zeros(1,N);
%weights
w_1 = randn(5,6)*2 - 1;
w_2 = randn(5,5)*2 -1; 
w_3 = randn(1,5)*2 - 1;


for i = 1:itr
    a = randperm(N,N);
for k = 1:N
x = X(a(k),:)';
y = Y(a(k));
[m,n] = size(x);

%foward propagation
a_0 = x; %Input layer
    
z_1 = w_1*a_0;  %hidden layer 01
a_1 = tanH(z_1);

z_2 = w_2*a_1;  %hidden layer 02
a_2 = tanH(z_2);

z_3 = w_3*a_2  %hidden layer 04
a_3 = tanH(z_3);

predict(1,k) = a_3;

%Back propagation
%output error
delta_3 = a_3 - y;
%Gradient of the output layer
grad_3 = delta_3;

%hidden layer 2 error
delta_2 = w_3' * delta_3 .* (1 - (a_2.^2));
%Gradient of the hidden layer 3
grad_2 = delta_2*a_1';

%hidden layer 1 error
delta_1 = w_2' * delta_2 .* (1 - (a_1.^2));
%Gradient of the hidden layer 1
grad_1 = delta_1*a_0';

%Updating weights
w_1 = w_1 - 0.001.*grad_1;
w_2 = w_2 - 0.001.*grad_2;
w_3 = w_3 - 0.001.*grad_3;

end
  
%squared error
i
J(1,i) = mean(abs( y - predict));
plot(J);
save('weights.mat','w_1','w_2','w_3');
grid on;
end