clc
clear all 
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% betah
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% betah
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
h=0.1;
betah=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,1)
plot(betah,R0,'-*','color','b','linewidth',1.0)
xlabel('\beta_{h}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% betav
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.1;
betav=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,2)
plot(betav,R0,'-*','color','b','linewidth',1.0)
xlabel('\beta_{v}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% alphav
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.1;
alphav=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,3)
plot(alphav,R0,'-*','color','b','linewidth',1.0)
xlabel('\alpha_{v}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NT
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.1;
NT=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv.*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,4)
plot(NT,R0,'-*','color','b','linewidth',1.0)
xlabel('N_{T}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% q1
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.08;
q1=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv.*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,5)
plot(q1,R0,'-*','color','b','linewidth',1.0)
xlabel('q_{1}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Nv
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.1;
Nv=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv.*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,6)
plot(Nv,R0,'-*','color','b','linewidth',1.0)
xlabel('N_{v}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% muh
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.1;
muh=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv*(muv+alphav).*(muh+q1+q4).*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,1)
plot(muh,R0,'-*','color','b','linewidth',1.0)
xlabel('\mu_{h}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% muv
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.1;
muv=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv.*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,2)
plot(muv,R0,'-*','color','b','linewidth',1.0)
xlabel('\mu_{v}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% q2
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.05;
q2=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv.*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,3)
plot(q2,R0,'-*','color','b','linewidth',1.0)
xlabel('q_{2}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% q4
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.1;
q4=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv.*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,4)
plot(q4,R0,'-*','color','b','linewidth',1.0)
xlabel('q_{4}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% d1
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
lambdav=300; %Rate of recruitment for vectors, %For EE(300)% For DFE(3.00)
muv=1/14; %Rate of death for vectors
betav=0.00008; %Rate of infection from human to vector
alphav=1/10; %Rate at which infected vectors becomes infectious
Nv=lambdav/muv;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=0.05;
d1=0:h:1;
X=betah*Nv*alphav*betav*NT*q1;
Y=muv.*(muv+alphav)*(muh+q1+q4)*(muh+d1+q2); %C1,C2,C3
R0=X./Y
subplot(3,2,5)
plot(d1,R0,'-*','color','b','linewidth',1.0)
xlabel('d_{1}')
%ylabel('$\mathcal{R}_{00}$','Interpreter','latex')
ylabel('$\Re_{0}$','Interpreter','latex')
%ylim([0, 2.5])
grid

