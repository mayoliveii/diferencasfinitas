clear all;clc;clearvars;
%% Letra a
%linha x coluna
for i=1:6
    for j=1:6
        if i==j
            m(i,j)=-4;
        else
            m(i,j)=0;
        end
    end
end
m(1,2)=1;
m(1,4)=1;
m(2,1)=1;
m(2,3)=1;
m(2,5)=1;
m(3,2)=2;
m(4,1)=1;
m(4,5)=1;
m(4,6)=1;
m(5,2)=2;
m(5,4)=2;
m(6,4)=2;
disp(m)
format bank
b= [ -25 0 0 -50 0 -150]';
mInversa= inv(m);
T= mInversa*b;

%distribuição de temperaturas resultado final
%   1        2         3         4     5      6
d= [0        0         0        0      0      0
    25     18.75      12.5     6.25    0      0
    50     37.5        25        0     0      0
    75     56.25       0         0     0      0
    100     0          0         0     0      0];
t= [25     18.75      12.5     6.25 
    50     37.5        25        0
    75     56.25       0         0
    100     0          0         0];
disp(['A distribuição de temperaturas no triângulo superior é:'])
disp(t)
D= 1; %[m]
Ll=40; %[mm]
k=1; %[W/km]
T1= 100; %[ºC]
T2= 0; %[°C]
deltaX= 10; %[mm]
deltaY= 10; %[mm]
deltaX2= 10; %[mm]
deltaY2= 15; %[mm]
n= 1.5;
Qa= k * deltaX/2 * (d(2,1) - d(1,1))/deltaY;
Qb= k * deltaX* (d(2,2)-d(1,2))/deltaY;
Qc= k * deltaX* (d(2,3)-d(1,3))/deltaY;
Qd= k * deltaX* (d(2,4)-d(1,4))/deltaY;
Qtotal = 2 * (Qa + Qb + Qc + Qd);
disp(['Calor transferido por condução:  ',num2str(Qtotal),'W/m'])
% Fator de forma
S= Qtotal/(T1-T2);
S_table41= 0.54*D;
    if S> S_table41
        disp(['O valor calculado é maior que o esperado pela tabela 4.1:  ',num2str(S),'>',num2str(S_table41)])
    elseif  S == S_table41
        disp(['O valor calculado era o esperado pela tabela 4.1:  ',num2str(S),'=',num2str(S_table41)])
    else         
        disp(['O valor calculado é menor que o esperado pela tabela 4.1:  ',num2str(S),'<',num2str(S_table41)])
    end

% Gráfico
s=pcolor(t);
s.FaceColor = 'interp';
colormap jet;
colorbar

% Letra b
M= [  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
      1   -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
      0    1  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
      0    0   1  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
      0    0   0   1  -4   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0
      1    0   0   0   0  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0   0
      0    1   0   0   0   1  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0   0
      0    0   1   0   0   0   1  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0   0
      0    0   0   1   0   0   0   1  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0   0   0
      0    0   0   0   1   0   0   0   1  -4   0   0   0   0   1   0   0   0   0   0   0   0   0   0   0
      0    0   0   0   0   1   0   0   0   0  -4   1   0   0   0   1   0   0   0   0   0   0   0   0   0
      0    0   0   0   0   0   1   0   0   0   1  -4   1   0   0   0   1   0   0   0   0   0   0   0   0
      0    0   0   0   0   0   0   1   0   0   0   1  -4   1   0   0   0   1   0   0   0   0   0   0   0
      0    0   0   0   0   0   0   0   1   0   0   0   1  -4   1   0   0   0   1   0   0   0   0   0   0
      0    0   0   0   0   0   0   0   0   1   0   0   0   1  -4   0   0   0   0   1   0   0   0   0   0
      0    0   0   0   0   0   0   0   0   0   1   0   0   0   0  -4   1   0   0   0   1   0   0   0   0
      0    0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4   1   0   0   0   1   0   0   0
      0    0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4   1   0   0   0   1   0   0
      0    0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4   1   0   0   0   1   0
      0    0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4   0   0   0   0   1
      0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0  -4   1   0   0   0
      0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4   1   0   0
      0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4   1   0
      0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4   1
      0    0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   1  -4  ];
B= [-16.7 0 0 0 0 -33.3 0 0 0 -33.3 -49.9 0 0 0 -49.9 -66.6 0 0 0 -66.6 -183.3 -100 -100 -100 -183.3]';
mInversa2= inv(M);
T_2= mInversa2*B;
%distribuição de temperaturas resultado final
 disp(['A distribuição de temperaturas é:'])
 Dist= [ 16.7   16.56   16.38   15.99   14.93   11.63
         33.3   33.16   32.96   32.64   32.11   31.58
         49.9   49.82   49.68   49.49   49.29   49.28
         66.6   66.53   66.45   66.35   66.29   66.34
         83.3   83.26   83.22   83.19   83.17   83.20
          100    100     100     100     100     100 ];
 disp(Dist)
%% Calor transferido por condução no problema B
q1= k * (deltaX2)*((16.7-0)/deltaY2);
q2= k * deltaX2*((16.56-0)/deltaY2);
q3= k * deltaX2*((16.38-0)/deltaY2);
q4= k * deltaX2*((15.99-0)/deltaY2);
q5= k * deltaX2*((14.93-0)/deltaY2);
q6= k * (deltaX2)*((11.63-0)/deltaY2);
Qtotal_Bb= (q1 + q2 + q3 + q4 + q5 + q6)+Qtotal;
Qtotal_B= (q1 + q2 + q3 + q4 + q5 + q6);
disp(['Calor transferido por condução na letra B é:  ',num2str(Qtotal_Bb),'W/m'])
%% Fator de forma
Sb= Qtotal_B/(T1-T2);
disp(['Fator de forma: ',num2str(Sb)'.'])
%% Gráfico
MM= [    33.3   33.16   32.96   32.64   32.11   31.58
         49.9   49.82   49.68   49.49   49.29   49.28
         66.6   66.53   66.45   66.35   66.29   66.34
         83.3   83.26   83.22   83.19   83.17   83.20];

L=pcolor(MM)
L.FaceColor = 'interp';
colormap jet;
colorbar
