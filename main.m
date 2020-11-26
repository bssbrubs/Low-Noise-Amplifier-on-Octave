clear;
clc;
%Defining Two-Ports S Parameters

% Device:      HMC-ALH310
% Description: GaAs HEMT Low Noise Amplifier
% Frequency:   37.00 - 42.00 GHz
% Package:     DIE
% Ports:       2 RF, 4 DC
%              Pad 1 = RF In  = Port 1
%              Pad 2 = RF Out = Port 2
%              Pad 3 = Vdd
%              Pad 4 = Vgg
%
% Voltages:    Vdd = +2.500 Volts  Idd =  52.4 mA
%              Vgg = -0.485 Volts  Igg =   0.1 uA
vdd = 2.5; %Power source voltage
idd = 0.0524; %current source in ampere
powerdB = (2.5^2)*idd; %power in dB

%Characteristic impendance
z0 = 50;

%Operation frequency
frequency = 25:45;

%Define S-Parameters
%[s11, s12, s21, s22]; 
%s11 the input port voltage reflection coefficient
%s12 the reverse voltage gain
%s21 the forward voltage gain
%s22 the output port voltage reflection coefficient
s_parameters = [-1.732, 6.760, -53.460, -5.866;
 -1.419, 8.124, -57.388, -6.062;
 -1.124, 9.413, -51.531, -6.366;
 -0.810, 11.017, -52.748, -6.709; 
 -0.538, 12.470, -48.672, -7.086;
 -0.395, 13.923, -48.799, -7.514;
 -0.327, 15.732, -47.756, -7.991;
 -0.318, 17.564, -46.004, -8.591;
 -0.629, 19.257, -46.094, -9.892;
 -1.296, 20.667, -43.642, -11.156;
 -2.509, 22.187, -41.972, -13.116;
 -4.800, 23.167, -40.999, -16.064;
 -8.072, 23.660, -39.630, -16.175;
 -9.903, 23.550, -40.181, -12.629;
 -8.988, 23.300, -40.198, -10.362;
 -7.034, 22.598, -40.822, -8.431;
 -5.654, 21.640, -42.287, -6.997;
 -4.999, 21.228, -43.151, -5.973;
 -4.705, 20.328, -43.800, -5.198;
 -4.070, 19.284, -43.500, -4.485;
 -4.548, 17.272, -42.738, -3.933];

%Define temperature
te = 1:1:25; %input noise temperature
to = 25; %reference temperature

%Gains
linear_gain = linear_gain(s_parameters);
log_gain = log_gain(s_parameters);
figure (1);
plot(frequency, linear_gain, frequency, log_gain);
title ("Gain x Frequency");
h = legend ({"Linear"}, "Logarithm");
legend (h, "location", "northeastoutside");
xlabel ("Frequency (GHz)");
ylabel ("Gain (dB)");

%Loss
loss = loss(s_parameters);
figure (2);
plot(frequency, loss(1, :), frequency, loss(2, :));
title ("Loss x Frequency");
h = legend ({"Input Return"}, "Output Return");
legend (h, "location", "northeastoutside");
xlabel ("Frequency (GHz)");
ylabel ("Loss (dB)");

%Power Output
power_output = power_output(linear_gain, powerdB);
figure (3);
plot(frequency, power_output);
title ("Power Output  x Frequency");
xlabel ("Frequency (GHz)");
ylabel ("Power Output (dB)");

%Noise parameters
rn = 10; %equivalent Noise resistance
fmin = 3.5; %figure noise minimal in dB

%Noise Figure
figure_noise = noise_figure(s_parameters, fmin, rn, z0);
figure (4);
plot(frequency, figure_noise);
title ("Figure Noise  x Frequency");
xlabel ("Frequency (GHz)");
ylabel ("Figure Noise (dB)");

%VSWR - Voltage standing wave ratio
vswr = vswr(s_parameters);
figure (5);
plot(frequency, vswr(1, :), frequency, vswr(2, :));
title ("Voltage Standing Wave Ratio  x Frequency");
xlabel ("Frequency (GHz)");
ylabel ("VSWR (dB)");
