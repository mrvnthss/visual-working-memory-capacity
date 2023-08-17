
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
nTrials = 20;

% (Orthogonal) distance from eye to screen in mm
viewingDistanceMM = 600;  % in mm

% 'Progress.thresholdPct' can be modified to control how often the
% participant is informed about his/her progress
% EXAMPLE: By setting 'Progress.thresholdPct' to 20, the participant is
% informed about his/her progress after 20 %, 40 %, 60 % and 80 % of all
% trials.
% NOTE: While this script does work for arbitrary numbers between 1 and 100,
% the value of 'Progress.thresholdPct' should be chosen reasonably.
% Sensible choices would be 5 %, 10 %, 20 % or 25 %.
Progress.thresholdPct = 20;  % in pct

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

% Set text size, font, and color
% NOTE: This script was developed on a 16" laptop.  For laptops of
% different sizes, 'txtSize' will most likely need some adjustment.
txtSize = 40;
txtFont = 'Helvetica';
txtColor = 0;

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

% Error message that is printed to the command window if an invalid sex
% was entered into the dialog box that is opened at the beginning of the
% experiment
Msg.errorInvalidSex = ['Participant sex is not valid, expected ' ...
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
backgroundColor = 0.4;

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

% Store color names for analysis purposes
colorNames = ["red"; "blue"; "violet"; "green"; ...
    "yellow"; "black"; "white"];


%------------------------------------------------------------------
%       POSITIONING AND SIZE OF FIXATION CROSS & ARROW
%------------------------------------------------------------------

% Set length and vertical displacement of arrow in degrees of visual angle
arrLengthVA = 2;            % in degrees of visual angle
arrVertDisplacementVA = 1;  % in degrees of visual angle

% Convert length of arrow from degrees of visual angle to pixels
Arrow.length = round(visualAngleToSize( ...
    arrLengthVA, viewingDistanceMM) * Config.pixelsPerMM);  % in pixels

% Set length of the arrowhead relative to length of the shaft of the arrow
Arrow.headLength = floor(Arrow.length / 3);  % in pixels

% Convert vertical displacement from degrees of visual angle to pixels
arrVertDisplacementPixels = round(visualAngleToSize( ...
    arrVertDisplacementVA, viewingDistanceMM) * Config.pixelsPerMM);  % in pixels

% Compute center of arrow
% NOTE: The fixation cross will be placed at the center of the screen.
% The arrow will be presented slightly above the fixation cross.
Arrow.center = Config.center - [0, arrVertDisplacementPixels];

% Set width of arrow and angle between shaft and arrowhead
Arrow.width = 5;   % in pixels
Arrow.angle = 40;  % in degrees

% Size and thickness of the fixation cross
fixCrossVA = 0.5;  % in degrees of visual angle
FixCross.size = round(visualAngleToSize( ...
    fixCrossVA, viewingDistanceMM) * Config.pixelsPerMM);  % in pixels
FixCross.width = 2;  % in pixels

% Clean up workspace
clear arrLengthVA arrVertDisplacementPixels arrVertDisplacementVA ...
    fixCrossVA


%------------------------------------------------------------------
%       TRIAL STRUCTURE & SETUP
%------------------------------------------------------------------

% NOTE: 'Order' will be used to randomize the order of trials
Order = randperm(nTrials)';

% Randomize stimulus onset asynchrony
StimOnsetAsyncSecs = Duration.stimOnsetAsyncMinSecs + ( ...
    Duration.stimOnsetAsyncMaxSecs - Duration.stimOnsetAsyncMinSecs ...
    ) .* rand(nTrials, 1);

% Little helper variable to set up trial conditions
quartiles = floor(quantile(1:nTrials, [0.25, 0.5, 0.75]));

% In half of the trials, participants will have to remember the squares in
% the left hemisphere.  In the other half of the trials, they will have to
% remember the squares in the right hemisphere.
Hemifield = strings(nTrials, 1);
Hemifield(1:quartiles(2)) = "left";
Hemifield(quartiles(2)+1:end) = "right";

% In each of the two conditions (left hemifield vs. right hemifield), the
% memory array will be identical in exactly half of all trials of that
% condition.
IdenticalArrays = true(nTrials, 1);
IdenticalArrays( ...
    [quartiles(1)+1:quartiles(2), quartiles(3)+1:end] ...
    ) = false;

% For each trial, we randomly choose the squares' colors from the 7 colors
% specified in the 'colorArray' cell array.
% NOTE: Following Vogel & Machizawa (2004), we let no color appear more
% than twice in a single memory array.
ColorsLeft = NaN(nTrials, nSquares);   % array colors (left hemifield)
ColorsRight = NaN(nTrials, nSquares);  % array colors (right hemifield)
colorCodes = repelem(1:nColors, 2);    % colors to choose from
for iTrial = 1:nTrials
    % Memory array for left hemisphere
    selectedColors = randperm(length(colorCodes), nSquares);
    ColorsLeft(iTrial, :) = colorCodes(selectedColors);

    % Memory array for right hemisphere
    selectedColors = randperm(length(colorCodes), nSquares);
    ColorsRight(iTrial, :) = colorCodes(selectedColors);
end

% For those trials in which memory and test array do not match, we randomly
% select a square that changes color.
OddSquare = randi(nSquares, nTrials, 1);
OddSquare(IdenticalArrays) = NaN;

% Select the color that the square changes to in non-identical trials
OddColor = NaN(nTrials, 1);
for iTrial = 1:nTrials
    % Only select an odd color in non-identical trials
    if ~IdenticalArrays(iTrial)
        % Get initial color of square that ought to change color
        if strcmp(Hemifield(iTrial), "left")
            initColor = ColorsLeft(iTrial, OddSquare(iTrial));
        else
            initColor = ColorsRight(iTrial, OddSquare(iTrial));
        end

        % Select a new color at random
        possibleColors = colorCodes(colorCodes ~= initColor);
        OddColor(iTrial) = possibleColors(randi(length(possibleColors)));
    end
end

% Combine all variables into a single table
trials = table(Order, StimOnsetAsyncSecs, Hemifield, IdenticalArrays, ...
    ColorsLeft, ColorsRight, OddSquare, OddColor);

% Randomize order of trials
trials = sortrows(trials, 'Order');

% Clean up workspace
clear colorCodes ColorsLeft ColorsRight Hemifield IdenticalArrays ...
    initColor nColors OddSquare Order possibleColors quartiles ...
    selectedColors StimOnsetAsyncSecs


%----------------------------------------------------------------------
%   RECORD PARTICIPANT DATA
%----------------------------------------------------------------------

% Record some basic data of our participant using a dialog box
prompt = {'Participant ID (1 - 999):', ...
    'Please enter your sex (m/w/d):', ...
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
Participant.sex = answer{2};
Participant.age = str2double(answer{3});

% Ensure that the data provided by the participant is valid
%   a) Check participant ID (expected to be integer between 1 and 999)
assert(isnumeric(Participant.id) && isreal(Participant.id) && ...
    isfinite(Participant.id) && mod(Participant.id, 1) == 0 && ...
    1 <= Participant.id && Participant.id <= 999, Msg.errorInvalidID);

%   b) Check participant sex (expected to be one of 'm', 'w', 'd')
assert(ismember(Participant.sex, {'m', 'w', 'd'}), ...
    Msg.errorInvalidSex);

%   c) Check participant age (expected to be positive integer)
assert(isnumeric(Participant.age) && isreal(Participant.age) && ...
    isfinite(Participant.age) && mod(Participant.age, 1) == 0 && ...
    Participant.age > 0, Msg.errorInvalidAge);

% We use the above information to create a unique filename to store the
% results of the experiment
Participant.id = sprintf('%03d', Participant.id);
t = datetime("now", "Format", "MM-dd-yyyy_HHmm");
filename = upper( ...
    [Participant.id, '_', Participant.sex, num2str(Participant.age), ...
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
    [windowPtr, windowRect] = PsychImaging('OpenWindow', ...
        Config.screenNumber, backgroundColor, Config.winRect);

    % Hide cursor
    HideCursor(Config.screenNumber);

    % Set text size & font
    Screen('TextSize', windowPtr, txtSize);
    Screen('TextFont', windowPtr, txtFont);

    % Enable antialiasing
    Screen('BlendFunction', ...
        windowPtr, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);


%------------------------------------------------------------------
%       OBTAIN TIMING INFORMATION
%------------------------------------------------------------------

    % Query frame duration
    Config.ifi = Screen('GetFlipInterval', windowPtr);

    % Set priority to maximum priority
    Priority(MaxPriority(windowPtr));

    % Convert presentation durations from seconds to number of frames
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
        'center', 'center', txtColor);
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
                'center', 'center', txtColor);
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

        % STEP 1: Prepare for trial
        %   1.1 Query stimulus onset asynchrony (in secs) and convert to
        %   number of frames
        stimOnsetAsyncSecs = trials.StimOnsetAsyncSecs(iTrial);
        stimOnsetAsyncFrames = round(stimOnsetAsyncSecs / Config.ifi);

        %   1.2 Query positioning and colors of squares in memory array

        % STEP 2: Display fixation cross
        %   2.1 Draw fixation cross at the center of the screen
        %   NOTE: Type "help drawFixationCross" into the command window for
        %   further information.
        drawFixationCross(windowPtr, FixCross.size, FixCross.width, ...
            Config.center, txtColor);
        
        %   2.2 Flip fixation cross to screen
        %   NOTE: We set 'dontclear' (fourth argument) to 1 for
        %   incremental drawing (since we also want the fixation cross
        %   to be displayed when the arrow is presented next)
        [~, stimulusOnsetTime] = Screen('Flip', windowPtr, [], 1);

        % STEP 3: Display arrow indicating left vs. right
        %   3.1 Draw arrow
        %   NOTE: Type "help drawArrow" into the command window for further
        %   information.
        drawArrow(windowPtr, Arrow.length, Arrow.headLength, ...
            Arrow.width, Arrow.angle, Arrow.center, ...
            trials.Hemifield(iTrial));

        %   3.2 Flip arrow to screen
        [~, stimulusOnsetTime] = Screen('Flip', windowPtr, ...
            stimulusOnsetTime + (stimOnsetAsyncFrames-0.5) * Config.ifi);

        % STEP 4: Display memory array
        %   4.1 Draw memory array (and fixation cross)
        drawFixationCross(windowPtr, FixCross.size, FixCross.width, ...
            Config.center, txtColor);

        %   4.2 Flip memory array (and fixation cross) to screen
        [~, stimulusOnsetTime] = Screen('Flip', windowPtr, ...
            stimulusOnsetTime + (Duration.arrowFrames-0.5) * Config.ifi);

        % STEP 5: Retention interval
        %   5.1 Draw fixation cross
        drawFixationCross(windowPtr, FixCross.size, FixCross.width, ...
            Config.center, txtColor);

        %   5.2 Erase memory array and flip fixation cross to screen
        %   NOTE: We're again using incremental drawing here
        [~, stimulusOnsetTime] = Screen('Flip', windowPtr, ...
            stimulusOnsetTime + ...
            (Duration.memoryArrayFrames-0.5) * Config.ifi, 1);

        % STEP 6: Display test array and check for response
        %   6.1 Draw test array

        %   6.2 Flip test array to screen
        [~, stimulusOnsetTime] = Screen('Flip', windowPtr, ...
            stimulusOnsetTime + ...
            (Duration.retentionIntervalFrames-0.5) * Config.ifi);
    end

    % Clean up workspace
    clear iTrial keyCode nTrials stimOnsetAsyncFrames stimOnsetAsyncSecs ...
        stimulusOnsetTime


%----------------------------------------------------------------------
%   END OF EXPERIMENT
%----------------------------------------------------------------------

    % Wipe screen
    Screen('Flip', windowPtr);
    WaitSecs(0.5);

    % Present thank-you-message to participant
    for secs = 10:-1:1
        DrawFormattedText(windowPtr, sprintf(Msg.thankYou, secs), ...
            'center', 'center', txtColor);
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
    clear ans iTrial keyCode nTrials secs stimOnsetAsyncFrames ...
        stimOnsetAsyncSecs stimulusOnsetTime

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
