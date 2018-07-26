load('data_20180207_152657.mat')
csvwrite('surv.csv',Analysis.SurvivalProbability)
csvwrite('survErr.csv',Analysis.SurvivalProbabilityErr)
csvwrite('params.csv',Analysis.UniqueParameters)