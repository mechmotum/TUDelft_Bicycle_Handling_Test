clear;
clc;

%% Settings
% Timing
opts.T_ref = 1/75;       % Reference sample time [s]
opts.T_udp = 1/320;      % UDP sample time [s]
opts.T_ser = 0.025;      % Serial sample time [s]
opts.T_int = 6;          % Time between the gates [s]
opts.T_hor = 5;          % Unity time horizon [s]
opts.test_len = 10;      % Length of the test in blocks [-]

% Gate settings
opts.block_len = 10;     % Number of gates in one block [-]
opts.gate_num = 7;       % Number of different gate positions [-]
opts.max_w = 0.2;        % The furthest lateral position of the gate [m]
                         % (from the centre of the treadmill)
opts.rng_seed = 20220729;% Seed for the randomized gate positions [-]

% Bicycle parameters
opts.vive_h = 0.9;       % Height of the tracker relative to ground [m]
opts.f_cut = 8;          % Low-pass filter cutoff frequency [Hz]

% Calculated options
opts.T_end = opts.T_int * opts.block_len; % Length of one block [s]
opts.n_hor = opts.T_hor / opts.T_ref; % Number of steps in Unity horizon [-]

%% Generate reference
% Set-up the random number generator
rng(opts.rng_seed, 'twister');

% Generate a random sequence of gates
rawSequence = randi([1, opts.gate_num], 1, opts.block_len);
gateLocations = linspace(-opts.max_w, opts.max_w, opts.gate_num);
for i = 1 : opts.block_len
    gateSequence(i) = gateLocations(rawSequence(i));
end

% Initialise arrays
simulinkRef = 99*ones(opts.T_end / opts.T_ref + 1, 1);
unityRef = 99*ones(opts.T_end / opts.T_ref + opts.n_hor + 1, 1);
t = 0 : opts.T_ref : opts.T_end + opts.T_hor;

% Insert the gate locations
count = 1;
for i = opts.T_int : opts.T_int : opts.T_end
    % Fill only Gate locations into Unity
    logicalIndexes = ~(t < i-0.0000001 | t > i+0.0000001);
    simulinkRef(logicalIndexes, 1) = gateSequence(count);
    unityRef(logicalIndexes, 1) = gateSequence(count);
    % Increase the counter
    count = count+1;
end

% Create structs for use in Simulink
simulinkStruct = struct(); simulinkStruct.time = {};
timeCounterStruct = struct(); timeCounterStruct.time = {};
blockCounterStruct = struct(); blockCounterStruct.time = {};

simulinkStruct.signals.values = simulinkRef;
simulinkStructInitial = simulinkStruct.signals.values(1,:);
blockCounterStruct.signals.values = ...
    zeros(size(simulinkStruct.signals.values, 1), 1);
blockCounterStruct.signals.values(end) = 1;

% Create a format string for Unity reference
str_one_val = ",%.3f";
str_all_val = "%.3f";
for i = 1 : opts.n_hor - 1
    str_all_val = str_all_val + str_one_val;
end

% Write out the Unity reference as strings
string_ref = "";
for i = 1 : opts.T_end / opts.T_ref + 1
    tempUnity = unityRef(i : (i + opts.n_hor - 1), :);
    timeCounterStruct.signals.values(i, :) = i-1;
    string_ref(i, :) = sprintf(str_all_val, reshape(tempUnity', 1, []));
end

% Write the strings to a file for Unity
fid = fopen('gate_locations.txt','w');
for i = 1:length(string_ref)
    fprintf(fid,'%s\n',string_ref(i));
end
fclose(fid);

% Clean up the workspace
clear count fid gateLocations gateSequence i logicalIndexes rawSequence t ans
clear simulinkRef str_all_val str_one_val string_ref tempRef tempUnity unityRef

%% Open Simulink
open_system("getAngleBias.slx");
calib = sim("getAngleBias.slx");
close_system("getAngleBias.slx");
open_system("HandlingTest.slx");
