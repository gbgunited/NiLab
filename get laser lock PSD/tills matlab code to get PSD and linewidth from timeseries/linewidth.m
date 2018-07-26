%script from Till Rosenband

fname='t0006ch2mod.csv';'t0007ch2mod.csv';'T0005CH2mod.csv';'t0001ch4.csv';
V = csvread(fname);   %V sampled at 1MS/s for 100ms(?)
%V=V(:,5)
plot(V);

dt =  1.60E-07;%006 1.60E-06;%007 8.00E-09; 8.00E-07;   %sample period
%dt = 8/1e6;    %sample period

HzPerVolt=48935.2/1.25;
%HzPerVolt=25e6/14.2*0.32/0.952
%HzPerVolt=25e6/7.0*0.12/1.22; %MHz/V

V = V-mean(V);
f = (V)*HzPerVolt;
omega = f*2*pi; %time series of angular frequency deviation 
omega0 = 2*pi*1e6;

phi = cumsum(omega*dt);

t = (0:(length(phi)-1))*dt;
T = t(end)
Nave = 10;

Efield = exp(complex(0,phi)); %+omega0*t'));

[P fp]=psd_fft_averaged(Efield', dt, T/Nave);
%[P fp]=psd_fft(Efield', dt);
rbw = fp(2)-fp(1);
N = length(fp)

P = P*rbw/2; %multiplied by 2/rbw in fft b/c one-sided PSD. (so this expr gives abs(fft^2))
disp('ok')

[Pf fpf]=psd_fft_averaged(f', dt, T/Nave);
%[Pf fpf]=psd_fft(f', dt);
nPlot=3000;
semilogy(fp(1:nPlot), Pf(1:nPlot)*1e-6, '-r')

hold on;
semilogy(fp(1:nPlot), P(1:nPlot), '-b','linewidth',3)
hold off;

grid on;
disp('ok ok')
xlabel('Frequency [Hz]');
ylabel('PSD (1/RBW)');
legend({'(kHz)^2/Hz','E'});
title(sprintf('%s RBW = %.1f Hz  %3.6f %% Power in 0 Hz bin', fname, rbw, P(1)*100), 'Interpreter', 'none');