%filename: lung.m (main program)
clear all
clf
global Pstar cstar n maxcount M Q camax RT cI;
b=0:0.1:1;
c=1;
m=zeros(11, 1);
p_insp=zeros(11,1);
m_alv_p=zeros(11,1);
m_art_p=zeros(11,1);
v_pp=zeros(11,1);
d=1

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
xlabel('Beta (heterogeneity parameter)')
ylabel('Partial Pressure (mmHg)')
hold off

figure()
plot(b,m)
title('Max Sustainable Rate of Oxygen Consumption as a Function of Beta')
xlabel('Beta (heterogeneity parameter)')
ylabel('Max Sustainable Rate of Oxygen Consumption (moles/minute)')

