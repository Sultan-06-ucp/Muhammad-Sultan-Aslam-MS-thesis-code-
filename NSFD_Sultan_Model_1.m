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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initilization
S=zeros(1,length(t));
A=zeros(1,length(t));
I=zeros(1,length(t));
T=zeros(1,length(t));
Ev=zeros(1,length(t));
Iv=zeros(1,length(t));

S(1)=0.1;  %Initial conditions
A(1)=0.0005;
I(1)=0.0001;
T(1)=0.0001;
Ev(1)=0.001;
Iv(1)=0.001;
%l=1-exp(-l);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NSFD Method
for n=1:length(t)-1
    S(n+1)=(S(n)+L*muh)/(1+L*(betah*Nv*Iv(n)+muh));
    A(n+1)=(A(n)+L*betah*Nv*S(n+1)*Iv(n))/(1+L*(muh+q1+q4));
    I(n+1)=(I(n)+L*q1*A(n+1))/(1+L*(muh+d1+q2));
    T(n+1)=(T(n)+L*q2*I(n+1))/(1+L*(muh+d2+q3));
    Ev(n+1)=(Ev(n)+L*betav*NT*I(n+1)*(1-Iv(n)))/(1+L*(betav*NT*I(n+1)+muv+alphav));
    Iv(n+1)=(Iv(n)+L*alphav*Ev(n+1))/(1+L*muv);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% R0
X=betah*Nv*alphav*betav*NT*q1;
Y=muv*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,3,1)
plot(t/365,S,'-g','linewidth',2.0)
%title('Endemic equilibrium (EE)')
xlabel('Time (years),Step size L=1 day')
ylabel('Proportion of susceptible humans')
legend ('NSFD method')
%figure
subplot(2,3,2)
plot(t/365,A,'-g','linewidth',2.0)
%title('Endemic equilibrium (EE)')
xlabel('Time (years),Step size L=1 day')
ylabel('Proportion of infected humans')
%legend ('NSFD method')
%figure
subplot(2,3,3)
plot(t/365,I,'-g','linewidth',2.0)
%title('Endemic equilibrium (EE)')
xlabel('Time (years),Step size L=1 day')
ylabel('Proportion of infectious humans')
%legend ('NSFD method')
%figure
subplot(2,3,4)
plot(t/365,T,'-g','linewidth',2.0)
%title('Endemic equilibrium (EE)')
xlabel('Time (years),Step size L=1 day')
ylabel('Proportion of under treatment humans')
%legend ('NSFD method')
%figure
subplot(2,3,5)
plot(t/365,Ev,'-g','linewidth',2.0)
%title('Endemic equilibrium (EE)')
xlabel('Time (years),Step size L=1 day')
ylabel('Proportion of infected vectors')
%legend ('NSFD method')
%figure
subplot(2,3,6)
plot(t/365,Iv,'-g','linewidth',2.0)
%title('Endemic equilibrium (EE)')
xlabel('Time (years),Step size L=1 day')
ylabel('Proportion of infectious vectors')
%legend ('NSFD method')




