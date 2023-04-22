%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
b=0:0.1:1;
c=2;
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

%%
beta=0.5
co=0.05:0.01:0.2
m_alv_p2=zeros(16,1);
m_art_p2=zeros(16,1);
v_pp2=zeros(16,1)
art_ox_c=zeros(16,1);
alv_ox_c=zeros(16,1)
cv_2=zeros(16,1);
for t=1:16
    c=co(t)
    setup_lung
    cvsolve
    outchecklung
    m_alv_p2(t)=PAbar;
    m_art_p2(t)=Pabar;
    v_pp2(t)=Pv;
    art_ox_c(t)=cabar;
    alv_ox_c(t)=cAbar;
    cv_2(t)=cv;
end

figure
plot(co, m_alv_p2)
hold on
plot(co, m_art_p2)
hold on
plot(co, v_pp2)
legend('Mean Alveolar Partial Pressure of Oxygen', ...
    'Mean Arterial Partial Pressure of Oxygen', ...
    'Venous Partial Pressure of Oxygen')
title('Partial Pressures of Oxygen within the Body as Inspired Oxygen Concentration Increases')
hold off

figure
plot(co, alv_ox_c)
hold on
plot(co, art_ox_c)
hold on
plot(co, cv_2)
legend('Mean Alveolar Concentration of Oxygen', ...
    'Mean Arterial Concentration of Oxygen', ...
    'Venous Concentration of Oxygen')
title('Concentration of Oxygen within the Body as Inspired Oxygen Concentration Increases')
hold off



