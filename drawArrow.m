
function drawArrow(windowPtr, arrLength, arrHeadLength, arrWidth, ...
    angle, centerCoords, direction, color)

% DRAWARROW - Draw arrow on Psychtoolbox window
%    This MATLAB function draws an arrow (pointing left or right) at a
%    specified location on a specified Psychtoolbox (PTB) window.
%
%    INPUT ARGUMENTS
%      windowPtr (int) - Index of the PTB window that the arrow ought to be
%                        drawn on.
%
%      arrLength (int) - Length of the shaft of the arrow in pixels.  Must
%                        be positive.
%
%      arrHeadLength (int) - Length of the bars that make up the arrowhead
%                            in pixels.  Must be positive.
%
%      arrWidth (int) - Thickness of the bars that make up the arrow in
%                       pixels.  Must be positive.
%
%      angle (double) - The angle between the shaft of the arrow and the
%                       bars that make up the arrowhead in degrees.  Must
%                       be positive and less than 90.
%
%      centerCoords (int) - Coordinates of the center of the shaft of the
%                           arrow in pixels.
%
%      direction (string) - Either "left" or "right".  Direction in which
%                           the arrow ought to point.
%
%      color (double) - 1 x 3 vector representing a color in RGB color
%                       space.  Can also be a single value (grayscale).
%                       Color range is assumed to be the normalized
%                       floating point number range 0.0 - 1.0.  Defaults to
%                       0 (i.e., black) if not specified.
%
%    ASSUMPTIONS & LIMITATIONS
%      Psychtoolbox (http://psychtoolbox.org) needs to be installed.
%      For system requirements regarding the use of Psychtoolbox, please
%      check http://psychtoolbox.org/requirements.html.

arguments
    windowPtr (1, 1) double {mustBeInteger}
    arrLength (1, 1) double {mustBeInteger, mustBePositive}
    arrHeadLength (1, 1) double {mustBeInteger, mustBePositive}
    arrWidth (1, 1) double {mustBeInteger, mustBePositive}
    angle (1, 1) double {mustBePositive, mustBeLessThan(angle, 90)}
    centerCoords (1, 2) double {mustBeInteger, mustBePositive}
    direction (1, 1) string {mustBeMember(direction, ["left", "right"])}
    color (1, 3) double { ...
        mustBeGreaterThanOrEqual(color, 0), ...
        mustBeLessThanOrEqual(color, 1) ...
        } = 0
end

halfArrLength = floor(arrLength ./ 2);  % in pixels

% Compute coordinates of shaft of the arrow
arrShaftCoords = [-halfArrLength, halfArrLength; 0, 0];

% Compute coordinates of the arrowhead
vertDisplacement = sind(angle) .* arrHeadLength;
hrzDisplacement = halfArrLength - cosd(angle).*arrHeadLength;

% NOTE: We compute the x-coordinates for an arrow pointing to the right. If
% 'direction' is set to "left", we simply flip the sign of these
% coordinates afterwards.
xCoordsArrHead = [halfArrLength, hrzDisplacement, ...
    halfArrLength, hrzDisplacement];
yCoordsArrHead = [0, vertDisplacement, 0, -vertDisplacement];

if strcmp(direction, "left")
    xCoordsArrHead = -xCoordsArrHead;
end

arrHeadCoords = [xCoordsArrHead; yCoordsArrHead];

% Combine coordinates into single matrix
allCoords = [arrShaftCoords, arrHeadCoords];

% Draw arrow
Screen('DrawLines', windowPtr, ...
    allCoords, arrWidth, color, centerCoords, 2);

end
