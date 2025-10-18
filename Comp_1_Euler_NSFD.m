clc
clear all 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Humans pop parameters
NT=5000; %Rate of recruitment for humans
muh=0.0000391; %Rate of death for humans
d1=0.01; %Disease mortality rate of infectious humans  %Asma AIMS 2023 paper
d2=0.001; %Disease mortality rate of under treatment humans %Asma AIMS 2023 paper
betah=0.00005; %Rate of infection from vector to human
q1=1/5; %Rate at which infected human becomes infectious
q2=0.03; %Rate of treatment of infectious humans %Asma AIMS 2023 paper
q3=0.002; %Assumed %Rate of recovery of under treatment humans
q4=0.0007; %Recovery rate of infectious humans
%r=1/14; %Rate of recovery of infectious humans

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Vector pop parameters
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L=1.0; %Time step size
t=0:L:120000; %Total time grids
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initilization for Euler method 
S=zeros(1,length(t));
A=zeros(1,length(t));
I=zeros(1,length(t));
T=zeros(1,length(t));
Ev=zeros(1,length(t));
Iv=zeros(1,length(t));

S(1)=0.1;  %Initial conditions
A(1)=0.0001;
I(1)=0.0001;
T(1)=0.0001;
Ev(1)=0.001;
Iv(1)=0.001;
%l=1-exp(-l);

for n=1:length(t)-1
    S(n+1)=S(n)+L*(muh-betah*S(n)*Iv(n)*Nv-muh*S(n));
    A(n+1)=A(n)+L*(betah*S(n)*Iv(n)*Nv-(muh+q1+q4)*A(n));
    I(n+1)=I(n)+L*(q1*A(n)-(muh+d1+q2)*I(n));
    T(n+1)=T(n)+L*(q2*I(n)-(muh+d2+q3)*T(n));
    Ev(n+1)=Ev(n)+L*(betav*I(n)*NT*(1-Ev(n)-Iv(n))-(muv+alphav)*Ev(n));
    Iv(n+1)=Iv(n)+L*(alphav*Ev(n)-muv*Iv(n));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initilization for NSFD
SN=zeros(1,length(t));
AN=zeros(1,length(t));
IN=zeros(1,length(t));
TN=zeros(1,length(t));
EvN=zeros(1,length(t));
IvN=zeros(1,length(t));

SN(1)=0.1;  %Initial conditions
AN(1)=0.0001;
IN(1)=0.0001;
TN(1)=0.0001;
EvN(1)=0.001;
IvN(1)=0.001;
%l=1-exp(-l);

for n=1:length(t)-1
    SN(n+1)=(SN(n)+L*muh)/(1+L*(betah*Nv*IvN(n)+muh));
    AN(n+1)=(AN(n)+L*betah*Nv*SN(n+1)*IvN(n))/(1+L*(muh+q1+q4));
    IN(n+1)=(IN(n)+L*q1*AN(n+1))/(1+L*(muh+d1+q2));
    TN(n+1)=(TN(n)+L*q2*IN(n+1))/(1+L*(muh+d2+q3));
    EvN(n+1)=(EvN(n)+L*betav*NT*IN(n+1)*(1-IvN(n)))/(1+L*(betav*NT*IN(n+1)+muv+alphav));
    IvN(n+1)=(IvN(n)+L*alphav*EvN(n+1))/(1+L*muv);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R0
X=betah*Nv*alphav*betav*NT*q1;
Y=muv*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot (t/365,I,'g-','linewidth',1.5)
hold on
plot (t/365,IN,'r--','linewidth',1.5)
hold off
title('Comparison of NSFD with Euler Scheme (EE)')
xlabel('Time(years),Step size L=1 days')
ylabel('Infectious human fraction')
text(50,0.005,'Both Euler and NSFD schemes converge','EdgeColor','k','linewidth',2.0)
legend ('Euler','NSFD')

% subplot(2,3,1)
% plot (t/365,I,'g-','linewidth',2.0)
% hold on
% plot (t/365,IN,'r--','linewidth',2.0)
% hold off
% xlabel('Time (Days)')
% ylabel('S(t)')
% legend('Euler','NSFD')
% 
% subplot(2,3,2)
% plot (t/365,A,'g-','linewidth',2.0)
% hold on
% plot (t/365,AN,'r--','linewidth',2.0)
% hold off
% xlabel('Time (Days)')
% ylabel('A(t)')
% %legend('Euler','NSFD')
% 
% subplot(2,3,3)
% plot (t/365,I,'g-','linewidth',2.0)
% hold on
% plot (t/365,IN,'r--','linewidth',2.0)
% hold off
% xlabel('Time (Days)')
% ylabel('I(t)')
% %legend('Euler','NSFD')
% 
% subplot(2,3,4)
% plot (t/365,T,'g-','linewidth',2.0)
% hold on
% plot (t/365,TN,'r--','linewidth',2.0)
% hold off
% xlabel('Time (Days)')
% ylabel('T(t)')
% %legend('Euler','NSFD')
% 
% subplot(2,3,5)
% plot (t/365,Ev,'g-','linewidth',2.0)
% hold on
% plot (t/365,EvN,'r--','linewidth',2.0)
% hold off
% xlabel('Time (Days)')
% ylabel('E_v(t)')
% %legend('Euler','NSFD')
% 
% subplot(2,3,6)
% plot (t/365,Iv,'g-','linewidth',2.0)
% hold on
% plot (t/365,IvN,'r--','linewidth',2.0)
% hold off
% xlabel('Time (Days)')
% ylabel('I_v(t)')
% %legend('Euler','NSFD')
% 
% %xlim([0 100])
