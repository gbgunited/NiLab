load('data_20180107_173345.mat')
csvwrite('surv.csv',Analysis.SurvivalProbability)
csvwrite('survErr.csv',Analysis.SurvivalProbabilityErr)
csvwrite('params.csv',Analysis.UniqueParameters)