clear all; close all; clc;

%Creating the data set
load('Forward.mat');
load('Reverse.mat');

%Seperate test set
forward_test_set = Forward(1:10,:);
reverse_test_set = Reverse(1:10,:);

%Seperate input and output from testing set
T = [forward_test_set;reverse_test_set];
Y = T(:,7);
T(:,7) = [];
[N,M] = size(T);

result = zeros(1,N);
%load weights
load('weights');

for k = 1:N
x = T(k,:)';
y = Y(k);
[m,n] = size(x);

%foward propagation
a_0 = x; %Input layer
    
z_1 = w_1*a_0;  %hidden layer 01
a_1 = tanH(z_1);

z_2 = w_2*a_1;  %hidden layer 02
a_2 = tanH(z_2);

z_3 = w_3*a_2;  %hidden layer 04
a_3 = tanH(z_3);

%a_3 = Binarystep(a_3);
result(1,k) = a_3

end


%J(1,i) = mean(abs( y - result));
%plot(J);
%grid on;
