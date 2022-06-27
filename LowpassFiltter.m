clear all; close all; clc;

Ts = 10e-3; %sampling period
Fs = 1/Ts; %sampling frequency
dt = 0:Ts:10-Ts; %signal duration (from 0 to duration of one sample to 10ms)

%plot data forward
filename = 'forward.csv';
M_f = csvread(filename);
time = M_f(:,1)';%Time
ax = M_f(:,2)'; %linear x
ay = M_f(:,3)'; %linear y
az = M_f(:,4)'; %linear z

gx = M_f(:,5)'; %linear x
gy = M_f(:,6)'; %linear y
gz = M_f(:,7)'; %linear z

%getting the FFT (Fast fourier transform to get the signal frequency)
nfft = length(ax); %highst dimension of the signal
n = 2.^nextpow2(nfft);

%converting to freqency domain
fy = fft(ax,n); %fast fourier transform will give magnitude and phase

%Define the frequency domain and plot unique frequencies
f = Fs*(0:(n/2))/n;
P = abs(fy/n).^2;

%plot(f,P(1:n/2 + 1));
%title('Gaussian Pulse in Frequency Domain');
%xlabel('Frequency (f)');
%ylabel('|P(f)|^2');

%fy = fy(1:n/2);
%xfft = Fs.*(0:n/2-1)/n;
%plot(xfft,abs(fy/max(fy)));

cut_off = 1.5/Fs/2; %Niquest frequency
%the minimum rate at which a signal can be sampled without introducing errors, 
%which is twice the highest frequency present in the signal.
order = 32;

h = fir1(order,cut_off);
con = conv(ax,h);

plot(con);