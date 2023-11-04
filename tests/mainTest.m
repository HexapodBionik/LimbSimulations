function tests = mainTest
tests = functiontests(localfunctions);
end

function fakeInverseTest(testCase)
     % Get the current file path
    currentFile = mfilename('fullpath');
    
    % Determine the path to the root directory
    rootPath = fileparts(fileparts(currentFile)); % Assumes tests/fancyTest.m
    
    % Construct the path to your root directory scripts
    rootScriptPath = fullfile(rootPath, 'code');
    
    % Add the root directory to the MATLAB path
    addpath(rootScriptPath);

    a = fake_inverse(0, 0, 0);
    verifyEqual(testCase, a, [15, 30, 45]);
end