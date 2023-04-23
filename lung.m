%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
b=0:0.1:1;
c=0.2;
m=zeros(11, 1);
p_insp=zeros(11,1);
m_alv_p=zeros(11,1);
m_art_p=zeros(11,1);
v_pp=zeros(11,1);

for i=1:11
    beta=b(i);
    setup_lung
    m(i)=Q'*(carterial(0,r)-0);
    cvsolve
    outchecklung
    p_insp(i)=PI;
    m_alv_p(i)=PAbar;
    m_art_p(i)=Pabar;
    v_pp(i)=Pv;
end
%% Plotting
figure()
plot(b, p_insp)
hold on
plot(b, m_alv_p)
hold on
plot(b, m_art_p)
hold on
plot(b, v_pp)
legend('Inspired Partial Pressure of Oxygen', ...
    'Mean Alveolar Partial Pressure of Oxygen', ...
    'Mean Arterial Partial Pressure of Oxygen', ...
    'Venous Partial Pressure of Oxygen')
title('Oxygen Partial Pressures as a Function of Beta')
xlabel('Beta')
ylabel('Partial Pressure')
hold off

figure()
plot(b,m)
title('Max Sustainable Rate of Oxygen Consumption as a Function of Beta')
xlabel('Beta')
ylabel('Max Sustainable Rate of Oxygen Consumption')

%% Task 5 - code
beta=0.5
ox_at_altitudes=[0.209, 0.201, 0.186, 0.173, 0.160, 0.148, 0.137, 0.127, 0.118, 0.110, 0.101, 0.094, 0.087, 0.081, 0.075, 0.069]
cInew=ox_at_altitudes/(22.4*(310/273));

% Initialize New Matrices
m_alv_p2=zeros(16,1); 
m_art_p2=zeros(16,1);
v_pp2=zeros(16,1)
art_ox_c=zeros(16,1);
alv_ox_c=zeros(16,1)
cv_2=zeros(16,1);

for t=1:16
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
hold off

%% Task 6
altitudes=[0, 305, 914, 1524, 2134, 2743, 3353, 3962, 4572, 5182, 5791, 6401, 7010, 7620, 8230, 8839]
ox_at_altitudes=[0.209, 0.201, 0.186, 0.173, 0.160, 0.148, 0.137, 0.127, 0.118, 0.110, 0.101, 0.094, 0.087, 0.081, 0.075, 0.069]
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
hold off

