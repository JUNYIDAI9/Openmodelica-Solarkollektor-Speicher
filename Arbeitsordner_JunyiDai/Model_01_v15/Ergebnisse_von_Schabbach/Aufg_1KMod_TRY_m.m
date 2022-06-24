%%
clear all
clc

%% Wetterdaten einlesen aus OpenModelica "Germany_KasselTRYnormal_txt.txt"
opts = delimitedTextImportOptions(¡®NumVariables¡¯, 9);
opts.DataLines = [5, Inf];
opts.Delimiter = "\t";
opts.VariableNames = ["hy", "p", "Ta", "RH", "G_Bh", "G_Dh", "N", "FF", "DD"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
Weather_TRY_KS = readtable(¡®D:\HSN Cloud\Studieren Cloud\2020 Abschlussarbeiten\BA Dai Junyi\Aufgaben 01 02\Germany_KasselTRYnormal_txt.txt¡¯, opts);
clear opts
%%
tm_om = Weather_TRY_KS.hy;  % Zeitangabe für Messwerte
Ta_om  = Weather_TRY_KS.Ta;
Gbh_om = Weather_TRY_KS.G_Bh;     % KS, direkt, horiz,
Gdh_om = Weather_TRY_KS.G_Dh;     % KS, direkt, horiz,
w_om   = Weather_TRY_KS.FF;     % KS, direkt, horiz,


%% Wetterdaten Carnot
load DE_TRY2010_07_averageYear  % 


%% Simulation
t_start = 0*24*3600;
t_end   = 365*24*3600;
sampletime = 3600;% -1 for all
dt_sim = 3600;
slope = 45;
azimuth = 0;


%%
clc
sim('Aufg_1KMod_TRY.slx')

%% Zuordnung Ergebnisse
ts = Ergebnisse(2:end,1);
Ta =  Ergebnisse(2:end,2);
Gbh =  Ergebnisse(2:end,3);
Gdh =  Ergebnisse(2:end,4);
GbT =  Ergebnisse(2:end,5);
GdT =  Ergebnisse(2:end,6);


%%  Plots
figure(1)
subplot(1,3,1)
 plot(Ta,Ta_om)
 grid
 title('T_a')
 subplot(1,3,2)
 plot(Gbh,Gbh_om)
 grid
 title('Gbh')
 subplot(1,3,3)
 plot(Gdh,Gdh_om)
 grid
 title('Gdh')

figure(2)
plot(ts/3600,GdT+GbT,'.-g'), hold on
plot(ts/3600,GdT,'b')
plot(ts/3600,GbT,'r'),hold off
grid
title('GbT und GdT')
