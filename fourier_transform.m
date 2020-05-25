freq_1 = 1;
freq_2 = 15;

t = 0:0.001:1;

signal_1 = sin(2*pi*freq_1*t);
signal_2 = 0.25*sin(2*pi*freq_2*t);
signal_sum = signal1 + signal2;

clf;
hold on;

figure(1);
plot(t, signal_1, 'r-');
plot(t, signal_2, 'b-');
plot(t, signal_sum, 'k-')

FT = fft(signal_sum);
L = length(FT)/20; % just take the heads

figure(2);
% since the 0Hz signal is the first element
% of the frequency domain, we have to eliminate
% it from our data
freq_domain = abs(FT(2:L));
plot(freq_domain, 'k-');