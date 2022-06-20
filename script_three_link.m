clear all
close all
clc

%% DH parameters

DH.a1 = 3;
DH.a2 = 2;
DH.a3 = 1;

DH.alpha1 = 0;
DH.alpha2 = 0;
DH.alpha3 = 0;

DH.d1 = 0;
DH.d2 = 0;
DH.d3 = 0;

%% Link definition

L(1) = Link('d', DH.d1, 'a', DH.a1, 'alpha', DH.alpha1);
L(2) = Link('d', DH.d2, 'a', DH.a2, 'alpha', DH.alpha2);
L(3) = Link('d', DH.d3, 'a', DH.a3, 'alpha', DH.alpha3);

L(1).qlim = [-pi pi];
L(2).qlim = [-pi pi];
L(3).qlim = [-pi pi];

%% Robot definition

Three_Link = SerialLink(L, 'name', 'RRR')

save Three_Link Three_Link
save DH DH

q1 = [pi/2 pi/3 pi/4];
Three_Link.plot(q1)
T = Three_Link.fkine(q1)
