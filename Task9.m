clear all
close all
clf
global Pstar cstar n maxcount M Q camax RT cI;
beta=0.5
% Initialize New Matrices
insp_pp=zeros(20,1);
alv_pp=zeros(20,1);
art_pp=zeros(20,1);
v_pp=zeros(20,1);
art_c=zeros(20,1);
alv_c=zeros(20,1);
v_c=zeros(20,1);
insp_c=zeros(20,1);
cstar_new=zeros(20,1)

% percentages of cref for cstar
d_per=1.0:-0.05:0.01

for t=1:20
    c=1
    d=d_per(t)
    setup_lung
    cvsolve
    outchecklung
    insp_pp(t)= PI; %inspired air partial pressure
    alv_pp(t)=PAbar; % Mean Alveolar Partial Pressure of Oxygen
    art_pp(t)=Pabar; % Mean Arterial Partial Pressure of Oxygen
    v_pp(t)=Pv; % Venous Partial Pressure of Oxygen
    
    insp_c(t)=cI;
    alv_c(t)=cAbar; % Alveolar Concentration of Oxygen
    art_c(t)=cabar; % Arterial Concentration of Oxygen
    v_c(t)=cv; % Venous Concentration of Oxygen
end
%%
cstar_new=d_per*cref;

figure
plot(cstar_new, insp_pp)
hold on
plot(cstar_new, alv_pp)
hold on
plot(cstar_new, art_pp)
hold on
plot(cstar_new, v_pp)
hold on
legend('Inspired Oxygen Partial Pressure', ...
    'Mean Alveolar Partial Pressure of Oxygen', ...
    'Mean Arterial Partial Pressure of Oxygen', ...
    'Venous Partial Pressure of Oxygen')
title('Partial Pressures of Oxygen within the Body as Inspired Oxygen Concentration Increases')
xlabel('Concentration of Hemoglobin in blood (moles/liter)')
ylabel('Partial Pressure of Oxygen in  Body (mmHg)')
hold off

figure
plot(cstar_new, insp_c)
hold on
plot(cstar_new, alv_c)
hold on
plot(cstar_new, art_c)
hold on
plot(cstar_new, v_c)
hold on
legend('Inspired Oxygen Concentration', ...
    'Mean Alveolar Concentration of Oxygen', ...
    'Mean Arterial Concentration of Oxygen', ...
    'Venous Concentration of Oxygen')
title('Concentration of Oxygen within the Body as Inspired Oxygen Concentration Increases')
xlabel('Concentration of Hemoglobin in blood (moles/liter)')
ylabel('Partial Pressure of Oxygen in  Body (mmHg)')
hold off

%% Task 10
% uses Task5_6_7.m script, just changing the value of d







