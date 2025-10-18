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
L=12.0; %Time step size
t=0:L:120000; %Total time grids
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initilization for RK4 method 
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
    k1=L*(muh-betah*S(n)*Iv(n)*Nv-muh*S(n));
    l1=L*(betah*S(n)*Iv(n)*Nv-(muh+q1+q4)*A(n));
    m1=L*(q1*A(n)-(muh+d1+q2)*I(n));
    n1=L*(q2*I(n)-(muh+d2+q3)*T(n));
    b1=L*(betav*I(n)*NT*(1-Ev(n)-Iv(n))-(muv+alphav)*Ev(n));
    p1=L*(alphav*Ev(n)-muv*Iv(n));
    
    k2=L*(muh-betah*(S(n)+k1/2)*(Iv(n)+p1/2)*Nv-muh*(S(n)+k1/2));
    l2=L*(betah*(S(n)+k1/2)*(Iv(n)+p1/2)*Nv-(muh+q1+q4)*(A(n)+l1/2));
    m2=L*(q1*(A(n)+l1/2)-(muh+d1+q2)*(I(n)+m1/2));
    n2=L*(q2*(I(n)+m1/2)-(muh+d2+q3)*(T(n)+n1/2));
    b2=L*(betav*(I(n)+m1/2)*NT*(1-(Ev(n)+b1/2)-(Iv(n)+p1/2))-(muv+alphav)*(Ev(n)+b1/2));
    p2=L*(alphav*(Ev(n)+b1/2)-muv*(Iv(n)+p1/2));
    
    k3=L*(muh-betah*(S(n)+k2/2)*(Iv(n)+p2/2)*Nv-muh*(S(n)+k2/2));
    l3=L*(betah*(S(n)+k2/2)*(Iv(n)+p2/2)*Nv-(muh+q1+q4)*(A(n)+l2/2));
    m3=L*(q1*(A(n)+l2/2)-(muh+d1+q2)*(I(n)+m2/2));
    n3=L*(q2*(I(n)+m2/2)-(muh+d2+q3)*(T(n)+n2/2));
    b3=L*(betav*(I(n)+m2/2)*NT*(1-(Ev(n)+b2/2)-(Iv(n)+p2/2))-(muv+alphav)*(Ev(n)+b2/2));
    p3=L*(alphav*(Ev(n)+b2/2)-muv*(Iv(n)+p2/2));
    
    k4=L*(muh-betah*(S(n)+k3)*(Iv(n)+p3)*Nv-muh*(S(n)+k3));
    l4=L*(betah*(S(n)+k3)*(Iv(n)+p3)*Nv-(muh+q1+q4)*(A(n)+l3));
    m4=L*(q1*(A(n)+l3)-(muh+d1+q2)*(I(n)+m3));
    n4=L*(q2*(I(n)+m3)-(muh+d2+q3)*(T(n)+n3));
    b4=L*(betav*(I(n)+m3)*NT*(1-(Ev(n)+b3)-(Iv(n)+p3))-(muv+alphav)*(Ev(n)+b3));
    p4=L*(alphav*(Ev(n)+b3)-muv*(Iv(n)+p3));
    
   S(n+1)=S(n)+(k1+2*k2+2*k3+k4)/6;
   A(n+1)=A(n)+(l1+2*l2+2*l3+l4)/6;
   I(n+1)=I(n)+(m1+2*m2+2*m3+m4)/6;
   T(n+1)=T(n)+(n1+2*n2+2*n3+n4)/6;
   Ev(n+1)=Ev(n)+(b1+2*b2+2*b3+b4)/6;
   Iv(n+1)=Iv(n)+(p1+2*p2+2*p3+p4)/6;
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
Y=muv*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2);
R0=X./Y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot (t/365,I,'b-','linewidth',1.5)
hold on
plot (t/365,IN,'r-','linewidth',1.5)
hold off
title('Comparison of NSFD with RK4 Scheme (EE)')
xlabel('Time(days),Step size L=12 days')
ylabel('Infectious human fraction')
text(35,-0.038,'RK4 scheme diverges and gives negative solutions','EdgeColor','r','linewidth',2.0)
legend ('RK4','NSFD')

xlim([0 200])

