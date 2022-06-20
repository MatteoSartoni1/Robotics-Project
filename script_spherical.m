clear all
close all
clc

%% DH Parameters

DH.a1 = 0;
DH.a2 = 0;
DH.a3 = 0;

DH.d1 = 1;
DH.d2 = 5;

DH.alpha1 = -pi/2;
DH.alpha2 = pi/2;
DH.alpha3 = 0;

DH.theta3 = 0;

%% Link definition

L(1) = Link('d', DH.d1, 'a', DH.a1, 'alpha', DH.alpha1);
L(2) = Link('d', DH.d2, 'a', DH.a2, 'alpha', DH.alpha2);
L(3) = Link('theta', DH.theta3, 'a', DH.a3, 'alpha', DH.alpha3, 'offset', 0.5);

L(1).qlim = [-pi pi];
L(2).qlim = [-pi pi];
L(3).qlim = [0 3];

%% Parameters

m_link = 50;
mm = 0;

L(1).m = m_link + mm;
L(2).m = m_link + mm;
L(3).m = m_link + mm;

%% Robot definition

Spherical = SerialLink(L,'name','RRP')

save Spherical Spherical
save DH DH

q_1 = [pi/2 pi/4 2];
Spherical.plot(q_1)
J = Spherical.jacob0(q_1)
T = Spherical.fkine(q_1)
q_inv = Spherical.ikine(T)
