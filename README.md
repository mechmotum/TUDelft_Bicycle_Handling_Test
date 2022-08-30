# TUDelft Bicycle Handling Test
 
During my Master's project, I had to set up an experimental setup to be able to measure the performance of the MPC controller.
The setup involved a participant riding a bicycle on a treadmill and collecting virtual stars, for which the participant was assigned a score.
After the experiment, Jason came up with an idea to use this setup to qualitatively measure handling qualities of different bicycles.
Using the whole software package that was developed for the MPC controller would be overkill for this application, therefore this repository contains the minimum amount of software required.

## Requirements
- PC running Windows 10
- HTC Vive Tracker 3.0 + 2x Base Station 2.0
- Raspberry Pi 4 Model B 4GB (I used a headless 32-bit Raspberry OS)
- Simulink with [Simulink Desktop Real-Time](https://nl.mathworks.com/products/simulink-desktop-real-time.html), [Aerospace Blockset](https://nl.mathworks.com/products/aerospace-blockset.html) and [DSP System](https://www.mathworks.com/products/dsp-system.html) toolboxes
- [libsurvive](https://github.com/cntools/libsurvive) (currently on Raspberry Pi, but Windows should be possible)
- NeoKey Trinkey or Arduino Uno with a button

## File structure
`Arduino Uno/` and `NeoKey Trinkey/` -- A button is needed to start the trial/test. Originally, for the MPC, a personal NeoKey Trinkey was used as it had two buttons and an LED. For this application, a simple Arduino Uno with a button is enough. Code for both of them are held here.

`Raspberry Pi` -- Raspberry Pi is acting as a middle-man between HTC Vive Tracker 3.0 and Simulink. It uses `libsurvive` to receive and make sense of the raw data coming from the Tracker, and then sends it to a desktop PC running Simulink. I am using RPi since I had trouble setting `libsurvive` up on Windows and did not want to waste more time than needed.

`Simulink` -- This folder contains a MATLAB script to generate the sequence of the virtual stars, as well as a Simulink model, which is a middle-man between Raspberry Pi, Arduino Uno and Unity. The model also logs the data from the sensors for later analysis.

`Unity Game` -- Contains the executable for the visualisation of the virtual stars.

`Unity Project` -- Contains the Unity project files from which the game can be compiled.
