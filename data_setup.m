clear all; close all; clc;

%Creating the data set
load('Forward.mat');
load('Reverse.mat');
%Seperate test set
forward_test_set = Forward(663:673,:);
reverse_test_set = Reverse(515:525,:);
%Seperate training set
Forward(663:673,:) = [];
Reverse(515:525,:) = [];
%Seperate input and output from trainng set
X = [Reverse;Forward];
Y = X(:,7);
X(:,7) = [];
[N,M] = size(X);

itr = 10000;
J = zeros(1,itr);
predict = zeros(1,N);
%weights
w_1 = randn(5,6)*2 - 1;
w_2 = randn(5,5)*2 - 1; 
w_3 = randn(3,5)*2 - 1;
w_4 = randn(1,3)*2 - 1;

for i = 1:itr
    a = randperm(N,N);
    %a = [1:1:N];
for k = 1:N
x = X(a(k),:)';
y = Y(a(k));
[m,n] = size(x);

%foward propagation
a_0 = x; %Input layer
    
z_1 = w_1*a_0;  %hidden layer 01
a_1 = sigmoidFunction(z_1);

z_2 = w_2*a_1;  %hidden layer 02
a_2 = sigmoidFunction(z_2);

z_3 = w_3*a_2;  %hidden layer 04
a_3 = sigmoidFunction(z_3);

z_4 = w_4*a_3;  %hidden layer 04
a_4 = sigmoidFunction(z_4);

predict(1,k) = a_4;

%Back propagation
%output error
delta_4 = a_4 - y;
%Gradient of the output layer
grad_4 = delta_4*a_3';

%hidden layer 2 error
delta_3 = w_4' * delta_4 .* a_3.*(1-a_3);
%Gradient of the hidden layer 3
grad_3 = delta_3*a_2';

%hidden layer 2 error
delta_2 = w_3' * delta_3 .* a_2.*(1-a_2);
%Gradient of the hidden layer 3
grad_2 = delta_2*a_1';

%hidden layer 1 error
delta_1 = w_2'*delta_2.*a_1.*(1-a_1);
%Gradient of the hidden layer 1
grad_1 = delta_1*a_0';

%Updating weights
w_1 = w_1 - 0.01.*grad_1;
w_2 = w_2 - 0.01.*grad_2;
w_3 = w_3 - 0.01.*grad_3;
w_4 = w_4 - 0.01.*grad_4;

end
  
%squared error
i
J(1,i) = mean(abs( y - predict));
plot(J);
save('weights.mat','w_1','w_2','w_3','w_4');
grid on;
end