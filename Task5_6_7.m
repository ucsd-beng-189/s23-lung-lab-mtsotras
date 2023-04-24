clear all
close all
clf
global Pstar cstar n maxcount M Q camax RT cI;

%% Task 5 - code
beta=0.5
ox_at_altitudes=[0.209, 0.201,0.194, 0.186, 0.179, 0.173, 0.166, 0.160, 0.154, 0.148,0.143 0.137, 0.132, 0.127, 0.123, 0.118, 0.114, 0.110, 0.105, 0.101, 0.097, 0.094, 0.090, 0.087, 0.084, 0.081,0.078, 0.075, 0.072, 0.069]/0.209
cInew=ox_at_altitudes/(22.4*(310/273));

% Initialize New Matrices
m_alv_p2=zeros(30,1); 
m_art_p2=zeros(30,1);
v_pp2=zeros(30,1)
art_ox_c=zeros(30,1);
alv_ox_c=zeros(30,1)
cv_2=zeros(30,1);
d=1 % can change for anemia

for t=1:30
    c=ox_at_altitudes(t)
    setup_lung
    cvsolve
    outchecklung
    m_alv_p2(t)=PAbar; % Mean Alveolar Partial Pressure of Oxygen
    m_art_p2(t)=Pabar; % Mean Arterial Partial Pressure of Oxygen
    v_pp2(t)=Pv; % Venous Partial Pressure of Oxygen
    art_ox_c(t)=cabar; % Alveolar Concentration of Oxygen
    alv_ox_c(t)=cAbar; % Arterial Concentration of Oxygen
    cv_2(t)=cv; % Venous Concentration of Oxygen
end
%% Task 5 - plotting
figure
plot(cInew, m_alv_p2)
hold on
plot(cInew, m_art_p2)
hold on
plot(cInew, v_pp2)
legend('Mean Alveolar Partial Pressure of Oxygen', ...
    'Mean Arterial Partial Pressure of Oxygen', ...
    'Venous Partial Pressure of Oxygen')
title('Partial Pressures of Oxygen within the Body as Inspired Oxygen Concentration Increases')
xlabel('Concentration of Inspired Oxygen (moles/liter)')
ylabel('Partial Pressure of Oxygen in  Body (mmHg)')
hold off

figure
plot(cInew, alv_ox_c)
hold on
plot(cInew, art_ox_c)
hold on
plot(cInew, cv_2)
legend('Mean Alveolar Concentration of Oxygen', ...
    'Mean Arterial Concentration of Oxygen', ...
    'Venous Concentration of Oxygen')
title('Concentration of Oxygen within the Body as Inspired Oxygen Concentration Increases')
xlabel('Concentration of Inspired Oxygen (moles/liter)')
ylabel('Concentration of Oxygen in  Body (moles/liter)')
ylim([0 0.009])
hold off

%% Task 6
altitudes=[0, 305, 610, 914, 1219, 1524, 1829, 2134,2438, 2743,3048, 3353,3658, 3962, 4267, 4572,4877, 5182,5486, 5791, 6096,6401,6706, 7010,7315, 7620,7925, 8230,8534, 8839]
ox_at_altitudes=[0.209, 0.201,0.194, 0.186, 0.179, 0.173, 0.166, 0.160, 0.154, 0.148,0.143 0.137, 0.132, 0.127, 0.123, 0.118, 0.114, 0.110, 0.105, 0.101, 0.097, 0.094, 0.090, 0.087, 0.084, 0.081,0.078, 0.075, 0.072, 0.069]/0.209
cInew=ox_at_altitudes/(22.4*(310/273));

figure
plot(altitudes, m_alv_p2)
hold on
plot(altitudes, m_art_p2)
hold on
plot(altitudes, v_pp2)
legend('Mean Alveolar Partial Pressure of Oxygen', ...
    'Mean Arterial Partial Pressure of Oxygen', ...
    'Venous Partial Pressure of Oxygen')
title('Partial Pressures of Oxygen within the Body as Inspired Oxygen Concentration Increases')
ylabel('Partial Pressure of Oxygen in Body (mmHg)')
xlabel('Altitude (meters)')
hold off

figure
plot(altitudes, alv_ox_c)
hold on
plot(altitudes, art_ox_c)
hold on
plot(altitudes, cv_2)
legend('Mean Alveolar Concentration of Oxygen', ...
    'Mean Arterial Concentration of Oxygen', ...
    'Venous Concentration of Oxygen')
title('Concentration of Oxygen within the Body as Inspired Oxygen Concentration Increases')
ylabel('Concentration of Oxygen in Body (moles/liter)')
xlabel('Altitude (meters)')
hold off





