load('data_20180207_213819.mat')
csvwrite('surv.csv',Analysis.SurvivalProbability)
csvwrite('survErr.csv',Analysis.SurvivalProbabilityErr)
csvwrite('params.csv',Analysis.UniqueParameters)