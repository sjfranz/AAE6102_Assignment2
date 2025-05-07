% Load skymask data
skymask = readmatrix('skymask_A1_urban.csv');

az = skymask(:, 1);
el = skymask(:, 2);


% Combine azimuth and elevation into a matrix
skyMaskData = [az, el];

% Sort rows based on azimuth angles
skyMaskData = sortrows(skyMaskData, 1);

% Separate the sorted azimuth and elevation data
azSorted = skyMaskData(:, 1);
elSorted = skyMaskData(:, 2);

% Define azimuth edges for the mask
% Ensure the azimuth edges cover the full 0-360 degree range
azEdges = [azSorted; azSorted(1)]; % Close the loop

% Define corresponding elevation mask values
elMask = [elSorted; elSorted(1)]; % Close the loop

% Create the sky plot
figure;
skyplot(0, 90); % Initialize skyplot with a dummy satellite at zenith

% Overlay the sky mask
polarplot(deg2rad(azEdges), 90 - elMask, 'b', 'LineWidth', 2); % Red line for mask

% Customize plot appearance
title('Sky Mask Visualization');
