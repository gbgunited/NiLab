function [p, f]=psd_fft_averaged(y, dt, averaging_length)
% function [p, f]=psd_fft_averaged(y, dt, averaging_length)
% return one-sided power spectral density for y(t) 
% with sample period dt in units of Power / Hz
% rbw = 1/averaging_length
% f = (0:(N-1))*rbw
%
N=length(y);
rbw = 1/(N*dt);
f = (0:(N-1))*rbw;

n_per_ave = floor(averaging_length/dt); % number of samples per averaged set
n_ave = floor(N/n_per_ave); % number of sets to average

p = zeros(1, n_per_ave);

for i=1:n_ave
    i0 = 1+(i-1)*n_per_ave;
    i1 = i*n_per_ave;
    
    [p_new, f] = psd_fft(y(i0:i1), dt);
    p = p + p_new;
end

p = p/n_ave;

p = p(1:floor(n_per_ave/2));
f = f(1:floor(n_per_ave/2));
