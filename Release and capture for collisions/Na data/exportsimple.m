load('data_20180107_173345.mat')

csvwrite('paramList.csv',ParamList);
csvwrite('images.csv',Scan.Images);
%csvwrite('survErr.csv',Analysis.SurvivalProbabilityErr);
%csvwrite('params.csv',Analysis.UniqueParameters);
%csvwrite('file.csv',filename);
