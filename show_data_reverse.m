clear all; close all; clc;

%plot data forward
filename = 'reverse.csv';
M_r = csvread(filename);
time = M_r(:,1)';

%%%%%%%%%%% ax %%%%%%%%%%
%data setup
ax = M_r(:,2)'; %linear x
[row,col] = size(ax);


%moving average filter
ax(1) = ax(1);
ax(2) = (ax(1)+ax(2)+ax(3))/3;
for i = 3:(col-3)
ax(i) = (ax(i-2)+ax(i-1)+ax(i)+ax(i+1)+ax(i+2))/5;
end
ax(524) = (ax(523)+ax(524)+ax(525))/3;
ax(525) = ax(525);

%Impliment low pass filter
Ts = 10e-3; %sampling period
Fs = 1/Ts; %sampling frequency
dt = 0:Ts:10-Ts; %signal duration (from 0 to duration of one sample to 10ms)

nfft = length(ax); %highst dimension of the signal
n = 2.^nextpow2(nfft);
%converting to freqency domain
fy = fft(ax,n); %fast fourier transform will give magnitude and phase
%Define the frequency domain and plot unique frequencies
f = Fs*(0:(n/2))/n;
P = abs(fy/n).^2;
cut_off = 1.5/Fs/2; %Niquest frequency
%the minimum rate at which a signal can be sampled without introducing errors, 
%which is twice the highest frequency present in the signal.
order = 32;
h = fir1(order,cut_off);
ax = filter(h,1,ax);

time = time - time(1);

Ax = timeseries(ax,time');
Ax.name = 'forward';
Ax.TimeInfo.Units = 'milisecoends';
plot(Ax);
hold on;

%%%%%%%%%%% ay %%%%%%%%%%
%data setup
ay = M_r(:,3)'; %linear y
[row,col] = size(ay);

%moving average filter
ay(1) = ay(1);
ay(2) = (ay(1)+ay(2)+ay(3))/3;
for i = 3:(col-3)
ay(i) = (ay(i-2)+ay(i-1)+ay(i)+ay(i+1)+ay(i+2))/5;
end
ay(524) = (ay(523)+ay(524)+ay(525))/3;
ay(525) = ay(525);

%Impliment low pass filter
nfft = length(ay); %highst dimension of the signal
n = 2.^nextpow2(nfft);
%converting to freqency domain
fy = fft(ay,n);
f = Fs*(0:(n/2))/n;
P = abs(fy/n).^2;
cut_off = 1.5/Fs/2; %Niquest frequency
order = 32;
h = fir1(order,cut_off);
ay = filter(h,1,ay);

Ay = timeseries(ay,time');
Ay.name = 'forward';
Ay.TimeInfo.Units = 'milisecoends';
plot(Ay);
hold on;

%%%%%%%%%%% az %%%%%%%%%%
%data setup
az = M_r(:,4)'; %linear y
[row,col] = size(az);

%moving average filter
az(1) = az(1);
az(2) = (az(1)+az(2)+az(3))/3;
for i = 3:(col-3)
az(i) = (az(i-2)+az(i-1)+az(i)+az(i+1)+az(i+2))/5;
end
az(524) = (az(523)+az(524)+az(525))/3;
az(525) = az(525);

%Impliment low pass filter
nfft = length(az); %highst dimension of the signal
n = 2.^nextpow2(nfft);
%converting to freqency domain
fy = fft(az,n);
f = Fs*(0:(n/2))/n;
P = abs(fy/n).^2;
cut_off = 1.5/Fs/2; %Niquest frequency
order = 32;
h = fir1(order,cut_off);
az = filter(h,1,az);

Az = timeseries(az,time');
Az.name = 'forward';
Az.TimeInfo.Units = 'milisecoends';
plot(Az);

grid on;
legend('Ax','Ay','Az');

%angular acceleration

%%%%%%%%%%% gx %%%%%%%%%%
figure;
%data setup
gx = M_r(:,5)'; %Angulat x
[row,col] = size(gx);

%moving average filter
gx(1) = gx(1);
gx(2) = (gx(1)+gx(2)+gx(3))/3;
for i = 3:(col-3)
gx(i) = (gx(i-2)+gx(i-1)+gx(i)+gx(i+1)+gx(i+2))/5;
end
gx(524) = (gx(523)+gx(524)+gx(525))/3;
gx(525) = gx(525);

%Impliment low pass filter
nfft = length(gx); %highst dimension of the signal
n = 2.^nextpow2(nfft);
%converting to freqency domain
fy = fft(gx,n);
f = Fs*(0:(n/2))/n;
P = abs(fy/n).^2;
cut_off = 1.5/Fs/2; %Niquest frequency
order = 32;
h = fir1(order,cut_off);
gx = filter(h,1,gx);

time = time - time(1);

Gx = timeseries(gx,time');
Gx.name = 'forward';
Gx.TimeInfo.Units = 'milisecoends';
plot(Gx);
hold on;

%%%%%%%%%%% gy %%%%%%%%%%
%data setup
gy = M_r(:,6)'; %Angulat x
[row,col] = size(gy);

%moving average filter
gy(1) = gy(1);
gy(2) = (gy(1)+gy(2)+gy(3))/3;
for i = 3:(col-3)
gy(i) = (gy(i-2)+gy(i-1)+gy(i)+gy(i+1)+gy(i+2))/5;
end
gy(524) = (gy(523)+gy(524)+gy(525))/3;
gy(525) = gy(525);

%Impliment low pass filter
nfft = length(gy); %highst dimension of the signal
n = 2.^nextpow2(nfft);
%converting to freqency domain
fy = fft(gy,n);
f = Fs*(0:(n/2))/n;
P = abs(fy/n).^2;
cut_off = 1.5/Fs/2; %Niquest frequency
order = 32;
h = fir1(order,cut_off);
gy = filter(h,1,gy);

Gy = timeseries(gy,time');
Gy.name = 'forward';
Gy.TimeInfo.Units = 'milisecoends';
plot(Gy);
hold on;

%%%%%%%%%%% gz %%%%%%%%%%
%data setup
gz = M_r(:,7)'; %linear y
[row,col] = size(gz);

%moving average filter
gz(1) = gz(1);
gz(2) = (az(1)+az(2)+az(3))/3;
for i = 3:(col-3)
gz(i) = (gz(i-2)+gz(i-1)+gz(i)+gz(i+1)+gz(i+2))/5;
end
gz(524) = (gz(523)+gz(524)+gz(525))/3;
gz(525) = gz(525);

%Impliment low pass filter
nfft = length(gz); %highst dimension of the signal
n = 2.^nextpow2(nfft);
%converting to freqency domain
fy = fft(gz,n);
f = Fs*(0:(n/2))/n;
P = abs(fy/n).^2;
cut_off = 1.5/Fs/2; %Niquest frequency
order = 32;
h = fir1(order,cut_off);
gz = filter(h,1,gz);

Gz = timeseries(gz,time');
Gz.name = 'forward';
Gz.TimeInfo.Units = 'milisecoends';
plot(Gz);

grid on;
legend('Gx','Gy','Gz');

%assign
%assign
r = zeros(1,col);
Reverse= [ax',ay',az',gx',gy',gz',r'];
save('Reverse.mat','Reverse');