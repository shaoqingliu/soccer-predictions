warning('off', 'MATLAB:table:ModifiedVarnames');
dataPath = '../../data/';
reqPaths = {...
    dataPath, ...
    'gls', ...
    'mcs', ...
    'minq5', ...
    '../utilities', ...
    '../objects', ...
    '../reader', ...
    '../writer', ...
    'LSSVMlabv1_8_R2009b_R2011a'};
n = length(reqPaths);
i = 1;

while (i <= n)
  addpath(genpath(fullfile(pwd, reqPaths{i})));
  i = i + 1;
end
