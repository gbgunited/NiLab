

mkdir output1-res80/FCF_84kHz

fcf = fcfs('a3Sigma','c3Sigma', 84e3, 0, 80, 1:252, 1:252);
csvwrite('output1-res80/FCF_84kHz/a3sigma_c3sigma.csv', fcf);

% fcf = fcfs('a3Sigma','b3Pi', 70e3, 0, 100, 1:100, 1:252);
% csvwrite('output1/FCF_70kHz/a3sigma_b3pi.csv', fcf);

