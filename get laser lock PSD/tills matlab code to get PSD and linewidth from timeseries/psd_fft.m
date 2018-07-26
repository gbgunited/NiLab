function [p, f]=psd_fft(y, dt)
% function [p, f]=psd_fft(y, dt)
% return one-sided power spectral density for y(t) 
% with sample period dt in units of Power / Hz.
N=length(y);
rbw = 1/(N*dt);
ff = fft(y) / N;
p = 2 * abs(ff) .^2 / rbw; %since one sided, multiply by 2.
f = (0:(N-1))*rbw;

% still need to truncate p and f list by half. otherwise, it will show way
% more freq than accurate
%though, if use psd_fft_averaged(), then it's correct