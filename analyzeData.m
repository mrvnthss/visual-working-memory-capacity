
% PURPOSE: Analyze data collected via the 'WorkingMemoryCapacity.m' script
% 
% CONTEXT: Final exam of the course "Programming for Behavioral and
%          Neurosciences" at Justus Liebig University Giessen
%          <https://www.uni-giessen.de>
% 
% AUTHOR: 2023 Marvin Theiss
% 
% LICENSE: MIT License
% 
% Copyright (c) 2023 Marvin Theiss
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.


%----------------------------------------------------------------------
%   OBTAIN NAMES OF VALID DATASETS
%----------------------------------------------------------------------

% Obtain the names of all .csv-files located in the 'data' folder
datasets = struct2table(dir(fullfile('data', '*.csv')));
datasets = string(datasets.name);

% Include only files with valid data (i.e., no "INCOMPLETE_..." files)
pat = digitsPattern(3) + "_" + digitsPattern(2) + "-ITEMS_" ...
    + digitsPattern(4) + "-" + digitsPattern(2) + "-" + digitsPattern(2) ...
    + "_" + alphanumericsPattern(2) + ".csv";
datasets = datasets(matches(datasets, pat));

nDatasets = length(datasets);

% Clean up workspace
clear pat


%----------------------------------------------------------------------
%   ANALYZE DATA
%----------------------------------------------------------------------

% Preallocate table to store final results
varNames = ["ParticipantID", "Items", "Trials", "HitRate", ...
    "FalseAlarmRate", "Capacity"];

varTypes = ["double", "double", "double", "double", "double", "double"];

analyzedData = table('Size', [nDatasets, length(varNames)], ...
    'VariableTypes', varTypes, 'VariableNames', varNames);

for iDataset = 1:nDatasets
    % Construct filepath
    fileName = datasets{iDataset};
    filePath = fullfile('data', fileName);

    % Read and filter data
    results = readtable(filePath);
    validTrials = results.Order ~= 0 & ~strcmp(results.Response, '');
    results = results(validTrials, :);

    % Collect metadata
    participantID = str2double(extractBefore(fileName, '_'));
    nItems = str2double(cell2mat(extractBetween(fileName, '_', '-ITEMS')));

    % Analyze data
    nTrials = length(results.Order);
    nIdentical = sum(results.IdenticalArrays);
    nDifferent = sum(~results.IdenticalArrays);
    nHits = sum( ...
        ~results.IdenticalArrays & strcmp(results.Response, 'different'));
    nFalseAlarms = sum( ...
        results.IdenticalArrays & strcmp(results.Response, 'different'));

    % Compute working memory capacity based on a formula developed by
    % Cowan (2001) who had improved on an earlier version proposed by
    % Pashler (1988)
    hitRate = nHits / nDifferent;
    falseAlarmRate = nFalseAlarms / nIdentical;
    capacity = nItems * (hitRate - falseAlarmRate);

    % Add to 'analyzedData' table
    analyzedData(iDataset, :) = table(participantID, nItems, nTrials, ...
        hitRate, falseAlarmRate, capacity);
end

% Sort table
analyzedData = sortrows( ...
    analyzedData, ["ParticipantID", "Items"], "ascend");

% Clean up workspace
clear capacity falseAlarmRate fileName filePath hitRate iDataset ...
    nCorrectRejects nDifferent nFalseAlarms nHits nIdentical nItems ...
    nMisses nTrials participantID results validTrials varNames varTypes


%----------------------------------------------------------------------
%   DISPLAY RESULTS
%----------------------------------------------------------------------

% Clear command window and display results
clc
disp(analyzedData);
