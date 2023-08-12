
% PURPOSE: An implementation of a visual working memory capacity experiment
%          by Vogel & Machizawa (2004).  The research article can be found
%          at <https://www.nature.com/articles/nature02447>.
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
%   CLEAN UP & CONFIGURE PTB
%----------------------------------------------------------------------

sca
close all
clear
clc

% Perform basic configuration of PTB parameters
% NOTE: Type "help configurePsych" into the command window for details on
% how to modify this command to fit your needs.
Config = configurePsych();

% Seed the random number generator
rng('shuffle')


%----------------------------------------------------------------------
%   EXPERIMENTAL SETUP
%----------------------------------------------------------------------

%------------------------------------------------------------------
%       CONFIGURATION OF EXPERIMENT
%------------------------------------------------------------------

% Set number of colored squares per hemifield
% NOTE: Parameters used by Vogel & Machizawa (2004): 1, 2, 3, 4, 6, 8, 10
nSquares = 4;

% Total number of trials
% NOTE: Vogel & Machizawa (2004) conducted 240 trials per condition
nTrials = 240;

% 'Progress.thresholdPct' can be modified to control how often the
% participant is informed about his/her progress
% EXAMPLE: By setting 'Progress.thresholdPct' to 20, the participant is
% informed about his/her progress after 20 %, 40 %, 60 % and 80 % of all
% trials.
% NOTE: While this script does work for arbitrary numbers between 1 and 100,
% the value of 'Progress.thresholdPct' should be chosen reasonably.
% Sensible choices would be 5 %, 10 %, 20 % or 25 %.
Progress.thresholdPct = 10;  % in pct

% Set range to be used for the SOA (values are the ones used by Vogel &
% Machizawa (2004))
Duration.stimOnsetAsyncMinSecs = 0.3;  % in secs
Duration.stimOnsetAsyncMaxSecs = 0.4;  % in secs

% Set remaining timing parameters for the experiment (again, values are the
% ones used by Vogel & Machizawa (2004))
Duration.arrowSecs = 0.2;              % in secs
Duration.memoryArraySecs = 0.1;        % in secs
Duration.retentionIntervalSecs = 0.9;  % in secs
Duration.testArraySecs = 2;            % in secs

% Set text size and font
% NOTE: This script was developed on a 16" laptop.  For laptops of
% different sizes, 'txtSize' will most likely need some adjustment.
txtSize = 40;
txtFont = 'Helvetica';

% If the PTB window is opened in 'debugMode' (i.e., the window only covers
% 25 % of the screen), we scale down the text size accordingly
if Config.debugMode
    txtSize = round(0.5 * txtSize);
end


%------------------------------------------------------------------
%       KEYBOARD SETTINGS
%------------------------------------------------------------------

% NOTE: The command "KbName('UnifyKeyNames')" is automatically executed by
% the command 'PsychDefaultSetup(2)', which is issued within the function
% 'configurePsych'.  The latter is called at the very beginning of this
% script.

% Set keys
% NOTE: The space bar will be used by participants to navigate through
% instructions.  To indicate a decision, participants will press either 'j'
% (indicating identical arrays) or 'f' (indicating different arrays).
% Finally, the escape key can be used to prematurely end the experiment
% between blocks of trials.
Key.space = KbName('space');
Key.identical = KbName('j');
Key.different = KbName('f');
Key.escape = KbName('ESCAPE');


%------------------------------------------------------------------
%       INSTRUCTION/ERROR MESSAGES
%------------------------------------------------------------------

% Message to be displayed at the very beginning of the experiment
Msg.instructions = ['\n\n' ...
    'Press space to start the first block of trials.'];

% Message to be displayed to inform the participant about his/her progress
Msg.progress = ['You have completed %d %% of all trials.\n\n' ...
    'Press space to start the next block of trials.'];

% Thank-you-message presented at the end of the experiment
Msg.thankYou = ['You have completed the experiment!\n' ...
    'Thank you for participating!\n\n' ...
    'This window will close automatically in: %d'];

% Error message that is printed to the command window if the participant
% does not provide any information through the dialog box
Msg.errorNoInput = ['No participant information was entered into the ' ...
    'dialog box. Please start the experiment again.'];

% Error message that is printed to the command window if an invalid
% participant ID was entered into the dialog box that is opened at the
% beginning of the experiment
Msg.errorInvalidID = ['Participant ID is not valid, expected an ' ...
    'integer between 1 and 999!'];

% Error message that is printed to the command window if an invalid gender
% was entered into the dialog box that is opened at the beginning of the
% experiment
Msg.errorInvalidGender = ['Participant gender is not valid, expected ' ...
    'one of m, w, d!'];

% Error message that is printed to the command window if an invalid
% participant age was entered into the dialog box that is opened at the
% beginning of the experiment
Msg.errorInvalidAge = ['Participant age is not valid, expected a ' ...
    'positive integer!'];

% Error message that is printed to the command window if participant ends
% the experiment prematurely
Msg.errorExptAborted = ['The participant has ended the experiment ' ...
    'prematurely.\n' ...
    'A total of %d trials out of %d trials have been completed.\n' ...
    'All data collected so far was saved.'];


%------------------------------------------------------------------
%       STIMULI SETUP
%------------------------------------------------------------------

% Define background color
% NOTE: Vogel & Machizawa (2004) used a gray background with a luminance of
% 8.2 cd/m^2
backgroundColor = 0.5;

% Use black as text color for instructions
textColor = 0;

% Define colors used for the squares
nColors = 7;
colorArray = cell(nColors, 1);

% NOTE: Qualitatively, these colors are the ones used by Vogel & Machizawa
% (2004).
colorArray{1} = [1, 0, 0];      % red
colorArray{2} = [0, 0, 1];      % blue
colorArray{3} = [0.561, 0, 1];  % violet
colorArray{4} = [0, 1, 0];      % green
colorArray{5} = [1, 1, 0];      % yellow
colorArray{6} = [0, 0, 0];      % black
colorArray{7} = [1, 1, 1];      % white

% Store color names for analysis
colorNames = ["red", "blue", "violet", "green", "yellow", "black", "white"];

% Clean up workspace
clear nColors


%------------------------------------------------------------------
%       POSITIONING OF SQUARES, FIXATION CROSS & ARROW
%------------------------------------------------------------------


%------------------------------------------------------------------
%       TRIAL STRUCTURE
%------------------------------------------------------------------

% Set up a table that stores all information needed to control/conduct the
% experiment.  We also use this table to store the participant's responses.
varNames = ["Hemifield", "IdenticalArrays", "Colors", "ColorNames"];

varTypes = ["string", "logical", "double", "string"];

% Preallocate table
trials = table('Size', [nTrials, length(varNames)], ...
    'VariableTypes', varTypes, 'VariableNames', varNames);

% Clean up workspace
clear varNames varTypes


%----------------------------------------------------------------------
%   RECORD PARTICIPANT DATA
%----------------------------------------------------------------------

% Record some basic data of our participant using a dialog box
prompt = {'Participant ID (1 - 999):', ...
    'Please enter your gender (m/w/d):', ...
    'Please enter your age:'};
dlgtitle = 'Participant Data';
dims = [1, 40];
answer = inputdlg(prompt, dlgtitle, dims);

% Check if the participant closed the dialog box or clicked on 'Cancel'
if isempty(answer)
    error(Msg.errorNoInput);
end

% Store input in struct 'Participant'
Participant.id = str2double(answer{1});
Participant.gender = answer{2};
Participant.age = str2double(answer{3});

% Ensure that the data provided by the participant is valid
%   a) Check participant ID (expected to be integer between 1 and 999)
assert(isnumeric(Participant.id) && isreal(Participant.id) && ...
    isfinite(Participant.id) && mod(Participant.id, 1) == 0 && ...
    1 <= Participant.id && Participant.id <= 999, Msg.errorInvalidID);

%   b) Check participant gender (expected to be one of 'm', 'w', 'd')
assert(ismember(Participant.gender, {'m', 'w', 'd'}), ...
    Msg.errorInvalidGender);

%   c) Check participant age (expected to be positive integer)
assert(isnumeric(Participant.age) && isreal(Participant.age) && ...
    isfinite(Participant.age) && mod(Participant.age, 1) == 0 && ...
    Participant.age > 0, Msg.errorInvalidAge);

% We use the above information to create a unique filename to store the
% results of the experiment
Participant.id = sprintf('%03d', Participant.id);
t = datetime("now", "Format", "MM-dd-yyyy_HHmm");
filename = upper( ...
    [Participant.id, '_', Participant.gender, num2str(Participant.age), ...
    '_', char(t)]);
filename = fullfile('data', [filename, '.csv']);

% Make sure that subdirectoy 'data' exists
if ~isfolder('data')
    mkdir data
end

% Clean up workspace
clear answer dims dlgtitle prompt t


%----------------------------------------------------------------------
%   OPEN PTB WINDOW
%----------------------------------------------------------------------

try
    % Skip sync tests depending on configuration of 'Config.skipTest'
    Screen('Preference', 'SkipSyncTests', Config.skipTest);

    % Enable listening for keyboard input & suppress any output of key
    % presses to MATLAB windows (e.g., this script)
    % NOTE: Inside the function 'shutDown', the command 'ListenChar(0)' is
    % issued to turn off character listening and re-enable keyboard input!
    ListenChar(2);

    % Open new PTB window with gray background
    [windowPtr, windowRect] = PsychImaging( ...
        'OpenWindow', Config.screenNumber, backgroundColor, Config.winRect);

    % Hide cursor
    HideCursor(Config.screenNumber);

    % Set text size & font
    Screen('TextSize', windowPtr, txtSize);
    Screen('TextFont', windowPtr, txtFont);

    % Enable antialiasing
    Screen('BlendFunction', windowPtr, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


%------------------------------------------------------------------
%       OBTAIN TIMING INFORMATION
%------------------------------------------------------------------

    % Query frame duration
    Config.ifi = Screen('GetFlipInterval', windowPtr);

    % Set priority to maximum priority
    Priority(MaxPriority(windowPtr));

    % Convert all presentation durations from seconds to number of frames
    Duration.stimOnsetAsyncMinFrames = round( ...
        Duration.stimOnsetAsyncMinSecs / Config.ifi);  % in frames
    Duration.stimOnsetAsyncMaxFrames = round( ...
        Duration.stimOnsetAsyncMaxSecs / Config.ifi);  % in frames
    Duration.arrowFrames = round( ...
        Duration.arrowSecs / Config.ifi);              % in frames
    Duration.memoryArrayFrames = round( ...
        Duration.memoryArraySecs / Config.ifi);        % in frames
    Duration.retentionIntervalFrames = round( ...
        Duration.retentionIntervalSecs / Config.ifi);  % in frames
    Duration.testArrayFrames = round( ...
        Duration.testArraySecs / Config.ifi);          % in frames


%----------------------------------------------------------------------
%   START OF EXPERIMENT
%----------------------------------------------------------------------

    % Compute the number of trials that correspond to multiples of 
    % 'Progress.thresholdPct' % of all trials
    Progress.nSteps = round(100 / Progress.thresholdPct);
    Progress.stepArray = round(linspace(0, nTrials, Progress.nSteps + 1));

    % Drop first entry (which is always equal to 0)
    Progress.stepArray = Progress.stepArray(2:end);

    % Present general instructions to participant
    DrawFormattedText(windowPtr, Msg.instructions, ...
        'center', 'center', textColor);
    Screen('Flip', windowPtr);

    % Increase text size by 50 % for rest of experiment
    Screen('TextSize', windowPtr, 1.5 * txtSize);

    % Wait for participant to press the space bar to start the first trial
    KbReleaseWait(Config.keyboard);
    while true
        [~, ~, keyCode] = KbCheck(Config.keyboard);
        % Exit while-loop and continue if space bar has been pressed, else
        % continue checking the keyboard for input
        if keyCode(Key.space)
            break
        end
    end


%------------------------------------------------------------------
%       LOOP OVER INDIVIDUAL TRIALS
%------------------------------------------------------------------

    for iTrial = 1:nTrials
        % STEP 0: Report progress to participant
        if ismember(iTrial - 1, Progress.stepArray)
            % Compute progress
            Progress.completed = round((iTrial - 1) / nTrials * 100);  % in pct

            % Display progress to participant
            DrawFormattedText(windowPtr, ...
                sprintf(Msg.progress, Progress.completed), ...
                'center', 'center', textColor)
            Screen('Flip', windowPtr);

            % Wait for participant to press the space bar to start the
            % next block of trials
            KbReleaseWait(Config.keyboard);
            while true
                [~, ~, keyCode] = KbCheck(Config.keyboard);
                if keyCode(Key.space)
                    break
                end
            end
        end
    end

    % Clean up workspace
    clear iTrial keyCode nTrials


%----------------------------------------------------------------------
%   END OF EXPERIMENT
%----------------------------------------------------------------------

    % Wipe screen
    Screen('Flip', windowPtr);
    WaitSecs(0.5);

    % Present thank-you-message to participant
    for secs = 10:-1:1
        DrawFormattedText(windowPtr, sprintf(Msg.thankYou, secs), ...
            'center', 'center', textColor);
        Screen('Flip', windowPtr);
        WaitSecs(1);
    end

    % Wipe screen again before shutting down
    Screen('Flip', windowPtr);
    WaitSecs(0.5);

    % Clean up workspace
    clear ans secs


%------------------------------------------------------------------
%       SAVE DATA & SHUT DOWN
%------------------------------------------------------------------

    writetable(trials, filename, 'Delimiter', ',');

    % Turn off character listening, re-enable keyboard input and close all
    % open screens
    shutDown();


%----------------------------------------------------------------------
%   ERROR HANDLING
%----------------------------------------------------------------------

catch errorMessage
    % We indicate that the stored data is incomplete by appending '_ERROR'
    % to the name of the file we save
    filename = strrep(filename, '.csv', '_ERROR.csv');
    writetable(trials, filename, 'Delimiter', ',');

    % Clean up workspace
    clear ans iTrial keyCode nTrials secs

    % Turn off character listening, re-enable keyboard input and close all
    % open screens
    shutDown();

    % Rethrow error message for debugging purposes
    rethrow(errorMessage);
end


%----------------------------------------------------------------------
%   HELPER FUNCTION(S)
%----------------------------------------------------------------------

function shutDown()
% SHUTDOWN - Turn off character listening and close all open screens
    ListenChar(0);
    Screen('CloseAll');
end
